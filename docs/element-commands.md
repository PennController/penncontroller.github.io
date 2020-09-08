---
layout: default
title: Element commands
parent: Commands
nav_order: 1
blurb: Used within a trial to manipulate elements.
---

<!-- VARIABLE ASSIGNMENT -->
{% assign standard-actions = site.action-commands | where_exp:"page", "page.title contains 'standard'" %}
{% assign standard-tests = site.test-commands | where_exp:"page", "page.title contains 'standard'" %}
{% assign specific-actions = site.action-commands | where_exp:"page", "page.parent != 'Element commands'" %}
{% assign specific-tests = site.test-commands | where_exp:"page", "page.parent != 'Element commands'" %}


# {{ page.title }}
{{ page.blurb }}

<!-- Standard command TOC -->
<div class="d-flex">
  <div class="pl-4 pr-2 pb-4" style="flex:1" markdown="1">
  [**Standard action commands**](#standard-action-commands)
  {% include toc-same-page.html collection=standard-actions code-font=true %}
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

---

## Standard action commands
<!-- Command blurbs -->
{% include command-blurbs.html collection=standard-actions %}

## Standard test commands
<!-- Command blurbs -->
{% include command-blurbs.html collection=standard-tests %}

## Element-specific action commands
<!-- Command blurbs -->
{% include command-blurbs.html collection=specific-actions %}

## Element-specific test commands
<!-- Command blurbs -->
{% include command-blurbs.html collection=specific-tests %}
