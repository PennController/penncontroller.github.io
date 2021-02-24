---
title: standard.hidden
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .hidden()
description: "Makes the element invisible. Note that when printed, a hidden element still occupies space on the page, but its content is not visible."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("instruction", "Guess what fruit is in the image below")
@    .print()
@,
@newImage("fruit", "pear.png")
@    .hidden()
$    .print()
@,
@newButton("reveal", "Reveal fruit")
@    .print()
@    .wait()
@,
@getImage("fruit")
@    .visible()
</code></pre>

+ Adds some text to the page, a blank space below it and a button below the blank space which, when clicked, reveals an image of a pear.

+ 		
