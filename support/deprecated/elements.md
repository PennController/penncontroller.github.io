---
title: ⚠ Elements
nav_order: 1
blurb: Lorem ipsum dolor sit amet, consectetur adipiscing elit.
--- 

# {{ page.title }}

{{ page.blurb }}
{: .h1-blurb }

---

{% assign deprecated-elements = site.deprecated | where: "parent", page.title %}
{% include toc-collection.html collection=deprecated-elements code-font=true %}
