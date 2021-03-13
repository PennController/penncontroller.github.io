---
title: MouseTracker
since: PennController 1.8
children_collection: mousetracker
thumbnail: mousetracker.png
description: Creates a mouse-tracking data collector.
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTrial(
@  newButton("Start")
@    .print("center at 50vw", "middle at 50vh").wait().remove()
@  ,
$  newMouseTracker("mouse")
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
$  getMouseTracker("mouse")
$   .stop()
)
</code></pre>

+ This code initaties the mouse tracker. The mouse tracker here tracks if user selects either right of left canvas.

