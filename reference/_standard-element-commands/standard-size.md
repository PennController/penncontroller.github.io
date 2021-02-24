---
title: standard.size
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .size()
parameters:
  - name: width
  - name:  height
description: "Resizes the element to a width of *width* pixels and a height of *height* pixels."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newImage("smiley", "pear.png")
@    .size(40, 40)
$    .print()
</code></pre>

+ Adds a 40x40px image *pear.png* onto the screen.		
