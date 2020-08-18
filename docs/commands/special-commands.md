---
layout: default
title: Special commands
parent: Reference&#58; Commands
nav_order: 3
---

<!-- Set collection used for [command-type] variable -->
{% assign command-type = site.special-commands %}

# {{ page.title }}

Used within a trial, but do not manipulate elements.

---

<!-- Command blurbs -->
{% include command-blurbs.html collection=command-type %}