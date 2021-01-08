---
layout: command
command_type: action
element_type: [standard, audio, button, canvas, controller, dropdown, html, image, mediarecorder, scale, text, textinput, tooltip, video, voicerecorder, youtube]
title: standard.before
parent: Standard element commands
grand_parent: Commands
syntax: getX("*ELEMENT_NAME*").before(getX("*ARGUMENT_NAME*"))
description: Takes an element as an argument, and adds that element's content to the left of the element that the command is called on.
---

<pre><code class="language-diff-javascript diff-highlight">
*// Option 1: Pass a new element as an argument
*newText("center", "BANANA")
$    .before(newText("left", "apple"))
*    .after(newText("right", "orange"))
*    .print()
*
*// Option 2: Pass an existing element as an argument
*newText("left", "apple")
*,
*newText("right", "orange")
*,
*newText("center", "BANANA")
$    .before(getText("left"))
*    .after(getText("right"))
*    .print()
</code></pre>

↳ Prints `appleBANANAorange` to the screen.
