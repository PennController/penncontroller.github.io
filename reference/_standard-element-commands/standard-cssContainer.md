---
title: standard.cssContainer
command_type: action
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, Youtube]
syntax: .cssContainer()
parameters:
  - name: CSS_PROPERTY
    type: string
    description: To be filled in
  - name: VALUE
    type: string
    description: To be filled in
description: Applies the specified CSS property and value pair to the container of the element.
alternates: 
  - syntax: '.cssContainer({"*CSS_PROPERTY_1*":"*VALUE_1*", "*CSS_PROPERTY_2*":"*VALUE_2*"})'
    description: Apply multiple CSS property and value pairs by using curly brackets and colons.
notes: true
related:
  - name: standard.css
    collection: standard-element-commands
---

This command affects the *container* of the element that it is called on,
meaning that any elements added to an element through a call to
[`standard.after`]({{site.baseurl}}/commands/standard-element-commands/standard-after){:target="_blank"}
or
[`standard.before`]({{site.baseurl}}/commands/standard-element-commands/standard-before){:target="_blank"}
are also affected.

<!--more-->

```javascript
newText("center", "BANANA")
    .before(newText("left", "apple"))
    .after(newText("right", "orange"))
    .css("color", "red")
    .cssContainer("background-color", "aqua")
    .print()
```

↳ Prints `appleBANANAorange` to the screen. The substring `BANANA` has a
[red](https://www.w3schools.com/colors/color_tryit.asp?hex=FF0000){:target="_blank"}
[text color](https://www.w3schools.com/cssref/pr_text_color.asp){:target="_blank"},
and the entire string has an
[aqua](https://www.w3schools.com/colors/color_tryit.asp?color=Aqua){:target="_blank"}
[background color](https://www.w3schools.com/cssref/pr_background-color.asp){:target="_blank"}.
