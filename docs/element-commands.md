---
layout: default
title: Element commands
parent: Commands
nav_order: 1
blurb: Used within a trial to manipulate elements.
---

# {{ page.title }}

{{ page.blurb }}

<!-- Command TOC -->
<div class="d-flex">

  <div class="pl-4 pr-2 pb-4" style="flex:1" markdown="1">
  **Action commands**
  {% include command-toc.html collection=site.action-commands id=action-commands %}
  </div>
  
  <div class="pl-4 pr-2 pb-4" style="flex:1" markdown="1">
  **Test commands**
  
  {% include command-toc.html collection=site.test-commands id=test-commands %}
  </div>

</div>

---

## Action commands

<!-- Command blurbs -->
{% include command-blurbs.html collection=site.action-commands %}

---

## Test commands

<!-- Command blurbs -->
{% include command-blurbs.html collection=site.test-commands %}
