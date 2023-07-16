---
---

A metaphor for a loose collection of personal notes that grows all over the place. For me this format was born out of dissatisfaction with [[Blog|blogging]]. Here I focus on present day, key takeaways, handy references and lots of associative structure to navigate.

Occasionally, and where appropriate, backed by sources, but overall — extreme amounts of personal opinions, so expect personal biases.

## Common uses

* Publishing practical summaries of more in-depth sources, like books, articles or videos
  * [Makandra cards](http://makandracards.com/makandra) serve roughly the same purpose
* Annotating and categorizing "favorites" where this feature is unavailable, e. g. in GitHub stars and bookmarks
* Keeping up-to-date descriptions of various evolving contraptions, software and hardware; e. g. [[Workplace]]; and possibly tasks around them

## Annoyances of this implementation

* It doesn't function very well with files that don't have a front-matter. It does have a plugin that adds front-matters, but it only runs when generation is run.  
  I suppose it's alright when notes are authored without Jekyll running in watch mode, and maybe not as a part of this site at all (e. g. in an [Obsidian](https://obsidian.md) vault?), but that's the workflow I got accustomed to.

## Acknowledgements

* Nick Volynkin (author of [@DocOps (Telegram)](https://t.me/docops)) for pointing me in the general direction of knowledge management.
* [Athens Research](https://github.com/athensresearch) for establishing a nice hub for finding out about all kinds of tooling for knowledge management. That's where I found the template for this website, but that's the next point.
* [Maxime Vaillancourt](https://maximevaillancourt.com/) for building the amazing [digital garden template](https://github.com/maximevaillancourt/digital-garden-jekyll-template) this very website is based on. I did make a few improvements over it (which I should probably file as PRs? feel free to snag them from my repo though, they're licensed under MIT):
  * Table of contents, when non-empty, on the right (or below on mobile) courtesy of [`allejo/jekyll-toc`](https://github.com/allejo/jekyll-toc); I was considering adding anchoring links to the headers with the "sister project" that it mentions, but with link previews it looked very messy, so I abandoned that idea.
  * The `meta` front-matter attribute on pages that hides the page from the map and the front page, which is useful for non-topical tags like [TODO](/todo#) _(I used `#` at the end of the URL to keep it working, but prevent backlinking)_ that don't add structure to the map and aren't intended to point at any particular type of content for the readers to explore. Probably.
  * Force-directed graph layout for the map pulls the currently opened note closer to the center (with a stronger force), making the map more functional on a page-by-page basis. I had to play with the force strengths a bit, some were causing the browser to hang. 🤨 Might have to dive into the algorithms to understand why. Also, removed the centering force because it was useless.
  * Force layout no longer highlights multiple nodes as active thanks to a stricter check (`==` instead of `.include`).
  * A [glossary](/glossary), backed by a dedicated folder of notes.
