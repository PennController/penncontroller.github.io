---
title: mousetracker.log
command_type: "action"
syntax: .log()
description: "Will add a line in the results file at the end of the trial reporting the mouse coordinates between `start` and `stop`."
notes: true
---

+ See the discussion and example script on the MouseTracker element page for more information about the format of the string reporting the coordinates.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTrial(
@  newButton("Start")
@    .print("center at 50vw", "middle at 50vh").wait().remove()
@  ,
@  newMouseTracker("mouse")
$   .log()
$   .start()
@  ,
@  newCanvas("left", "40vw", "40vh")
@   .css("background","red")
@   .print("center at 25vw", "middle at 50vh")
@  ,
@  newCanvas("right", "40vw", "40vh")
@   .css("background","blue")
@   .print("center at 75vw", "middle at 50vh")
@  ,
@  newSelector("choice")
@   .add( getCanvas("left") , getCanvas("right") )
@   .log()
@   .wait()
@  ,
@  getMouseTracker("mouse")
$   .stop()
)
</code></pre>

+ This code initaties the mouse tracker. The mouse tracker tracks the coordinates between start and stop.
