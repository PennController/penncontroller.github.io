---
title: standard.css
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .css()
parameters:
  - name: "styleName"
  - name:  "style"
description: "Applies the CSS style(s) to the element."
alternates:
  - name: "{\"style name 1\": \"style 1\", \"style name 2\": \"style 2\"}"
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newText("frame", "framed")
$    .css("border", "solid 1px black")
@,
@newText("sentence", "The last word of this sentence is ")
@    .after( getText("frame") )
@    .print()
</code></pre>

+ Prints a text reading *The last word of this sentence is framed*, with the last word (*framed*) framed in a box with 1px black borders.		
