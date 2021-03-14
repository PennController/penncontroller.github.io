---
title: youtube.stop
command_type: "action"
syntax: .stop()
description: "Pauses the video and moves it back to the beginning (position = 0s)."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newYoutube("mcgurk", "aFPtc8BVdJk")
@    .print()
@    .play()
@,
@newTimer("preview", 2000)
@    .start()
@    .wait()
@,
@getYoutube("mcgurk")
$    .stop()
</code></pre>

+ Starts playing a mind-blowing video demonstrating the McGurk effect, waits 2 seconds and stops the video. The video will start over from the beginning next time it is played.		
