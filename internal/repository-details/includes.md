---
title: "_includes/"
last_modified_date: february 1 2021
nav_order: 1
---

# `{{ page.title }}`
{: .no_toc }

Files that can be accessed by the [`include` tag](https://jekyllrb.com/docs/includes/){:target="_blank"}.
{: .mt-4}

---

Folder structure
{: .text-delta}

```treeview
_includes/
|-- bottom-navbar.html
|-- collapsible-block.html
|-- collect-tags.html
|-- command-blurbs.html
|-- code-example.html
|-- footer_custom.html
|-- head_custom.html
|-- instructions.html
|-- label-deprecated.html
|-- label-note.html
|-- label-technical.html
|-- label.html
|-- nav.html
|-- post-excerpt.html
|-- toc-collection.html
|-- toc-command,html
`-- toc-element.html
```

---

Table of Contents
{: .text-delta }

+ TOC
{:toc}

---

## `bottom-navbar.html`

### Description
{: .no_toc }

Creates a bottom navigation bar with three sections. By default, the left and
right sections are empty, and the middle section contains a
<span class="text-delta"><a href="#">↑ back to top</a></span> link.

### Parameters
{: .no_toc }

+ *`paginator=true`*: Turns the bottom navbar into a
[paginator](https://jekyllrb.com/docs/pagination/){:target="_blank"}.
  + If `paginator=true`, the <code><var>page</var>: int</code> and
  <code><var>total</var>: int</code> parameters must also be included.
  The middle section text is
  {% raw %}`page {{ page }} of {{ total }}`{% endraw %}
  + If you do not want a paginator bottom navbar, omit the `paginator` parameter
  completely. You do not need to include `paginator=false`.
+ <code><var>previous</var>: page</code>: The page that the left section links to.
  + If `paginator=true`, the left section links to `previous`, and its text is
  `← older posts`.
  + If the `paginator` parameter is omitted, the left section links to `previous`
  and its text is
  {% raw %}`← previous page {{ previous.title }}`{% endraw %}.
+ <code><var>next</var>: page</code>: The page that the right section links to.
  + If `paginator=true`, the right section links to `next`, and its text is
  `newer posts →`.
  + If the `paginator` parameter is omitted, the right section links to `next`
  and its text is
  {% raw %}`next page → {{ next.title }}`{% endraw %}.
+ <code><var>current</var>: string</code>: The title of the current page.
  + If `paginator=true`, the `current` parameter does not do anything.
  + If the `paginator` parameter is omitted, the middle section text is
  {% raw %}`↑ back to top {{ current }}`{% endraw %}.

### Example
{: .no_toc }

{% capture raw %}
  {% raw %}
  {% assign previous_page = site.html_pages | where: "title", "Core Concepts" | first %}
  {% assign next_page = site.html_pages | where: "title", "Elements" | first %}
  {% include bottom-navbar.html previous=previous_page next=next_page current="Hello" %}
  {% endraw %}
{% endcapture %}

{% capture code %}
  {% assign previous_page = site.html_pages | where: "title", "Core Concepts" | first %}
  {% assign next_page = site.html_pages | where: "title", "Elements" | first %}
  {% include bottom-navbar.html previous=previous_page next=next_page current="Hello" %}
{% endcapture %}

{% include code-example.html raw=raw code=code %}

---

## `collapsible-blocks.html`

### Description
{: .no_toc }

Creates an expandable and collapsible block.

### Parameters
{: .no_toc }

### Example
{: .no_toc }

{% capture raw %}
  {% raw %}
  {% capture content %}
  Surprise!
  {% endcapture %}
  {% include collapsible-block.html content=content summary="Click for more details" inner-border=true outer-border=true %}
  {% endraw %}
{% endcapture %}

{% capture code %}
  {% capture content %}
  Surprise!
  {% endcapture %}
  {% include collapsible-block.html content=content summary="Click for more details" inner-border=true outer-border=true %}
{% endcapture %}

{% include code-example.html raw=raw code=code %}

+ Include `inner-border=true` argument to create a border inside the expanded block.
+ Include `outer-border=true` argument to create a border around the summary.
+ By default there are no borders.

---

## `collect-tags.html`

[Implements tagging without using a plugin.](https://longqian.me/2017/02/09/github-jekyll-tag/){:target="_blank"}

---

## `command-blurbs.html`

Creates blurbs for each item in the `collection` argument array. Each blurb
ends with a <span class="text-delta"><a href="#">Back to top</a></span> link.

If the blurb is not the last commmand in the collection, it prints a horizontal
rule after the "Back to top" link.

{% capture raw %}
  {% raw %}
  {% assign clear-command = site.special-commands | where_exp:"page", "page.title contains 'clear'" %}
  {% include command-blurbs.html collection=clear-command %}
  {% endraw %}
{% endcapture %}

{% capture code %}
  {% assign clear-command = site.special-commands | where_exp:"page", "page.title contains 'clear'" %}
  {% include command-blurbs.html collection=clear-command %}
{% endcapture %}

{% include code-example.html raw=raw code=code %}

---

## `code-example.html`

To be filled in

---

## `footer_custom.html`

Adds custom content to the original
[Just the Docs `./_layouts/default.html` file](https://github.com/pmarsceill/just-the-docs/blob/master/_layouts/default.html){:target="_blank"}.

As of October 27, 2020 `footer_custom.html` is the same as the original
[Just the Docs `footer_custom.html` file](https://github.com/pmarsceill/just-the-docs/blob/master/_includes/footer_custom.html){:target="_blank"}
with the addition of the line `<script src="/assets/prism/prism.js"></script>`,
which is the source code for the
[Prism syntax highlighter]({{site.baseurl}}/internal/directory-structure/assets#prism).

---

## `head_custom.html`

Adds custom content to the original
[Just the Docs `./_includes/head.html` file](https://github.com/pmarsceill/just-the-docs/blob/master/_includes/head.html){:target="_blank"}.

---

## `instructions.html`

Creates a <span class="label label-purple">instructions</span> block.

{%- capture raw -%}
  {% raw %}
  {% capture instructions %}
  Click **main.js** to open `main.js` in the script editor:

  ```javascript
  // Type code below this line.
  ```

  {% endcapture %}
  {% include instructions.html text=instructions %}
  {% endraw %}
{%- endcapture -%}

{% capture code %}
  {% capture instructions %}
  Click **main.js** to open `main.js` in the script editor:

  ```javascript
  // Type code below this line.
  ```

  {% endcapture %}
  {% include instructions.html text=instructions%}
{% endcapture %}

{% include code-example.html raw=raw code=code %}

---

## `label-deprecated.html`

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
ullamco laboris nisi ut aliquip ex ea commodo consequat.

---

## `label-note.html`

Creates a <span class="label label-blue">note</span> block.

{% capture raw %}
  {% raw %}
  {% capture label %}
  This is an example note. Notes support Markdown syntax, meaning that you can
  freely *italicize* and **bold** text, and even create lists:

  1. Lorem
  2. Ipsum
  3. Dolor

  + Consectetur
  + Adipsicing
  + Elit
  {% endcapture %}
  {% include label-note.html label-body=label %}
  {% endraw %}
{% endcapture %}

{% capture code %}
  {% capture label %}
  This is an example note. Notes support Markdown syntax, meaning that you can
  freely *italicize* and **bold** text, and even create lists:

  1. Lorem
  2. Ipsum
  3. Dolor

  + Consectetur
  + Adipsicing
  + Elit
  {% endcapture %}
  {% include label-note.html label-body=label %}
{% endcapture %}

{% include code-example.html raw=raw code=code %}

---

## `label-technical.html`

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
ullamco laboris nisi ut aliquip ex ea commodo consequat.

---

## `label.html`

Creates a
[label](https://pmarsceill.github.io/just-the-docs/docs/ui-components/labels/){:target="_blank"}
block.

{% capture raw %}
  {% raw %}
  {% capture label %}
  This is a label.
  {% endcapture %}
  {% include label.html label-color="purple" label-title="new label" label-body=label %}
  {% endraw %}
{% endcapture %}

{% capture code %}
  {% capture label %}
  This is a label.
  {% endcapture %}
  {% include label.html label-color="purple" label-title="new label" label-body=label %}
{% endcapture %}

{% include code-example.html raw=raw code=code %}

---

## `nav.html`

+ Overrides the original
[Just the Docs `./_includes/nav.html` file](https://github.com/pmarsceill/just-the-docs/blob/master/_includes/nav.html){:target="_blank"}:
+ Implements the [custom navigation YAML tags]({{site.baseurl}}/internal/adding-files/custom-yaml-tags#navigation-sidebar).
+ Adds a horizontal rule below the **Announcements**, **Advanced Tutorial**,
and **Commands** sections.
+ Adds hidden navigation for **Internal Documentation** section.

---

## `post-excerpt.html`

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
ullamco laboris nisi ut aliquip ex ea commodo consequat.

---

## `toc-collection.html`

Creates a **Table of Contents** list. The items in the list are taken from the
`collection` argument array.

{% capture raw %}
  {% raw %}
  {% include toc-collection.html collection=site.special-commands code-font=true %}
  {% endraw %}
{% endcapture %}

{% include code-example.html raw=raw no-output=true %}

+ TOC is an unordered list by default; include `ordered=true` argument
for an ordered list.
+ TOC entries are text font by default; include `code-font=true` argument
for code font.

---

## `toc-command.html`

Creates a **Table of Contents** table. The items in the table are taken from the
`collection` argument array.

{% capture raw %}
  {% raw %}
  {% include toc-command.html collection=site.special-commands same-page=true %}
  {% endraw %}
{% endcapture %}

{% include code-example.html raw=raw no-output=true %}

---

## `toc-element.html`

Creates a **Table of Contents** block with a list of action command and a list of
test commands.

The items in the action command list are taken from the `element-action`
and `standard-action` argument arrays, and the items in the test command list are
taken from the `element-test` and `standard-test` argument arrays.

{% capture raw %}
  {% raw %}
  {% include toc-element.html element-action=element-action element-test=element-test standard-action=standard-action standard-test=standard-test %}
  {% endraw %}
{% endcapture %}

{% include code-example.html raw=raw no-output=true %}
