---
layout: default
title: Element commands (standard)
has_children: true
has_toc: false
children_collection: standard-element-commands
children_code_font: true
parent: Commands
nav_order: 1
blurb: Commands that are defined for all PennController element types. 
---

# {{ page.title }}

{{ page.blurb }}
{: .fs-5 .fw-300 }

---

{% assign standard_action = site.standard-element-commands | where: "command_type", "action" %}
{% assign standard_test = site.standard-element-commands | where: "command_type", "test" %}

## Action commands
{% include toc-command.html collection=standard_action same_page=true %}

## Test commands
{% include toc-command.html collection=standard_test same_page=true %}

---

{% include command-blurbs.html collection=standard_action %}

---

{% include command-blurbs.html collection=standard_test %}
