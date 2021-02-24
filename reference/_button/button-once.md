---
title: button.once
command_type: "action"
syntax: .once()
description: "Disables the button right after it is clicked for the first time."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newButton("test", "It's a test!")
@    .log()
@    .once()
$    .print()
@,
@newAudio("sound", "test.mp3")
@    .play()
@    .wait()
</code></pre>

+ Adds a button to the screen, plays the audio file *test.mp3* and proceeds when the audio is done playing. The button can only be clicked once, and if it is, it will add a line in the results file (see `.log`).

+ 		
