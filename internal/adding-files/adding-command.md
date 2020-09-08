---
layout: default
title: Adding a command
parent: Adding files
grand_parent: Internal documentation
nav_order: 1
---

# {{ page.title}}

1. Create a Markdown (.md) file in the appropriate collection: `./reference/_action-commands`, `./reference/_test-commands`, `./reference/_global-commands`, or `./reference/_special-commands`. 
  + If the command is a standard command, the filename should begin with the prefix `standard.`. For example `standard.print.md`.
  + If the command is an element-specific command, the filename should begin with the element type. For example, `button.click.md`.
  + If the command is a global command, do not include the `PennController.` prefix. For example, `AddHost.md` and not `PennController.AddHost.md`.
2. Include the following front matter:
    ```yaml
    ---
    layout: command
    title: 
    parent: 
    grand_parent: 
    syntax: 
    blurb:
    extended_description: (optional)
    ---
    ```
    
    + `layout`:  The page layout; use `layout: command`.
    + `title`: The name of the command.
    + `parent`: The navigational parent page.
      + If the command is an element command, use `parent: <ELEMENT_TYPE>`. For example, `parent: Audio element`.
      + If the command is a global command, use `parent: Global commands`.
      + If the command is a special command, use `parent: Special commands`.
    + `grand_parent`: The navigational grandparent page. 
      + If the command is an element command, use `grand_parent: Elements`.
      + If the command is a global or special command, use `grand_parent: Commands`.
    + `syntax`: The syntax for calling the command. 
    + `blurb`: One sentence description of the command.
    + `extended_description` (*optional*) : An extended description of the command.
      + Printed in a column to the left of the element command TOC. 
      + Use `>-` if the extended description has multiple lines.

    Example:
    ```yaml
    ---
    layout: command
    title: clear
    parent: Special commands
    grand_parent: Commands
    syntax: clear()
    blurb: Removes from the screen any element that was previously added during the trial.
    ---
    ```
3. Add an example of the command:
    ````markdown
    ## Example
    ```javascript
    // example
    ```
    ````

    + "Example" should be a heading level two.
    + Add `javascript` to the opening code fence for syntax highlighting.


