---
layout: default
title: Adding a collection
parent: Adding files
grand_parent: Internal documentation
---

# {{ page.title}}

1. Define a collection in `_config.yml` in the collections section.

    Recommended settings:
    ```yaml
    collections_dir: reference
    collections:
      <COLLECTION_NAME>:
        output: true
        permalink: /docs/:collection/:name/
    ```
  See the Jekyll [Collections documentation](https://jekyllrb.com/docs/collections/) for more YAML settings.
2. Create a folder in the `./reference` folder. **The folder name must begin with an underscore**, as in `_<COLLECTION_NAME>`.
3. Add .md files to the collection folder.
4. Update the [`./reference`]({% link internal/root-directory/reference.md %}) page.
  + Change the (*Last updated:*) section to the appropriate date.
  + Add the new collection to the <span class="text-delta">folder structure</span> section.
  + Add a new section with the collection name and description.

You can access the files in a collection through the tag `site.<COLLECTION_NAME>`.
