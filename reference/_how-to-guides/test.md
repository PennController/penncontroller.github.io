---
title: test
---

{% assign test = site.documents | where: "title", "standard.cssContainer" | first %}
{% assign content_array = test.content | split: site.excerpt_separator %}
{% assign excerpt_only = content_array | first | markdownify %}
{% assign content_remainder = test.content | split: site.excerpt_separator | last | markdownify %}


{{ test.title }}

---

<div style="border: 1px solid red;">
  {{ excerpt_only }}
</div>

<div style="border: 1px dashed blue;">
  {{ content_remainder }}
</div>
