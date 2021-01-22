---
title: standard.hidden
command_type: action
element_type: [standard, audio, button, canvas, controller, dropdown, html, image, mediarecorder, scale, text, textinput, tooltip, video, voicerecorder, youtube]
syntax: getX("*ELEMENT_NAME*").hidden()
description: Hides an element. If the element is printed, it occupies space on the screen but its content is not visible.
related:
  - name: standard.visible
    collection: standard-element-commands
---

<pre><code class="language-diff-javascript diff-highlight">
@newText("hidden-text", "Surprise!")
$    .hidden()
@    .print()
*,
@newButton("reveal", "Click to reveal a surprise")
@    .print()
@    .wait()
*,
@getText("hidden-text")
@    .visible()
</code></pre>

↳ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
