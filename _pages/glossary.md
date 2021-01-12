---
layout: page
title: Glossary
id: glossary
permalink: /glossary
---

# 📚 Glossary

Definitions for words that may not be obvious to the readers. Thanks to link previews, these are very easy to look up! But because of how commonplace they can be, I don't think they are a useful addition to the map. So I keep a separate list for these:

---

<dl>
  {% assign notes = site.notes | where_exp: "item", "item.path contains 'notes/glossary/'" | sort: "title" %}
  {% for entry in notes %}
    <dt><a class="internal-link" href="{{ entry.url }}">{{ entry.title }}</a></dt>
  <dd>{{ entry.excerpt }}</dd>
  {% endfor %}
</dl>
