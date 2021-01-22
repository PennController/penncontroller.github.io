---
title: standard.visible
command_type: action
element_type: [standard, audio, button, canvas, controller, dropdown, html, image, mediarecorder, scale, text, textinput, tooltip, video, voicerecorder, youtube]
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
