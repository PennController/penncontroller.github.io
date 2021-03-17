---
title: standard.italic
command_type: "action"
relevant_elements: [Button, DropDown, Scale, Text, Tooltip]
syntax: .italic()
description: "Makes any text in the element appear in italic."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("warnning", "NOTE: this text is a warning!")
@    .bold()
$    .italic()
@    .color("red")
@    .print()
</code></pre>

+ Prints a text in boldface, italic and red.		
