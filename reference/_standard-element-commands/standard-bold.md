---
title: standard.bold
command_type: "action"
relevant_elements: [Button, Controller, DropDown, Html, MediaRecorder, Scale, Text, Tooltip]
syntax: .bold()
description: "Makes any text in the element appear boldfaced."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newText("warnning", "NOTE: this text is a warning!")
$    .bold()
@    .italic()
@    .color("red")
@    .print()
</code></pre>

+ Prints a text in boldface, italic and red.		
