---
layout: default
title: Directory structure
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


```treeview
penncontroller.github.io/
|-- ...
|-- reference/
    |-- _action-commands/
        |-- audio.once.md
        |-- audio-pause.md
        |-- button-callback.md
        |-- button-click.md
        |-- standard-center.md
        |-- standard-css.md
        `-- ...
    |-- _test-commands/
        |-- audio-test.hasplayed.md
        |-- button-test.pressed.md
        |-- standard-test.printed.md
        `-- ...
    |-- _core-concepts/
    |-- _elements/
    |-- _global-commands/
    |-- _how-to-guides/
    `-- _special-commands/
`-- ...
```


```treeview
penncontroller.github.io/
|-- ...
|-- reference/
    |-- _audio/
        |-- audio.once.md
        |-- audio-pause.md
        `-- audio-test.hasplayed.md
    |-- _button/
        |-- button-callback.md
        |-- button-click.md
        `-- button-test.pressed.md
    |-- _standard/
        |-- standard-center.md
        |-- standard-css.md
        `-- standard-test.printed.md
    |-- ...
    |-- _core-concepts/
    |-- _elements/
    |-- _global-commands/
    |-- _how-to-guides/
    `-- _special-commands/
`-- ...
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
