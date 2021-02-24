---
title: standard.log
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Function, Html, Image, Key, MediaRecorder, Scale, Selector, Text, TextInput, Timer, Tooltip, Var, Video, VoiceRecorder, Youtube]
syntax: .log()
description: "Will add lines to the results file reporting element-specific events. See each Element page to see what gets recorded, and which parameter you can pass to `log`."
notes: true
---

+ For **Canvas** elements, **Image** elements and **Text** elements the results lines will report the timestamp corresponding to when `print` was called (if it was called).

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@
@newButton("go", "Go!")
@    .print()
@    .wait()
@,
@newText("sentence", "Hello world!")
$    .log()
@    .print()
@,
@newButton("done", "Done!")
@    .print()
@    .wait()
</code></pre>

+ 		
