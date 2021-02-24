---
title: audio.stop
command_type: "action"
syntax: .stop()
description: "Stops the playback of the audio and goes back to the start of it, making it impossible to resume from the current position later."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newAudio("sentence", "test.mp3")
@    .play()
@,
@newTimer("preview", 750)
@    .start()
@    .wait()
@,
@getAudio("sentence")
@    .stop()
</code></pre>

+ Starts playing the file *test.mp3* and stops it after 750ms. Calling `play` later on would **not** resume playback from there, but start all over from the beginning.		
