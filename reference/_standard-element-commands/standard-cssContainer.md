---
title: standard.cssContainer
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .cssContainer()
parameters:
  - name: "styleName"
  - name:  "style"
description: "Applies the CSS style(s) to the container's element."
alternates:
  - name: "{\"style name 1\": \"style 1\", \"style name 2\": \"style 2\"}"
notes: true
---

+ This will affect both the element itself and any element wrapping it as added via `.before` or `.after`.

+ This command often more closely accomplishes what you want to achieve than the `.css` command.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("frame", " world")
@    .before( newText("Hello ") )
@    .css("border", "solid 1px black")
$    .cssContainer("border", "solid 1px red")
@    .print()
</code></pre>

+ Prints the text *world* preceded with the text *Hello* and adds a black frame around *world* and a red frame around the whole *Hello world* text.		
