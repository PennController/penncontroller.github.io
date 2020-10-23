---
layout: default
title: assets/
parent: Directory structure
grand_parent: Internal documentation
---

## `{{ page.title }}`
{: .no_toc }

Static resource files.
{: .mt-4}

---

(*Last updated: October 23, 2020*)

Folder structure
{: .text-delta}

```treeview
assets/
|-- elements/
|-- images/
|-- prism/
    |-- prism.css
    `-- prism.js
`-- tutorials/
```

---

#### Table of Contents
{: .no_toc }

+ TOC
{:toc}

---

## `elements`
Contains the element type thumbnail PNG files.
{: .mt-4 }

---

## `images`
Contains miscellaneous image files.
{: .mt-4 }

---

## `prism`
Contains the JS source and CSS styling for [Prism](https://prismjs.com/index.html), a syntax highlighter. Current as of September 3, 2020, this website uses Prism instead of Rouge, the default Jekyll syntax highlighter.
{: .mt-4 }

### Using Prism
Prism is compatible with the Markdown backtick fenced code blocks:

{%- capture code -%}
{% raw %}
```javascript
PennController.ResetPrefix(null)

newTrial("first-trial",
  newText("instructions", "Press the F key if the image on the left matches the sentence. Presss the K key if the image on the right matches the sentence.")
    .center()
    .italic()
    .print()
)
```
{% endraw %}{%- endcapture -%}

{% capture result %}
```javascript
PennController.ResetPrefix(null)

newTrial("first-trial",
  newText("instructions", "Press the F key if the image on the left matches the sentence. Presss the K key if the image on the right matches the sentence.")
    .center()
    .italic()
    .print()
)
```
{% endcapture %}

{% include include-example.html code=code result=result no-back-to-top=true %}

However, Prism [diff highlighting](https://prismjs.com/plugins/diff-highlight/) is not compatible with the Markdown backticks.

To use JS diff highlighting: 
+ Surround the code block with `<pre><code class="language-diff-javascript diff-highlight">` and `</code></pre>`.
+ Add `+`, `-`, or `*` to the start of every line of the code block.
  + Start a line `+` to add a green highlight to that line.
  + Start a line with `-` to add a red highlight to that line.
  + Start all other lines with `*`, **otherwise that line will not receive syntax highlighting.** This is likely an issue with the implementation of `class="language-diff-javascript"`.
  + All spaces/indentation are *in addition to* the starting `+`, `-`, or `*` symbols. For example, if a line should be indented by 4 spaces, it should begin with `*····`, where `·` represents a space (5 characters total).


<p class="text-delta mb-2">example</p>

<div class="px-3 pt-1 pb-4 dotted-grey-dk-000">
  <p class="text-delta"><b>code</b></p> 
  <div class="border-grey-dk-000 px-4 pt-4 pb-1">
  <code>·</code> represents a space.
  <script type="text/plain" class="language-markup">
  <pre><code class="language-diff-javascript diff-highlight"> 
  *PennController.ResetPrefix(null)
  *
  +newTrial("first-trial",
  *····newText("instructions", "Press the F key if the image on the left matches the sentence. Press the K key if the image on the right matches the sentence.")
  -········.center()
  *········.italic()
  *········.print()
  *)
  </code></pre>
  </script>
  </div>

  <p class="text-delta"><b>result</b></p>
  <div class="border-grey-dk-000 px-4 pt-4 pb-1">
  <pre><code class="language-diff-javascript diff-highlight"> 
  *PennController.ResetPrefix(null)
  *
  +newTrial("first-trial",
  *    newText("instructions", "Press the F key if the image on the left matches the sentence. Press the K key if the image on the right matches the sentence.")
  -        .center()
  *        .italic()
  *        .print()
  *)
  </code></pre>
  </div>
</div>

### Removing Prism
Follow these steps to remove Prism and reenable Rouge:

1. Remove the Prism CSS styling by deleting the line `<link rel="stylesheet" href="{{ "/assets/prism/prism.css" | prepend: site.baseurl }}">` from the file [`./_includes/head_custom.html`]({{site.baseurl}}/internal/directory-structure/includes#head_customhtml). 
  + If `<link rel="stylesheet" href="{{ "/assets/prism/prism.css" | prepend: site.baseurl }}">` is the only line in `head_custom.html`, you can also just delete the file `head_custom.html`.
2. Remove the Prism JS script by deleting the file `./_layouts/default.html`, which is an override of the original [Just the Docs `default` layout](https://github.com/pmarsceill/just-the-docs/blob/master/_layouts/default.html). Deleting the local copy of `./_layouts/default.html` will revert back to the original `default` layout. 
3. Remove this section in `_config.yml` to reenable Rouge.
    ```yaml
    # disable the Rouge syntax highlighter
    markdown: kramdown
    kramdown:
      syntax_highlighter_opts:
          disable : true
    ```

---

## `tutorials`
Contains the resource files used in the [**Basic Tutorial**]({{site.baseurl}}/docs/basic-tutorial){:target="_blank"} and [**Advanced Tutorial**]({{site.baseurl}}/docs/advanced-tutorial){:target="_blank"}.
{: .mt-4 }
