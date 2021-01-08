---
layout: command
command_type: action
element_type: audio
title: audio.disable
parent: Audio
grand_parent: Elements
syntax: getAudio("ELEMENT_NAME").disable()
description: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
---

<pre><code class="language-diff-javascript diff-highlight">
*// Option 1:
*newAudio("sentence", "test.mp3")
*    .print()
*    .play()
*    .wait()
$    .disable()
*
*// Option 2:
*newAudio("sentence", "test.mp3")
*    .print()
$    .disable()
*    .play()
*    .wait()
</code></pre>

↳ Option 1: lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

↳ Option 2: Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

<https://www.pcibex.net/wiki/audio-settings-disable/>
