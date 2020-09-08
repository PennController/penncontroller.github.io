---
layout: default
title: Root directory
parent: Internal documentation
has_children: true
has_toc: false
nav_order: 1
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
`-- index.markdown
 ```

---

#### Table of Contents

+ [`./_includes`]({% link internal/root-directory/includes.md%}): Files that can be accessed with the Liquid `include` tag. See the Jekyll ["Includes"](https://jekyllrb.com/docs/includes/) documentation for more information.
+ [`./_layouts`]({% link internal/root-directory/layouts.md%}): Custom page layouts.
+ [`./_sass`]({% link internal/root-directory/sass.md%}): Custom CSS styling.
+ [`./assets`]({% link internal/root-directory/assets.md %}): Static resource files.
+ [`./docs`]({% link internal/root-directory/docs.md %}): Pages that appear in the main sidebar.
+ [`./internal`]({% link internal/root-directory/internal.md %}): Internal documentation.
+ [`./reference`]({% link internal/root-directory/reference.md %}): Custom Jekyll [Collections](https://jekyllrb.com/docs/step-by-step/09-collections/).
