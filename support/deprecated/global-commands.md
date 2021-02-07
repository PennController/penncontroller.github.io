---
title: ⚠ Global commands
nav_order: 3
blurb: Lorem ipsum dolor sit amet, consectetur adipiscing elit.
--- 

# {{ page.title }}

{{ page.blurb }}
{: .h1-blurb }

---

{% assign deprecated-global-commands = site.deprecated | where: "parent", page.title %}
{% include toc-collection.html collection=deprecated-global-commands code-font=true %}
