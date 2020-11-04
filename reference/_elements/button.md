---
layout: element
element_type: button
title: Button element
parent: Elements
has_children: true
has_toc: false
thumbnail: button.png
syntax: newButton("*ELEMENT_NAME*", "*BUTTON_TEXT*")
description: The `Button` element type creates a clickable button.
---

```javascript
newButton("click", "Click me!")
    .print()
    .wait()
```
Prints a **Button** to the screen and waits for it to be clicked.
