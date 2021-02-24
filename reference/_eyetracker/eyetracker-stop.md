---
title: eyetracker.stop
command_type: "action"
syntax: .stop()
description: "Stops tracking which element is being looked at."
notes: true
---

+ The EyeTracker element will stop collecting and sending data points to your PHP script after `stop` is executed.

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
@    ,
@    newTimer(1000).callback( getEyeTracker("tracker").stop() ).start()
$    ,
@    newSelector().add( getText("Left") , getText("Right") ).wait()
@)
</code></pre>

+ Will stop tracking looks after 1 second.		
