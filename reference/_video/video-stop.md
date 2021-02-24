---
title: video.stop
command_type: "action"
syntax: .stop()
description: "Stops the playback of the video and goes back to the start of it, making it impossible to resume from the current position later."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newVideo("skate", "skate.mp4")
@    .print()
@    .play()
@,
@newTimer("preview", 2500)
@    .start()
@    .wait()
@,
@getVideo("skate")
@    .stop()
</code></pre>

+ Prints and starts playing the file *sentence.mp4* and stops it after 2500ms. It will not be possible to resume playback from there by simply calling `play` later on.		
