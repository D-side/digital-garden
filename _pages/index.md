---
layout: page
title: Home
id: home
permalink: /
---

# 👋 Welcome!

[I'm Pavel](https://dside.ru/en/) and this is my [[digital garden]].

## ⭐ Featured topics

<ul>
  {% assign featured = site.notes | where_exp: "item", "item.path contains 'notes' and item.featured" | sort: "title" %}
  {% for entry in featured %}
  <li class="list-entry">
    <a class="internal-link" href="{{ entry.url }}">{{ entry.title }}</a>
  </li>
  {% endfor %}
</ul>

## ⌚ Latest changes

<ul>
  {% assign latest = site.notes | where_exp: "item", "item.path contains 'notes' and item.meta != true" | sort: "last_modified_at" | reverse | slice: 0, 4 %}
  {% for entry in latest %}
  {% unless entry.path contains "index.md" or entry.path contains "index.html" %}
  <li class="list-entry">
    <div><a class="internal-link" href="{{ entry.url }}">{{ entry.title }}</a> <span
        class="faded">({{ entry.last_modified_at | date: "%Y-%m-%d" }})</span></div>
  </li>
  {% endunless %}
  {% endfor %}
</ul>

## 🗺 Map of the garden

{% include notes_graph.html %}

## Additional links:

* [📚 Glossary](/glossary)
