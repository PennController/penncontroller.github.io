---
title: Internal documentation
permalink: /internal/
nav_hide: true
nav_exclude: true
---

# {{ page.title }}

---

## Contributing documentation

Please follow these steps in order to submit your documentation:

1. Read our
  [Style Guide]({{site.baseurl}}/internal/style-guide)
  for guidelines on writing clear and consistent PennController-related documentation.

  In particular, read the section on
  [YAML tags]({{site.baseurl}}/internal/style-guide)
  for proper YAML tag formatting.
2. Follow the steps in the relevant
  [Adding files]({{site.baseurl}}/internal/adding-files)
  guide:
    {% assign guides = site.pages | where: "parent", "Adding files" %}
    <ul class="mt-0 mb-2">
    {%- for guide in guides -%}
      <li>
      <a href="{{ guide.url | prepend: site.baseurl}}">{{ guide.title }}</a>
      </li>
    {%- endfor -%}
    </ul>
3. (*Optional*): Preview your new documentation by
  [building a local copy]({{site.baseurl}}/internal/website-details#building-local-copy)
  of the PennController website.
4. [Submit a pull request]({{site.baseurl}}/internal/submitting-pr).

---

## Questions?

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
ullamco laboris nisi ut aliquip ex ea commodo consequat.
