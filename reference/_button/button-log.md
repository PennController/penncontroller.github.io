---
title: button.log
command_type: "action"
syntax: .log()
description: "Adds a line to the results file each time the button is clicked."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@newButton("word", "It's a word!")
$    .log()
@    .once()
@    .print()
@,
@newAudio("sound", "sound.wav")
@    .play()
@    .wait()
</code></pre>

+ Adds a button to the screen, plays the audio file *sound.wav* and proceeds when the audio is done playing. The button can only be clicked once (see `.once`), and if it is, it will add a line in the results file.		
