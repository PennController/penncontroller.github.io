---
title: audio.remove
command_type: "action"
syntax: .remove()
description: "Removes the `<audio>` element from the screen, which contained buttons to control playback and volume."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newAudio("beep", "test.mp3")
@    .print()
@    .wait()
@,
@getAudio("beep")
@    .remove()
</code></pre>

+ Adds an interface to start/stop playing the audio file *test.mp3* onto the screen, and removes it from the screen after the audio has been fully played.		
