---
title: standard.right
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .right()
description: "Makes the element appear horizontally aligned to the right."
notes: true
---

+ **Note:** the right means the right of the container of the element, not necessarily the right of the screen.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newText("sentence", "This is a longer sentence")
@    .print()
@,
@newText("helloworld", "Hello world")
$    .right()
@    .print()
</code></pre>

+ Prints *Hello world* onto the screen, horizontally aligned to the right.		
