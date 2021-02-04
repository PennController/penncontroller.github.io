---
title: standard.hidden
command_type: action
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, Youtube]
syntax: .hidden()
description: Hides an element. If the element is printed, it occupies space on the screen but its content is not visible.
related:
  - name: standard.visible
    collection: standard-element-commands
---

<pre><code class="language-diff-javascript diff-highlight">
@newText("hidden-text", "Surprise!")
$    .hidden()
@    .print()
@,
@newButton("reveal", "Click to reveal a surprise")
@    .print()
@    .wait()
@,
@getText("hidden-text")
@    .visible()
</code></pre>

+ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
