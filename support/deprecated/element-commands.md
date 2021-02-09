---
title: ⚠ Element commands
nav_order: 2
blurb: Lorem ipsum dolor sit amet, consectetur adipiscing elit.
--- 

# {{ page.title }}

{{ page.blurb }}
{: .h1-blurb }

---

{% assign deprecated-element-commands = site.deprecated | where: "parent", page.title %}
{% include toc-collection.html collection=deprecated-element-commands code-font=true %}
