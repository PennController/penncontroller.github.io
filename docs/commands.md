---
layout: default
title: Commands
nav_order: 6
has_children: true
has_toc: false
---

{% assign element_commands = site.html_pages | where: "title", "Element commands" | first %}
{% assign global_commands = site.html_pages | where: "title", "Global commands" | first %}
{% assign special_commands = site.html_pages | where: "title", "Special commands" | first %}

# {{ page.title }}

## [Element commands]({{ site.baseurl }}{{ element_commands.url }})
{{ element_commands.blurb }}

### Action commands
{% include toc-collapsible.html collection=site.action-commands id=action-commands %}

### Test commands
{% include toc-collapsible.html collection=site.test-commands id=test-commands %}

---

## [Global commands]({{ site.baseurl }}{{ global_commands.url }})
{{ global_commands.blurb }}
{% include toc-collapsible.html collection=site.global-commands id=global-commands %}

---

## [Special commands]({{ site.baseurl }}{{ special_commands.url }})
{{ special_commands.blurb }}
{% include toc-collapsible.html collection=site.special-commands id=special-commands %}
