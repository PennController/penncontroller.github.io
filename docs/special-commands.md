---
layout: default
title: Special commands
parent: Commands
nav_order: 3
blurb: Used within a trial, but do not manipulate elements.
---

<!-- Set collection used for [command-type] variable -->
{% assign command-type = site.special-commands %}

# {{ page.title }}

{{ page.blurb }}

<!-- Command TOC -->
{% include command-toc.html collection=command-type id=special-commands %}

---

<!-- Command blurbs -->
{% include command-blurbs.html collection=command-type %}
