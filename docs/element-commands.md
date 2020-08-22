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
  {% include command-toc.html collection=standard-actions id=standard-action-commands %}
  </div>
  
  <div class="pl-4 pr-2 pb-4" style="flex:1" markdown="1">
  [**Standard test commands**](#standard-test-commands)
  
  {% include command-toc.html collection=standard-tests id=standard-test-commands %}
  </div>

</div>

---

<!-- Element-specific command TOC -->
<div class="d-flex">

  <div class="pl-4 pr-2 pb-4" style="flex:1" markdown="1">
  [**Element-specific action commands**](#element-specific-action-commands)
  {% include command-toc.html collection=specific-actions id=element-specific-action-commands %}
  </div>
  
  <div class="pl-4 pr-2 pb-4" style="flex:1" markdown="1">
  [**Element-specific test commands**](#element-specific-test-commands)
  
  {% include command-toc.html collection=specific-tests id=element-specific-test-commands %}
  </div>

</div>

---

## Standard action commands

<!-- Command blurbs -->
{% include command-blurbs.html collection=standard-actions %}

---

## Standard test commands

<!-- Command blurbs -->
{% include command-blurbs.html collection=standard-tests %}

---

## Element-specific action commands

<!-- Command blurbs -->
{% include command-blurbs.html collection=specific-actions %}

---

## Element-specific test commands

<!-- Command blurbs -->
{% include command-blurbs.html collection=specific-tests %}
