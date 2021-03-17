---
title: standard.enable
command_type: "action"
relevant_elements: [Audio, Button, Controller, DropDown, Key, MediaRecorder, Scale, Selector, TextInput, Timer, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .enable()
description: "Enables any interactive feature of the element that was previously disabled."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newAudio("sentence", "test.mp3")
@    .once()
@    .print()
@,
@newKey("secret key", "R")
@    .wait()
@,
@getAudio("sentence")
$    .enable()
</code></pre>

+ Prints buttons to play/pause the audio file *test_sentence.ogg*, and disables those buttons when the file has played through (see `audio.once`).		
