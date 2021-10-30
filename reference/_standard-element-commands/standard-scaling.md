---
title: standard.scaling
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .scaling()
description: "Scales elements using a zoom index/to a given size/container."

---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTrial(
@    newCanvas("container", 640, 360)
@      .color("pink")
@      .add( 20, "middle at 50%", newButton("Hello"))
@      .add("right at 620px", "middle at 50%", newButton("world"))
$      .scaling("page")
@      .print("center at 50vw","middle at 50vh")
@    ,
@    getButton("Hello").wait()
@)
</code></pre>

+ In the example above, command will make sure the Canvas element and the elements it containsare stretched (preserving the ratio) so that it occupies the maximum area possible on the page.




