---
layout: default
title: Directory structure
parent: Internal documentation
has_children: true
has_toc: false
nav_order: 1
last_modified_date: november 5 2020
---

# {{ page.title}}

The PennController documentation is stored in the [penncontroller.github.io](https://github.com/PennController/penncontroller.github.io) repository:

```treeview
penncontroller.github.io/
|-- _includes/
|-- _layouts/
|-- _sass/
|-- _site/
|-- assets/
|-- docs/
|-- internal/
|-- reference/
|-- .gitignore
|-- 404.html
|-- CNAME
|-- Gemfile
|-- Gemfile.lock
|-- README.md
|-- _config.yml
|-- faq.md
|-- index.md
`-- pcibex-farm.md
```

---

#### Table of Contents

+ [`_includes/`]({{site.baseurl}}/internal/directory-structure/includes): Files that can be accessed with the Liquid `include` tag. See the Jekyll ["Includes"](https://jekyllrb.com/docs/includes/) documentation for more information.
+ [`_layouts/`]({{site.baseurl}}/internal/directory-structure/layouts): Custom page layouts.
+ [`_sass/`]({{site.baseurl}}/internal/directory-structure/sass): Custom CSS styling.
+ [`assets/`]({{site.baseurl}}/internal/directory-structure/assets): Static resource files.
+ [`docs/`]({{site.baseurl}}/internal/directory-structure/docs): Pages that appear in the main sidebar.
+ [`internal/`]({{site.baseurl}}/internal/directory-structure/internal): Internal documentation.
+ [`reference/`]({{site.baseurl}}/internal/directory-structure/reference): Custom Jekyll [Collections](https://jekyllrb.com/docs/step-by-step/09-collections/).
