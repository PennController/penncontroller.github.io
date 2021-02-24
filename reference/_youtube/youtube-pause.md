---
title: youtube.pause
command_type: "action"
syntax: .pause()
description: "Pauses the video."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newYoutube("mcgurk", "aFPtc8BVdJk")
@    .print()
@    .play()
@,
@newTimer("preview", 1000)
@    .start()
@    .wait()
@,
@getYoutube("mcgurk")
@    .pause()
</code></pre>

+ Starts playing a mind-blowing video demonstrating the McGurk effect, waits 1 second and pauses the video.		
