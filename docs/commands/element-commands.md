---
layout: default
title: Element commands
parent: Commands
has_children: true
has_toc: false
children_are_html_tags: true
nav_order: 1
blurb: Used within a trial and called on an element.
---

{% assign standard-action = site.standard-element-commands | where: "command_type", "action" %}
{% assign standard-test = site.standard-element-commands | where: "command_type", "test" %}
{% assign element-action = site.documents | where: "command_type", "action" | where_exp: "page", "page.parent != 'Element commands'" %}
{% assign element-test = site.documents | where: "command_type", "test" | where_exp: "page", "page.parent != 'Element commands'" %}

# {{ page.title }}

{{ page.blurb }}
{: .fs-5 .fw-300 }

---

## Standard element commands

Commands that are defined for all PennController elements. 

{% include toc-command.html collection=standard-action title="Action commands" same-page=true %}
{% include toc-command.html collection=standard-test title="Test commands" same-page=true %}

---

{% include command-blurbs.html collection=standard-action %}

---

{% include command-blurbs.html collection=standard-test %}

---

## Element-specific commands

Commands that are defined only for specific PennController elements, or that describe element-specific behavior.

{% include toc-command.html collection=element-action title="Action commands" %}
{% include toc-command.html collection=element-test title="Test commands" %}