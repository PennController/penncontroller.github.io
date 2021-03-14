---
title: EyeTrackerURL
syntax: EyeTrackerURL()
parameters:
  - name: url
description: "Tells the script where to send the data collected via the EyeTracker elements."
notes: true
since: PennController 1.8
---

+ The URL should point to a PHP script that is able to parse incoming data. See the EyeTracker element page for more information.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@EyeTrackerURL("www.dummypage.com") 
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
$        .add( getText("Left") , getText("Right") )
@    ,
@    newSelector().add( getText("Left") , getText("Right") ).wait()
@)
</code></pre>

+ Collected data will be sent at the URL in the example.

+ Will add *Left* and *Right* as tracked elements.	
