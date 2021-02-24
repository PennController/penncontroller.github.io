---
title: eyetracker.hideFeedback
command_type: "action"
syntax: .hideFeedback()
description: "Hides the red dot estimating your looks."
notes: true
---

+ The red dot is hidden by default after calibration, but you can turn it back on using `showFeedback`.

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
@    newTimer(1000).callback( getEyeTracker("tracker").hideFeedback() ).start()
$    ,
@    newSelector().add( getText("Left") , getText("Right") ).wait()
@)
</code></pre>

+ Will still show the red dot after calibration for 1 second, and hide it after that delay (assuming no selection has been made in the meantime).		
