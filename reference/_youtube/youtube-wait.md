---
title: youtube.wait
command_type: "action"
syntax: .wait()
description: "Waits until the video has ended before evaluating and executing the next commands."
alternates:
  - name: "\"first\""
  - name: " test "
notes: true
---

+ If you call `wait("first")`, then if the video has already been fully played at least once by the time this command is evaluated, the next commands are evaluated and executed right away. If it was never fully played before, the next commands are only evaluated and executed after the audio has been played.

+ If you pass a test on an element as an argument, it only evaluates and executes the next commands when the video finishes playing *while the test is successful*. If the test is not successful, it will be checked again next time the video ends.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newYoutube("mcgurk", "aFPtc8BVdJk")
@    .print()
@    .play()
@,
@newButton("validation", "Validate")
@    .print()
@    .wait()
@,
@getYoutube("mcgurk")
@    .wait("first")
$,
@newButton("thanks", "Thank you for watching")
@    .print()
@    .wait()
</code></pre>

+ Starts playing a mind-blowing video demonstrating the McGurk effect and adds a button onto the screen. If the button is clicked before the video has ended for the first time, it waits until the end before printing a button saying *Thank you for watching*.		
