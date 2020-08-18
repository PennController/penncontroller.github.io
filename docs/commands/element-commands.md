---
layout: default
title: Element commands
parent: Reference&#58; Commands
nav_order: 1
---

# {{ page.title }}

Used within a trial to manipulate elements.

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
