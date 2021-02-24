---
title: video.pause
command_type: "action"
syntax: .pause()
description: "Pauses the video file."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newVideo("sentence", "skate.mp4")
@    .print()
@    .play()
@,
@newTimer("preview", 2500)
@    .start()
@    .wait()
@,
@getVideo("sentence")
$    .pause()
</code></pre>

+ Starts playing the file *skate.mp4* and pauses it after 2500ms.		
