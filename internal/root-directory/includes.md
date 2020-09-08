---
layout: default
title: ./_includes
parent: Root directory
grand_parent: Internal documentation
---

# `{{ page.title }}`
{: .no_toc }

Files that can be accessed with the Liquid `include` tag.
{: .mt-4}

---

(*Last updated: September 3, 2020*)

Folder structure
{: .text-delta}

```treeview
_includes/
|-- command-blurbs.html
|-- head_custom.html
|-- include-example.html
|-- instructions.html
|-- label-note.html
|-- label-recommended.html
|-- label.html
|-- nav.html
|-- toc-collapsible.html
|-- toc-different-page.html
|-- toc-element.html
`-- toc-same-page.html
```

---

#### Table of Contents
{: .no_toc }

+ TOC
{:toc}

---

## `command-blurbs.html`

{% capture description %}
Creates blurbs for a Collection or array of PennController commands. Ends with a <span class="text-delta"><a href="#">Back to top</a></span> link and a horizontal rule.
{% endcapture %}

{%- capture code -%}
{% raw %}{% assign clear-command = site.special-commands | where_exp:"page", "page.title contains 'clear'" %}
{% include command-blurbs.html collection=clear-command %}
{% endraw %}{%- endcapture -%}


{% capture result %}
{% assign clear-command = site.special-commands | where_exp:"page", "page.title contains 'clear'" %}
{% include command-blurbs.html collection=clear-command %}
{% endcapture %}

{% include include-example.html description=description code=code result=result %}

---

## `head_custom.html`
Adds custom content to the original [Just the Docs `./_includes/head.html` file](https://github.com/pmarsceill/just-the-docs/blob/master/_includes/head.html){:target="_blank"}. 
{: .mt-4 }

As of September 3, 2020 `head_custom.html` only contains the line 
> `<link rel="stylesheet" href="{{ "/assets/prism/prism.css" | prepend: site.baseurl }}">`

which is used to style the [Prism syntax highlighter]({{site.baseurl}}/internal/root-directory/assets#prism){:target="_blank"}.

---

## `include-example.html`
See the documentation for adding a [New `_includes` file]({{site.baseurl}}/internal/adding-files/adding-includes){:target="_blank"}.
{: .mt-4 }

---

## `instructions.html`

{% capture description %}
Creates a <span class="label label-purple">instructions</span> block; used in the [Basic Tutorial]({{site.baseurl}}/docs/basic-tutorial){:target="_blank"} and [Advanced Tutorial]({{site.baseurl}}/docs/advanced-tutorial){:target="_blank"}.
{% endcapture %}

{%- capture code -%}
{% raw %}{% capture instructions %}
Click **main.js** to open `main.js` in the script editor:

```javascript
// This is the BasicTutorial experiment.
// Type code below this line.
```
{% endcapture %}
{% include instructions.html text=instructions %}
{% endraw %}{%- endcapture -%}

{% capture result %}
{% capture instructions %}
Click **main.js** to open `main.js` in the script editor:

```javascript
// This is the BasicTutorial experiment.
// Type code below this line.
```
{% endcapture %}
{% include instructions.html text=instructions%}
{% endcapture %}

{% include include-example.html description=description code=code result=result %}

--

## `label-note.html`
{% capture description %}
Uses `./_includes/label.html` as a base; creates a yellow label that says <span class="text-delta">note</span>. 
{% endcapture %}

{%- capture code -%}
{% raw %}{% capture label %}
This is a note.
{% endcapture %}
{% include label-note.html label-body=label %}
{% endraw %}{%- endcapture -%}


{% capture result %}
{% capture label %}
This is a note.
{% endcapture %}
{% include label-note.html label-body=label %}
{% endcapture %}

{% include include-example.html description=description code=code result=result %}


---

## `label-recommended.html`
{% capture description %}
Uses `./_includes/label.html` as a base; creates a green label that says <span class="text-delta">recommended</span>. 
{% endcapture %}

{%- capture code -%}
{% raw %}{% capture label %}
It is recommended to...
{% endcapture %}
{% include label-recommended.html label-body=label %}
{% endraw %}{%- endcapture -%}


{% capture result %}
{% capture label %}
It is recommended to...
{% endcapture %}
{% include label-recommended.html label-body=label %}
{% endcapture %}

{% include include-example.html description=description code=code result=result %}
---

## `label.html`
{% capture description %}
Creates a [label](https://pmarsceill.github.io/just-the-docs/docs/ui-components/labels/){:target="_blank"} with some body text on a [`grey-lt-100`](https://pmarsceill.github.io/just-the-docs/docs/utilities/color/){:target="_blank"} background.
{% endcapture %}

{%- capture code -%}
{% raw %}{% capture label %}
This is a label.
{% endcapture %}
{% include label.html label-color="purple" label-title="new label" label-body=label %}
{% endraw %}{%- endcapture -%}


{% capture result %}
{% capture label %}
This is a label.
{% endcapture %}
{% include label.html label-color="purple" label-title="new label" label-body=label %}
{% endcapture %}

{% include include-example.html description=description code=code result=result %}

---

## `nav.html`

description
{: .text-delta .mt-4}
Overrides the original [Just the Docs `./_includes/nav.html` file](https://github.com/pmarsceill/just-the-docs/blob/master/_includes/nav.html){:target="_blank"}:

+ Includes navigation links for children "pages" that are sections of the parent page.
  + Example: [Basic Tutorial]({{site.baseurl}}/docs/basic-tutorial){:target="_blank"}
  + Parent page's front matter must include `has_children: true` and `children_are_html_tags: true`
+ Includes navigation links for children pages that are in a Collection
  + Example: [Core concepts]({{site.baseurl}}/docs/core-concepts){:target="_blank"}
  + Parent page's front matter must include `has_children: true` and `children_are_in_collection: true`
+ Hides navigation links for [Internal documentation]({{site.baseurl}}/internal/internal-documentation){:target="_blank"}.

---

## `toc-collapsible.html`

{% capture description %}
Creates an expandable/collapsible **Table of Contents** for a Collection or array. 

+ TOC entries are links to another page.
{% endcapture %}

{%- capture code -%}
{% raw %}{% include toc-collapsible.html collection=site.special-commands id=special-commands %}{% endraw %}
{%- endcapture -%}

{% capture result %}
{% include toc-collapsible.html collection=site.special-commands id=special-commands %}
{% endcapture %}

{% include include-example.html description=description code=code result=result %}

---

## `toc-different-page.html`

{% capture description %}
Creates a **Table of Contents** for a Collection or array. 

+ TOC entries are links to another page.
{% endcapture %}

{% capture code %}
{% raw %}{% include toc-different-page.html collection=site.core-concepts ordered=true %}{% endraw %}
{% endcapture %}

{% capture extra %}

+ TOC is an unordered list by default; include `ordered=true` argument for an ordered list.
+ TOC entries are text font by default; include `code-font=true` argument for code font.
{% endcapture %}

{% capture result %}
{% include toc-different-page.html collection=site.core-concepts ordered=true %}
{% endcapture %}

{% include include-example.html description=description code=code extra=extra result=result %}


---

## `toc-element.html`
{% capture description %}
Creates a right-floating **Table of Contents** for an element type's element-specific commnds.
{% endcapture %}

{%- capture code -%}
{% raw %}{% assign action-commands = site.action-commands | where_exp:"page", "page.title contains 'button'" %}
{% assign test-commands = site.test-commands | where_exp:"page", "page.title contains 'button'" %}
{% include toc-element.html actionCommands=action-commands testCommands=test-commands %}
{% endraw %}{%- endcapture -%}

{% capture result %}
{% assign action-commands = site.action-commands | where_exp:"page", "page.title contains 'button'" %}
{% assign test-commands = site.test-commands | where_exp:"page", "page.title contains 'button'" %}
<div style="display: flow-root;">
{% include toc-element.html actionCommands=action-commands testCommands=test-commands %}
</div>
{% endcapture %}

{% include include-example.html description=description code=code result=result %}

---

## `toc-same-page.html`
{% capture description %}
Creates a **Table of Contents** for a Collection or array. 

+ TOC entries are links to sections on the same page.
{% endcapture %}

{%- capture code -%}
{% raw %}{% include toc-same-page.html collection=site.special-commands code-font=true %}{% endraw %}
{%- endcapture -%}

{% capture extra %}

+ TOC is an unordered list by default; include `ordered=true` argument for an ordered list.
+ TOC entries are text font by default; include `code-font=true` argument for code font.
{% endcapture %}

{% capture result %}
{% include toc-same-page.html collection=site.special-commands code-font=true %}
{% endcapture %}

{% include include-example.html description=description code=code extra=extra result=result %}
