---
title: video.test.hasPlayed
command_type: "test"
syntax: .test.hasPlayed()
description: "Tests whether the video stream has played at least once before in the trial."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newVideo("myVideo", "file.mp4")
@  .print()
@,
@newButton("Next")
@  .print()
@  .wait(
$    getVideo("myVideo").test.hasPlayed()
$    .failure( newText("Please play the video first").print() )
@  )
</code></pre>

+ After the button Next is pressed and the printed video isn't played yet, the program will throw error saying that the video should be played first.	
