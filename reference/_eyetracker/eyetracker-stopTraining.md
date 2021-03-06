---
title: eyetracker.stopTraining
command_type: "action"
syntax: .stopTraining()
description: "Stops using mouse movements and clicks to train the model that estimates looks."
notes: true
---

+ By default the model is only trained during the calibration phase, but you can train it further with the command `train`.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@newTrial( newButton("Start").print().wait(newEyeTracker().test.ready()) )
@
@newTrial(
@    newEyeTracker("tracker")
@        .calibrate(70)
@        .train(true)
@    ,
@    newButton("Click here first").print("20vw","40vh").wait().remove(), 
@    newButton("Now Click here").print("60vw","40vh").wait().remove()
@    ,
@    newText("Left").css("padding","20vw").print("20vw", "40vh"),
@    newText("Right").css("padding","20vw").print("60vw", "40vh")
@    ,
@    getEyeTracker("tracker")
$        .stopTraining()
@        .add( getText("Left") , getText("Right") )
@    ,
@    newSelector().add( getText("Left") , getText("Right") ).wait()
@)
</code></pre>

+ Will keep training the model after calibration, so that the participant's successive clicks on the buttons will be used to refine the model, and will stop using mouse events to train the model once *Left* and Right* show up on the page.		
