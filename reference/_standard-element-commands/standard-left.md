---
title: standard.left
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .left()
description: "Makes the element appear horizontally aligned to the left (default)."
notes: true
---

+ **Note:** the left means the left of the container of the element, not necessarily the left of the screen.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("helloworld", "Hello world")
@    .right()
@    .print()
@,
@newButton("left", "Align text to the left")
@    .print()
@    .wait()
@,
@getText("helloworld")
@    .left()
</code></pre>

+ Prints *Hello world* onto the screen, horizontally aligned to the left.		
