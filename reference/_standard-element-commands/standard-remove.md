---
title: standard.remove
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .remove()
description: "Removes the element from the screen. This has no effect for non-visual elements such as the purely interactive Selector elements."
notes: true
---

+ **Note** that this leaves no space where the element previously was on the page (this is really *removing* the element, not just *hiding* it).

+ **Example**

+ Adds a button that says *Click me* to the screen, and removes it after it is clicked.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newButton("clickme", "Click me")
@    .print()
@    .wait()
$    .remove()
</code></pre>

+ Adds a button that says *Click me* to the screen, and removes it after it is clicked.		
