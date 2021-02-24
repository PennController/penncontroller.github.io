---
title: textinput.text
command_type: "action"
syntax: .text()
parameters:
  - name: "string"
description: "(Re)sets the text in the input box."
notes: true
since: beta 0.3
---

+ Adds a one-line input box to the screen preceded with *Violets are blue, roses are red,* on its left, and a button reading *Validate*. The input box can no longer be edited after a click, and its text is replaced with "DISABLED".

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTextInput("poem", "")
@    .before( newText("flowers", "Violets are blue, roses are red, ") )
@    .print()
@,
@newButton("validate", "Validate")
@    .print()
@    .wait()
@    .remove()
@,
@getTextInput("poem")
@    .disable()
$    .text("DISABLED")
</code></pre>

+ Adds a one-line input box to the screen preceded with *Violets are blue, roses are red,* on its left, and a button reading *Validate*. The input box can no longer be edited after a click, and its text is replaced with "DISABLED".		
