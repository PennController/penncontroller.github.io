---
<<<<<<< HEAD
layout: command
title: PennController.ResetPrefix
parent: Global commands
grand_parent: Commands
syntax: PennController.ResetPrefix("*prefix*")
blurb: Resets the required global command prefix `PennController.` to a desired string, typically `null` for no prefix.
extended_description: true
---

PennController is a JavaScript module. It is standard practice to add a specific prefix to every command added by a JavaScript module in order to avoid naming conflicts with commands from other modules. By default all PennController global commands begin with the prefix `PennController.`, and all PennController element commands begin with the prefix `PennController.Elements.`.

---

## Example
=======
title: PennController.ResetPrefix
syntax: PennController.ResetPrefix(null)
description: Removes the default global command prefix `PennController.`
optional_parameters: 
  - syntax: PennController.ResetPrefix("*PREFIX*")
    description: Resets the default global command prefix from `PennController.` to <code>"<var>PREFIX</var>"</code>
notes: true
---

+ something about `PennController.Elements.`

<!--more-->
>>>>>>> pcibex/master

```javascript
// example
```