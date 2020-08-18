---
layout: default
title: Global commands
parent: Reference&#58; Commands
nav_order: 2
has_children: false
has_toc: false
--- 

<!-- Set collection used for [command-type] variable -->
{% assign command-type = site.global-commands %}

# {{ page.title }}

Used outside of a trial.

<!-- Command TOC -->
{% include command-toc.html collection=command-type id=global-commands %}

---

<!-- Command blurbs -->
{% include command-blurbs.html collection=command-type %}

