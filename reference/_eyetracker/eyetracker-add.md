---
title: eyetracker.add
command_type: "action"
syntax: .add()
parameters:
  - name:  element1 
  - name:  element2
  - name:  ... 
description: "Adds elements to be tracked."
notes: true
since: PennController 1.8
---

+ Any commands passed to `callback` will be executed on every cycle (or span of cycles) where the estimated looks fall on one of the specified elements.

+ Once you add elements to the tracker and use `start`, the tracker will report 1 (looked-at) or 0 (not looked-at) for every element on every cycle, which will be sent to your PHP script at the end of the trial.

+ Looked at element also receive the CSS class `eyetracked`.

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
@        .stopTraining()
@        .add( getText("Left") , getText("Right") )
$    ,
@    newSelector().add( getText("Left") , getText("Right") ).wait()
@)
</code></pre>

+ Will add *Left* and *Right* as tracked elements.		
