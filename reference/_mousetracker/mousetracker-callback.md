---
title: mousetracker.callback
command_type: "action"
syntax: .callback()
parameters:
  - name:  command 
description: "Will run the PennController command(s) or javascript function passed as arguments whenever the mouse moves after `start` and before `stop` have been called."
alternates:
  - name: " function "
notes: true
---

+ If you pass a function, it will be receive two arguments when executed, corresponding to the current X and Y coordinates.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newButton("Click then move your mouse when seeing a box")
@  .print("center at 50vw", "center at 50vh")
@  .wait()
@  .remove()
@,
@newCanvas("box", 100, 100).css("background", "black")
@,
@newMouseTracker("mouse")
$  .callback(
$    getCanvas("box").test.printed()
$      .success( newText("Good job!").print() )
$      .failure( newText("Missed it!").print() )
$    ,
$    getMouseTracker("mouse").stop()
$  )
@  .start()
@,
@newTimer( 200+800*Math.random() ).start().wait()
@,
@getCanvas("box").print()
@,
@newTimer( 200+300*Math.random() ).start().wait()
@,
@getCanvas("box").remove()
@,
@newButton("Finish").print().wait()
</code></pre>

+ Starts a MouseTracker element once the button is clicked, waits between 200ms and 1s before printing a black square on the page and removes it after a time period between 200ms and 500ms. The `callback` command will run whenever the mouse starts moving after a click on the button, and will print a different message depending on whether the Canvas element is on the page, and will immediately stop the MouseTracker element, making sure the callback is called only once.		
