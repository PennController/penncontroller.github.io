---
layout: default
title: Adding an element
parent: Adding files
grand_parent: Internal documentation
nav_order: 2
---

# {{ page.title}}

1. Create a Markdown (.md) file in the `./reference/_elements` collection. The file name should not have any capitalized letters; if the element type name is "DropDown", the file name should be `dropdown.md`.
2. Include the following front matter:
    ```yaml
    ---
    layout: element
    title: 
    parent: Elements
    thumbnail: 
    syntax: 
    blurb: 
    extended_description: (optional)
    ---
    ```
    
    + `layout`: The page layout; use `layout: element`.
    + `title`: The name of the element type.
    + `parent`: The navigational parent page; use `parent: Elements`.
    + `thumbnail`: The name of the element type thumbnail PNG. The PNG should be in the [`./assets/elements`]({{site.baseurl}}/{% link internal/directory-structure/reference.md %}) folder.
    + `syntax`: The syntax for calling the `newX` function, where `X` is an element type. 
    + `blurb`: One sentence description of the element type. 
    + `extended_description` (*optional*) : An extended description of the element type. 
      + If the extended description has multiple lines, use the [block chomping indicator](https://yaml-multiline.info/) `>-` for proper formatting.
      + The extended description is printed to the right to the element command TOC.

    Example:
    ```yaml
    ---
    layout: element
    title: Audio element
    parent: Elements
    thumbnail: sample-element.png
    syntax: newAudio("ELEMENT_NAME", "AUDIO_FILE_NAME.MP3")
    blurb: Adds audio streams to an experiment.
    extended_description: >-   
      The `"URL"` argument can be omitted if:

      + The audio file has been uploaded to your experiment's **Resource** folder; or

      + The URL has been added as a default host URL by the command `PennController.AddHost`.

      By default, PennController preloads all resources, which means that an experiment will not start until the audio stream is stored in the browser’s cache. For more information on audio streams, see [*HTML Audio*](https://www.w3schools.com/html/html5_audio.asp).
    ---
    ```
3. (*optional*) Add any additional information about the element type. Unlike the `extended_description`, this content is printed as a full-width section under the element command TOC. 
  <img class="d-block mx-auto" src="{% link assets/images/internal/add-elements.png %}" alt="text-placement" width="75%" height="auto">

4. Add an example of the element type:
    ````markdown
    ## Example
    ```javascript
    // example
    ```
    ````
    + "Example" should be a heading level two.
    + Add `javascript` to the opening code fence for JavaScript syntax highlighting.



