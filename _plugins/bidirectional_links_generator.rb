# frozen_string_literal: true
class BidirectionalLinksGenerator < Jekyll::Generator
  def generate(site)
    graph_nodes = []
    graph_edges = []

    all_notes = site.collections['notes'].docs
    all_pages = site.pages

    all_docs = all_notes + all_pages

    # Convert all Wiki/Roam-style double-bracket link syntax to plain HTML
    # anchor tag elements (<a>) with "internal-link" CSS class
    all_docs.each do |current_note|
      all_docs.each do |note_potentially_linked_to|
        title_from_filename = File.basename(
          note_potentially_linked_to.basename,
          File.extname(note_potentially_linked_to.basename)
        ).gsub('_', ' ').gsub('-', ' ').capitalize

        # Replace double-bracketed links with label using note title
        # [[A note about cats#Section|this is a link to the note about cats]]
        current_note.content = current_note.content.gsub(
          /\[\[#{title_from_filename}(#[^\|\]]*)?\|(.+?)(?=\])\]\]/i
        ) do
          "<a class=\"internal-link\" href=\"#{note_potentially_linked_to.url}#{kramdown_anchor($1)}\">#{$2}</a>"
        end

        # Replace double-bracketed links with label using note filename
        # [[cats#Section|this is a link to the note about cats]]
        current_note.content = current_note.content.gsub(
          /\[\[#{note_potentially_linked_to.data['title']}(#[^\|\]]*)?\|(.+?)(?=\])\]\]/i
        ) do
        "<a class=\"internal-link\" href=\"#{note_potentially_linked_to.url}#{kramdown_anchor($1)}\">#{$2}</a>"
      end

        # Replace double-bracketed links using note title
        # [[a note about cats#Section]]
        current_note.content = current_note.content.gsub(
          /\[\[(#{note_potentially_linked_to.data['title']})(#[^\|\]]*)?\]\]/i
        ) do
          "<a class=\"internal-link\" href=\"#{note_potentially_linked_to.url}#{kramdown_anchor($2)}\">#{$1}</a>"
        end

        # Replace double-bracketed links using note filename
        # [[cats#Section]]
        current_note.content = current_note.content.gsub(
          /\[\[(#{title_from_filename})(#[^\|\]]*)?\]\]/i,
          "<a class=\"internal-link\" href=\"#{note_potentially_linked_to.url}\">\\1</a>"
        ) do
          "<a class=\"internal-link\" href=\"#{note_potentially_linked_to.url}#{kramdown_anchor($2)}\">#{$1}</a>"
        end
      end

      # At this point, all remaining double-bracket-wrapped words are
      # pointing to non-existing pages, so let's turn them into disabled
      # links by greying them out and changing the cursor
      current_note.content = current_note.content.gsub(/\[\[(.*)\]\]/i) do |s| # match on the remaining double-bracket links
        Jekyll.logger.warn("Link replacement: link #{s} has no destination in: #{current_note.basename}")
        <<~HTML.chomp    # replace with this HTML (\\1 is what was inside the brackets)
          <span title="There is no note that matches this link." class="invalid-link">
            <span class="invalid-link-brackets">[[</span>
            #{s}
            <span class="invalid-link-brackets">]]</span></span>
        HTML
      end
    end

    # Identify note backlinks and add them to each note
    all_notes.each do |current_note|
      # Nodes: Jekyll
      matcher = /"#{Regexp.escape(current_note.url)}(#[^"]+)?"/
      notes_linking_to_current_note = all_notes.filter do |e|
        # e.content.include?("\"#{current_note.url}\"")
        e.content.match?(matcher)
      end

      # Nodes: Graph
      graph_nodes << {
        id: note_id_from_note(current_note),
        path: current_note.url,
        label: current_note.data['title'],
        weight: (Math.log(current_note.content.length.clamp(1..)).round - 3) * 2,
        featured: current_note.data["featured"]
      } unless current_note.path.include?('_notes/index.html') ||
        current_note.data["meta"]

      # Edges: Jekyll
      current_note.data['backlinks'] = notes_linking_to_current_note

      # Edges: Graph
      notes_linking_to_current_note.each do |n|
        next if n.data["meta"]
        graph_edges << {
          source: note_id_from_note(n),
          target: note_id_from_note(current_note),
        }
      end unless current_note.data["meta"]
    end

    File.write('_includes/notes_graph.json', JSON.dump({
      edges: graph_edges,
      nodes: graph_nodes,
    }))
  end

  def note_id_from_note(note)
    note.data['title']
      .dup
      .gsub(/\W+/, ' ')
      .delete(' ')
      .to_i(36)
      .to_s
  end

  # Reproduces the fragment part of an anchored link from the original heading
  # as seen in the link like [[Page#Section]]; generating the destination id
  # using the same rules as Kramdown, which generates actual heading ids.
  def kramdown_anchor(anchor)
    return "" unless anchor
    # loosely adapted from Kramdown::Converter::Base::basic_generate_id
    # via https://github.com/gettalong/kramdown/blob/master/lib/kramdown/converter/base.rb
    id = anchor[1..-1]
    id.gsub!(/^[^a-zA-Z]+/, '')
    id.tr!('^a-zA-Z0-9 -', '')
    id.tr!(' ', '-')
    id.downcase!

    "##{id}"
  end
end

Jekyll::Hooks.register :site, :post_render do |site|
  BidirectionalLinksGenerator.new.generate(site)
end
