---
title: eyetracker.trainOnMouseMove
command_type: "action"
syntax: .trainOnMouseMove()
description: "Tells the model to use mouse movements for its estimations or, if you pass `false`, to NOT use them."
alternates:
  - name: "false"
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@newTrial( newButton("Start").print().wait(newEyeTracker().test.ready()) )
@
@newTrial(
@    newEyeTracker("tracker")
@        .calibrate(70)
@        .train(true)
$        .trainOnMouseMove(false)
@    ,
@    newButton("Click here first").print("20vw","40vh").wait().remove(), 
@    newButton("Now Click here").print("60vw","40vh").wait().remove()
@    ,
@    newText("Left").css("padding","20vw").print("20vw", "40vh"),
@    newText("Right").css("padding","20vw").print("60vw", "40vh")
@    ,
@    getEyeTracker("tracker")
@        .stopTraining()
@        .add( getText("Left") , getText("Right") )
@    ,
@    newSelector().add( getText("Left") , getText("Right") ).wait()
@)
</code></pre>

+ Will keep training the model after calibration but will only use the mouse clicks on the buttons, and NOT the mouse movements toward them, to refine the model.		
