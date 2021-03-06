---
title: audio.log
command_type: "action"
syntax: .log()
description: "Will log the time/results of the action to your results file."
alternates:
  - name: "\"play\""
  - name: "\"pause\""
  - name: "\"end\""
  - name: "\"seek\""
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@newText("instructions", "Please listen to the audio below")
@    .print()
@,
@newAudio("sentence", "test_sentence.ogg")
@    .once()
$    .log()
@    .print()
@    .wait()
@,
@newButton("validation", "Validate")
@    .print()
@    .wait()
</code></pre>

+ Adds some instruction text to the screen and control buttons below the text. After the audio gets played, the control buttons are grayed out, and a *Validate* button appears below them.

+ The results file will contain as many lines for when the audio was played, paused, when it ended playing and when its position was changed by clicking the progress bar.		
