---
layout: default
title: Global commands
parent: Commands
nav_order: 2
has_children: false
has_toc: false
blurb: Used outside of a trial to manipulate the experiment as a whole.
--- 

<!-- Set collection used for [command-type] variable -->
{% assign command-type = site.global-commands %}

# {{ page.title }}

{{ page.blurb }}

<!-- Command TOC -->
{% include command-toc.html collection=command-type id=global-commands %}

---

<!-- Command blurbs -->
{% include command-blurbs.html collection=command-type %}

