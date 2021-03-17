---
title: youtube.test.playing
command_type: "test"
syntax: .test.playing()
description: "Tests whether the video is currently playing."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@nnewYoutube("myYoutube", "aFPtc8BVdJk")
@  .print()
@,
@newButton("Next")
@  .print()
@  .wait(
$    getVideo("myYoutube").test.playing()
$    .failure( newText("Please let the video finish first").print() )
@  )
</code></pre>

+ After the button Next is pressed and the printed video is still playing, the program will throw error saying that the video should be finished first.	
