---
title: audio.once
command_type: "action"
syntax: .once()
description: "Disables the buttons to play/pause the audio right after its first playing (the audio can still be played using the action `play`)."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("instructions", "Please listen to the audio below")
@    .print()
@,
@newAudio("sentence", "test.mp3")
@    .once()
$    .print()
@    .wait()
@,
@newButton("validation", "Validate")
@    .print()
@    .wait()
</code></pre>

+ Adds some instruction text to the screen and control buttons below the text. After the audio gets played, the control buttons are grayed out, and a *Validate* button appears below them.		
