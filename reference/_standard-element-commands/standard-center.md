---
title: standard.center
command_type: action
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, Youtube]
syntax: getX("*ELEMENT_NAME*").center()
description: Horizontally centers the element.
---

<pre><code class="language-diff-javascript diff-highlight">
@newButton("centered-button", "Hello, button!")
$    .center()
@    .print()
</code></pre>

↳ Prints a horizontally centered button that says `Hello, button!`.
