---
title: video.test.playing
command_type: "test"
syntax: .test.playing()
description: "Tests whether the video stream is playing at the moment when the test command gets evaluated."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newVideo("myVideo", "file.mp4")
@  .print()
@,
@newButton("Next")
@  .print()
@  .wait(
$    getVideo("myVideo").test.playing()
$    .failure( newText("Please let the video finish first").print() )
@  )
</code></pre>

+ After the button Next is pressed and the printed video is still playing, the program will throw error saying that the video should be finished first.	
