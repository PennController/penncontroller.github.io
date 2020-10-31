---
layout: default
title: Element commands
parent: Commands
has_children: true
has_toc: false
nav_order: 1
blurb: Used within a trial and called on an element.
---

<!-- VARIABLE ASSIGNMENT -->
{% assign standard-action = site.standard | where: "command_type", "action" %}
{% assign standard-test = site.standard | where: "command_type", "test" %}
{% assign specific-action = site.documents | where_exp: "page", "page.command_type == 'action' and page.parent != 'Element commands'" %}
{% assign specific-test = site.documents | where_exp: "page", "page.command_type == 'test' and page.parent != 'Element commands'" %}

# {{ page.title }}

{{ page.blurb }}
{: .fs-5 .fw-300 }

---

## Standard commands
Commands that are defined for all PennController elements. 

{% include toc-command.html collection=standard-action title="Action commands" %}
{% include toc-command.html collection=standard-test title="Test commands" %}

---

## Element-specific commands
Commands that are defined only for specific PennController elements, or that describe element-specific behavior.

{% include toc-command.html collection=specific-action title="Action commands" %}
{% include toc-command.html collection=specific-test title="Test commands" %}