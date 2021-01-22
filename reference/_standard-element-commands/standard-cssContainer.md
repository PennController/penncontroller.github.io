---
title: standard.cssContainer
command_type: action
element_type: [standard, audio, button, canvas, controller, dropdown, html, image, mediarecorder, scale, text, textinput, tooltip, video, voicerecorder, youtube]
syntax: getX("*ELEMENT_NAME*").cssContainer("*CSS_PROPERTY*", "*VALUE*")
description: Applies the specified CSS property and value pair to the container of the element.
optional_parameters: 
  - syntax: getX("*ELEMENT_NAME*").cssContainer({"*CSS_PROPERTY_1*":"*VALUE_1*", "*CSS_PROPERTY_2*":"*VALUE_2*"})
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
