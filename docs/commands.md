---
title: Commands
permalink: /commands/
nav_order: 8
---

# {{ page.title }}

{% assign commands = site.html_pages | where: "parent", "Commands" %}

{% include toc-collection.html collection=commands %}
