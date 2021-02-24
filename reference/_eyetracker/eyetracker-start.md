---
title: eyetracker.start
command_type: "action"
syntax: .start()
description: "Starts tracking which element is being looked at."
notes: true
---

+ You should use `add` first to tell the eye tracker which elements are to be tracked.

+ The EyeTracker element will not collect any data points until `start` is executed. Use `stop` to stop tracking elements and sending data to your PHP script.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@newTrial( newButton("Start").print().wait(newEyeTracker().test.ready()) )
@
@newTrial(
@    newEyeTracker("tracker").calibrate(70)
@    ,
@    newText("Left").css("padding","20vw").print("20vw", "40vh"),
@    newText("Right").css("padding","20vw").print("60vw", "40vh")
@    ,
@    getEyeTracker("tracker").add( getText("Left") , getText("Right") ).showFeedback().start()
$    ,
@    newTimer(1000).callback( getEyeTracker("tracker").hideFeedback() ).start()
@    ,
@    newSelector().add( getText("Left") , getText("Right") ).wait()
@)
</code></pre>

+ Will start tracking looks to the *Left* and *Right* elements after they are printed.		
