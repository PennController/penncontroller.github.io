---
layout: default
title: _layouts/
parent: Directory structure
grand_parent: Internal documentation
---

## `{{ page.title }}`
{: .no_toc}

Custom page layouts.
{: .mt-4}

---

(*Last updated: September 3, 2020*)

Folder structure
{: .text-delta}

```treeview
_layouts/
|-- command.html
|-- default.html
|-- element.html
└── tutorial.html
```

---

#### Table of Contents
{: .no_toc }

+ TOC
{:toc}

---

## `command.html`
description
{: .text-delta .mt-4}

Layout for a command documentation page.

---

## `default.html`
description
{: .text-delta .mt-4}

Overrides the original [Just the Docs `./_layouts/default.html` file](https://github.com/pmarsceill/just-the-docs/blob/master/_layouts/default.html):

As of September 3, 2020 the only modification is the line `<script src="{{ "/assets/prism/prism.js" | prepend: site.baseurl }}"></script>` in the footer, which is used for the [Prism syntax highlighter]({{site.baseurl}}/internal/directory-structure/assets#prism).

---

## `element.html`
Layout for an element documentation page.

---

## `tutorial.html`
Layout for the Basic/Advanced Tutorials.