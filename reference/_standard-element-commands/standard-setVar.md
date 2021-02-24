---
title: standard.setVar
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Function, Html, Image, Key, MediaRecorder, Scale, Selector, Text, TextInput, Timer, Tooltip, Var, Video, VoiceRecorder, Youtube]
syntax: .setVar()
parameters:
  - name:  varName 
description: "Stores the current value of the element in the Var element named *varName* (if it exists)."
notes: true
since: beta 0.3
---

+ What the current value corresponds to is specific to each element type:

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
$newVar("name")
@,
@newTextInput("nameInput", "What is your name?")
@    .once()
@    .print()
@    .wait()
$    .setVar("name")
@,
@newText("helloname")
@    .before( newText("hello", "Hello") )
$    .text( getVar("name") )
@    .print()
</code></pre>

+ Creates a Var element named *name* and adds a text box in which to enter a name. When the return/enter key is pressed while editing the input box, it disables the box and stores its value in the Var element named *name*. Then it prints a text reading *Hello name*, where *name* corresponds to the value of the Var element.		
