---
title: video.wait
command_type: "action"
syntax: .wait()
description: "Waits until the video resource is done playing before evaluating and executing the next commands."
alternates:
  - name: "\"first\""
  - name: "test"
notes: true
---

+ If you call `wait("first")`, then if the video has already been played at least once by the time this command is evaluated, the next commands are evaluated and executed right away. If it was never played before, the next commands are only evaluated and executed after the video has been played.

+ If you pass a test on an element as an argument, it only evaluates and executes the next commands when the video finishes playing *while the test is successful*. If the test is not successful, it will be checked again next time the video finishes playing.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newVideo("skate", "skate.mp4")
@    .print()
@    .play()
@,
@newButton("validation", "Validate")
@    .print()
@    .wait()
@,
@getVideo("skate")
@    .wait("first")
$,
@newText("thanks", "Thank you for watching")
@    .print()
</code></pre>

+ Starts playing the file *skate.mp4* and adds a button onto the screen. If the button is clicked before the video is done playing for the first time, it waits until the end before printing the text *Thank you for watching*. If the button is clicked after the video has been fully played once, the text appears even while in the middle of a replay.

+ 		
