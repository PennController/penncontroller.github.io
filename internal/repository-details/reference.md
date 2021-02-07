---
layout: default
title: reference/
last_modified_date: november 9 2020
nav_order: 5
---

## `{{ page.title}}`
{: .no_toc }

Custom Jekyll [collections](https://jekyllrb.com/docs/step-by-step/09-collections/).
{: .mt-4}

---

Folder structure
{: .text-delta}

```treeview
reference/
|-- _elements/
|-- _global-commands/
|-- _how-to-guides/
|-- _special-commands/
|-- _standard-element-commands/
|-- _audio/
|-- _button/
|-- _canvas/
|-- _controller/
|-- _dropdown/
|-- _eyetracker/
|-- _function/
|-- _html/
|-- _image/
|-- _key/
|-- _mediarecorder/
|-- _mousetracker
|-- _scale
|-- _selector
|-- _text/
|-- _textinput/
|-- _timer/
|-- _tooltip/
|-- _var/
|-- _video/
`-- _youtube/
```

---

Table of contents
{: .text-delta}

<div class="command-table mt-2 mb-6">
  <div><a href="#_elements"><code>_elements</code></a></div>
  <div><a href="#_global-commands"><code>_global-commands</code></a></div>
  <div><a href="#_how-to-guides"><code>_how-to-guides</code></a></div>
  <div><a href="#_special-commands"><code>_special-commands</code></a></div>
  <div><a href="#_standard-element-commands"><code>_standard-element-commands</code></a></div>
  {% for element in site.elements %}
  <div>
      {% assign tag = element.element_type %}
      <a href="#_{{tag}}"><code>_{{tag}}</code></a>
  </div>
  {% endfor %}
</div>

---

## `_elements`
description
{: .text-delta .mt-4}

Contains .md files for element type pages.

---

## `_global-commands`
description
{: .text-delta .mt-4}

Contains .md files for global commands.

---

## `_how-to-guides`
description
{: .text-delta .mt-4}

Contains .md files for the [How-to guides]({{site.baseurl}}/how-to-guides) page.

---

## `_special-commands`
description
{: .text-delta .mt-4}

Contains .md files for special commands.

---

## `_standard-element-commands`
description
{: .text-delta .mt-4}

Contains .md files for standard element commands.


{% for element in site.elements %}
  {% assign tag = element.element_type %}
  <hr>

  <h2 id="_{{tag}}"><a href="#_{{tag}}" class="anchor-heading" aria-labelledby="_{{tag}}"><svg viewBox="0 0 16 16" aria-hidden="true"><use xlink:href="#svg-link"></use></svg></a><code>_{{tag}}</code></h2> 

  <p class="text-delta mt-4">description</p>
  <p> Contains .md files for the <a href="{{ element.url | absolute_url}}">{{ element.title }}</a>.<p>

{% endfor %}