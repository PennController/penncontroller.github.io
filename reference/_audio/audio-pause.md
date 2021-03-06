---
title: audio.pause
command_type: "action"
syntax: .pause()
description: "Pauses the audio file."
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
$    .pause()
@    .print()
@    .wait()
</code></pre>

+ Starts playing the file *test.mp3*, pauses it after 750ms, and shows controls on the screen making it possible to resume playback.		
