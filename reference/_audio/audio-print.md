---
title: audio.print
command_type: "action"
syntax: .print()
description: "Adds the `<audio>` element to the screen, containing buttons to control playback and volume."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newAudio("test", "test.mp3")
$    .print()
@    .wait()
</code></pre>

+ Adds an interface with buttons to start/stop playing the audio file *test.mp3* onto the screen.		
