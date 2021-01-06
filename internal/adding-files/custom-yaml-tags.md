---
layout: default
title: Custom YAML tags
parent: Adding files
grand_parent: Internal documentation
---

# {{page.title}}

---

## Bottom navigation

### `numbered_headings`

---

### `start_heading`

---

### `previous_page`

---

## Navigation sidebar

### `nav_hide`

Hides a page and all of its (grand)children from the
main navigation sidebar unless the current URL belongs to one
of said pages.

+ Example: The **Internal Documentation** page (`~/internal/internal-documentation.md`)
and all of its (grand)children are hidden.

---

### `exclude_permalink`

Lists a page on the main navigation sidebar, but does not provide a link
to the page's actual URL.

+ Example: The arrow next to the **Commands** page (`~/docs/commands.md`) expands
to show the children pages, but the **Commands** page itself is not a link.

---

### `redirect`

Redirects an entry on the main navigation sidebar to the specified URL.

+ Example: The **Versions** page (`~/docs/versions.md`) links to the
[`versions` tag page]({{site.baseurl}}/tag/versions){:target="_blank"}
instead of the [actual **Versions** page]({{site.baseurl}}/docs/versions){:target="_blank"}.

---

### `element_type`

---

### `children_code_font`

Uses `code font` when listing all of the page's children on the main navigation sidebar.

+ Example: The children pages of the **Global Commands** page (~/commands/global-commmands.md)
are listed in `code font`.

---

### `children_collection`

Uses the specified collection to create the `children_list` and `grand_children_list`
arrays. The
[default Just the Docs `./_includes/nav.html` file](https://github.com/pmarsceill/just-the-docs/blob/master/_includes/nav.html){:target="_blank"}
cannot use Jekyll collections to create (grand)children pages.

+ Example: The children pages of the **Elements** page (`~/docs/elements.md`)
are created from the `elements` collection (`~/reference/_elements/`).

---

### `children_are_html_tags`

---

### `layout`

Detects if a page belongs to an element (`layout: element`). If so,
adds the string `" element"` to the page's title.

+ Example: The listed title of the "**`Audio` element**" page (`~/reference/elements/audio.md`)
should be just **Audio**, because its title tag is `title: Audio`.

  However, the `children_code_font` tag on the parent page **Elements** (`~/docs/elements.md`)
  changes the `"Audio"` string to `code font`, and the `layout: element`
  tag adds the `" element"` string.
