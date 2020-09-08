---
layout: default
title: Elements
has_children: true
children_are_in_collection: true
has_toc: false
nav_order: 5
---

# {{ page.title }}

<ul>
{% for child in site.elements -%}
<div class="d-inline-block my-4" style="text-align:center; width:160px;">
  <a href="{{ child.url | absolute_url }}"><img src="{{ site.baseurl }}/assets/elements/{{ child.thumbnail }}" alt="{{ child.title }}" width="100" height="100" /></a>
  <br>
  <a href="{{ child.url | absolute_url }}">{{ child.title }}</a>
</div>  
{% endfor %}
</ul>
