---
title: standard.css
command_type: action
element_type: [standard, audio, button, canvas, controller, dropdown, html, image, mediarecorder, scale, text, textinput, tooltip, video, voicerecorder, youtube]
syntax: getX("*ELEMENT_NAME*").css("*CSS_PROPERTY*", "*VALUE*")
description: Applies the specified CSS property and value pair to the element.
optional_parameters: 
  - syntax: getX("*ELEMENT_NAME*").css({"*CSS_PROPERTY_1*":"*VALUE_1*", "*CSS_PROPERTY_2*":"*VALUE_2*"})
    description: Apply multiple CSS property and value pairs by using curly brackets and colons.
related:
  - name: standard.cssContainer
    collection: standard-element-commands
---

<pre><code class="language-diff-javascript diff-highlight">
@newText("framed-text", "Hello, text!")
$    .css("border", "solid 1px red")
@    .print()
*,
@newButton("orchid-smallcaps-button", "Hello, button!")
$    .css({"background-color":"orchid", "font-variant":"small-caps"})
@    .print()
</code></pre>

↳ Prints `Hello, text!` surrounded by a 1px solid red
[border](https://www.w3schools.com/cssref/pr_border.asp){:target="_blank"}.
On a new line, prints a button with an
[orchid](https://www.w3schools.com/colors/color_tryit.asp?color=Orchid){:target="_blank"}
[background color](https://www.w3schools.com/cssref/pr_background-color.asp){:target="_blank"}
that says `Hello, button!` in
[small caps](https://www.w3schools.com/cssref/pr_font_font-variant.asp){:target="_blank"}.
