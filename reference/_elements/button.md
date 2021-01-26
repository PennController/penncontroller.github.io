---
title: Button
since: beta 0.3
children_collection: button
thumbnail: button.png
parameters:
  - name: '"BUTTON_TEXT"'
    description: The text that appears on the button.
description: Represents a clickable button.
---

```javascript
newButton("click", "Click me!")
    .print()
    .wait()
```
Prints a `Button` to the screen and waits for it to be clicked.
