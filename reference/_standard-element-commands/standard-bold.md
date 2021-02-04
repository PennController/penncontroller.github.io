---
title: standard.bold
command_type: action
relevant_elements: [Button, Controller, DropDown, Html, MediaRecorder, Scale, Text, Tooltip]
syntax: .bold()
description: Bolds any text that appears in the element.
---

<pre><code class="language-diff-javascript diff-highlight">
@newText("bolded-text", "Hello, text!")
$    .bold()
@    .print()
@,
@newButton("bolded-button", "Hello, button!")
$    .bold()
@    .print()
</code></pre>

+ Prints <code><strong>Hello, text!</strong></code> in bold, then prints a button
that says <code><strong>Hello, button!</strong></code> in bold on a new line.
