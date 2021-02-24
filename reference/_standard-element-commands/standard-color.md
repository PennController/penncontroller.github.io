---
title: standard.color
command_type: "action"
relevant_elements: [Button, DropDown, Html, Scale, Text, Tooltip]
syntax: .color()
parameters:
  - name: "color"
description: "Makes any text in the element appear in the specified color. The `\"color\"` string follows CSS conventions (most common names such as *\"red\"*, *\"blue\"*, ... are valid)"
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newText("warnning", "NOTE: this text is a warning!")
@    .bold()
@    .italic()
$    .color("red")
@    .print()
</code></pre>

+ Prints a text in boldface, italic and red.		
