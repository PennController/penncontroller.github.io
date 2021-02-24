---
title: video.log
command_type: "action"
syntax: .log()
description: "Tells to add a line in the results file each time an event happens. If you do not specify which event you want to log, all of them will add a line to the results file."
alternates:
  - name: "\"play\""
  - name: "\"pause\""
  - name: "\"end\""
  - name: "\"seek\""
notes: true
---

+ *"play"* adds a line including a timestamp and an offset, as the playing is sometimes detected only after a delay. You can compute the actual timestamp for when some sound started to be emitted by subtracting the offset from the timestamp.

+ *"pause"* and *"end"* add lines of the same format for the respective events. *"seek"* adds a line when the progress bar is clicked (visible if the controls are displayed, see the action `print`).

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@
@newText("instructions", "Please watch the video below")
@    .print()
@,
@newVideo("scene", "test_scene.mp4")
@    .once()
$    .log()
@    .print()
@    .wait()
@,
@newButton("validation", "Validate")
@    .print()
@    .wait()
</code></pre>

+ Adds some instruction text to the screen and control buttons below the text. After the video gets played, the control buttons are grayed out, and a *Validate* button appears below them.

+ The results file will contain as many lines for when the video was played, paused, when it ended playing and when its position was changed by clicking the progress bar.		
