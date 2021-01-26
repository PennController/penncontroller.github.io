---
title: standard.visible
command_type: action
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, Youtube]
syntax: getX("ELEMENT_NAME").visible()
description: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
related:
  - name: standard.hidden
    collection: standard-element-commands
---

<pre><code class="language-diff-javascript diff-highlight">
@newText("hidden-text", "Surprise!")
@    .hidden()
@    .print()
*,
@newButton("reveal", "Click to reveal a surprise")
@    .print()
@    .wait()
*,
@getText("hidden-text")
$    .visible()
</code></pre>

↳ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
