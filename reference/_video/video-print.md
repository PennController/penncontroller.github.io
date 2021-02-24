---
title: video.print
command_type: "action"
syntax: .print()
description: "Adds the `<video>` element to the screen."
notes: true
---

+ Note that if you use `play` on the Video element without printing it, the video will play anyway in the background.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newVideo("skate", "skate.mp4")
@    .print()
</code></pre>

+ Show an interface to play the video file *skate.mp4* onto the screen.		
