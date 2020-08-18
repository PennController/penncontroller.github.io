---
layout: default
title: Reference&#58; Elements
has_children: true
has_toc: false
nav_order: 5
---

# {{ page.title }}

<!-- [pages_list] is an array of all html pages -->
<!-- if a [node] in [pages_list] has children and its title matches {{ page.title }}, puts its children pages in the array [children_list] -->
<!-- for every [child] in [children_list], print {{ child.thumbnail }} and {{ child.title}} as an image/text that links to {{ child.url }} -->

<ul>
{% assign pages_list = site.html_pages %}
{% for node in pages_list -%}
  {% if node.has_children and node.title == page.title %}
    {% assign children_list = pages_list | where: "parent", node.title %}
    {% for child in children_list -%}
    <div class="d-inline-block my-4" style="text-align:center; width:160px;">
      <a href="{{ child.url | absolute_url }}"><img src="{{ site.baseurl }}/assets/images/{{ child.thumbnail }}" alt="{{ child.title }}" width="100" height="100" /></a>
      <br>
      <a href="{{ child.url | absolute_url }}">{{ child.title }}</a>
    </div>  
    {% endfor %}
  {% endif %}
{% endfor %}
</ul>
