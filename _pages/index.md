---
layout: page
title: Home
id: home
permalink: /
---

# 👋 Welcome!

[I'm Pavel](https://dside.ru/en/) and this is my [[digital garden]].

## ⭐ Featured topics

* [[Fediverse]]
* [[Home automation]]
* [[Self-hosting]]
* [[Skillforest]]

## ⌚ Latest changes

<ul>
  {% assign notes = site.notes | where_exp: "item", "item.path contains 'notes'" | sort: "last_modified_at" | reverse %}
  {% for entry in notes %}
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

## ⚠ Fair warnings

This website is **very** experimental at the moment, as I'm currently trying out whether this format works for me. It's currently competing for my attention with [my main website](https://dside.ru/en/) where you can find out more about what I'm about and where to find me. This, on the other hand, is currently a sandbox.

A significant improvement over my prior blog is link preview. Try hovering over the "digital garden" link above for a taste. If you're on mobile though, you're out of luck. (But then your screen is probably too small to comfortably display them anyway and you're probably better off just following the link?)

Also, practically everything around here should be prefixed with "I think". This should go without saying, but I've somehow managed to have arguments over not saying this.
