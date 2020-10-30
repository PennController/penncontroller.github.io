---
layout: default
title: Element commands
parent: Commands
nav_order: 1
blurb: Used within a trial and called on an element.
---

<!-- VARIABLE ASSIGNMENT -->
{% assign standard-actions = site.standard | where: "command_type", "action" %}
{% assign standard-tests = site.standard | where: "command_type", "test" %}
{% assign specific-actions = site.documents | where_exp: "page", "page.command_type == 'action' and page.parent != 'Element commands'" %}
{% assign specific-tests = site.documents | where_exp: "page", "page.command_type == 'test' and page.parent != 'Element commands'" %}

# {{ page.title }}

{{ page.blurb }}

<!-- Standard command TOC -->
<div class="d-flex">
  <div class="pl-4 pr-2 pb-4" style="flex:1" markdown="1">
  [**Standard action commands**](#standard-action-commands)
  {% include toc-collection.html collection=standard-actions code-font=true %}
  </div>
  
  <div class="pl-4 pr-2 pb-4" style="flex:1" markdown="1">
  [**Standard test commands**](#standard-test-commands)
  {% include toc-same-page.html collection=standard-tests code-font=true %}
  </div>
</div>

---

<!-- Element-specific command TOC -->
<div class="d-flex">
  <div class="pl-4 pr-2 pb-4" style="flex:1" markdown="1">
  [**Element-specific action commands**](#element-specific-action-commands)
  {% include toc-same-page.html collection=specific-actions code-font=true %}
  </div>
  
  <div class="pl-4 pr-2 pb-4" style="flex:1" markdown="1">
  [**Element-specific test commands**](#element-specific-test-commands) 
  {% include toc-same-page.html collection=specific-tests code-font=true %}
  </div>
</div>
