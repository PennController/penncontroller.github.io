---
title: mousetracker.stop
command_type: "action"
syntax: .stop()
description: "Stops tracking the mouse cursor coordinates."
notes: true
---

+ Make sure to use this command to stop tracking and prevent your results file from growing too much.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newButton("Start")
@  .print("center at 50vw", "center at 50vh")
@  .wait()
@  .remove()
@,
@newMouseTracker("mouse").log().start()
@,
@newCanvas("left", "40vw", "40vh")
@  .css("background","red")
@  .print("center at 25vw","center at 50vh")
@,
@newCanvas("right", "40vw", "40vh")
@  .css("background","blue")
@  .print("center at 75vw","center at 50vh")
@,
@newSelector("choice").add(getCanvas("left"),getCanvas("right")).log().wait()
@,
@getMouseTracker("mouse").stop()
</code></pre>

+ Will start tracking mouse movements after a click on *Start* and stop once one of the two Canvas elements is clicked.		
