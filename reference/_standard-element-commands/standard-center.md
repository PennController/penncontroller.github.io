---
title: standard.center
command_type: action
element_type: [standard, audio, button, canvas, controller, dropdown, html, image, mediarecorder, scale, text, textinput, tooltip, video, voicerecorder, youtube]
syntax: getX("*ELEMENT_NAME*").center()
description: Horizontally centers the element.
---

<pre><code class="language-diff-javascript diff-highlight">
*newButton("centered-button", "Hello, button!")
$    .center()
*    .print()
</code></pre>

↳ Prints a horizontally centered button that says `Hello, button!`.
