---
title: audio.wait
command_type: "action"
syntax: .wait()
alternates:
  - name: "\"first\""
  - name: "test"
description: "It waits until the previous command or command specified is executed or the specified time runs out before moving onto the next command."

---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newAudio("sentence", "test.mp3")
@    .play()
@,
@newButton("validation", "Validate")
@    .print()
$    .wait()
@,
@getAudio("sentence")
$    .wait("first")
@,
@newText("thanks", "Thank you for listening")
@    .print()
</code></pre>

+ Starts playing the file *test.mp3* and adds a button onto the screen. If the button is clicked before the audio is done playing for the first time, it waits until the end before printing the text *Thank you for listening*.		
