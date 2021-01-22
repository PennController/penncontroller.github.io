---
title: standard.bold
command_type: action
element_type: [standard, button, controller, dropdown, html, mediarecorder, scale, text, tooltip]
syntax: getX("*ELEMENT_NAME*").bold()
description: Bolds any text that appears in the element.
---

<pre><code class="language-diff-javascript diff-highlight">
@newText("bolded-text", "Hello, text!")
$    .bold()
@    .print()
*,
@newButton("bolded-button", "Hello, button!")
$    .bold()
@    .print()
</code></pre>

↳ Prints <code><strong>Hello, text!</strong></code> in bold, then prints a button
that says <code><strong>Hello, button!</strong></code> in bold on a new line.
