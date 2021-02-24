---
title: eyetracker.calibrate
command_type: "action"
syntax: .calibrate()
parameters:
  - name: threshold
description: "Calibrates the eye-tracker so that `threshold`% of the estimated looks fall on the target."
alternates:
  - name: "threshold,attempts"
notes: true
since: PennController 1.8
---

+ If the eye-tracker was calibrated before, this command will display a button at the center of the page: after clicking it, participants must fix it for 3s. If fewer than `threshold`% of the estimated looks fall on the button during those 3s, or if the eye-tracker was not calibrated before, participants will be asked to click on 9 buttons placed along the edges of the page, to help calibrate the eye-tracker.

+ Execution of the trial's script is paused until a calibration phase is successful, or after `attempts` failed calibration phases if a second parameter was provided.

+ It is recommended that you use this command at the beginning of each eye-tracking trial to ensure that the eye-tracker has a uniformly good calibration level throughout the experiment.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@newTrial( newButton("Start").print().wait(newEyeTracker().test.ready()) )
@
@newTrial(
@    newEyeTracker("tracker").calibrate(70)
$    ,
@    newText("Left").css("padding","20vw").print("20vw", "40vh"),
@    newText("Right").css("padding","20vw").print("60vw", "40vh")
@    ,
@    getEyeTracker("tracker").add( getText("Left") , getText("Right") ).start()
@    ,
@    newSelector().add( getText("Left") , getText("Right") ).wait()
@)
@
@newTrial(
@    newEyeTracker("tracker").calibrate(70)
$    ,
@    newText("Right").css("padding","20vw").print("20vw", "40vh"),
@    newText("Left").css("padding","20vw").print("60vw", "40vh")
@    ,
@    getEyeTracker("tracker").add( getText("Left") , getText("Right") ).start()
@    ,
@    newSelector().add( getText("Left") , getText("Right") ).wait()
@)
</code></pre>

+ Will go through a calibration phase at the beginning of the first eye-tracking trial. The second eye-tracking trial will begin with a central button: if fewer than 70% of the estimated looks fall on the button during the 3s fixation time-window, it will go through a calibration phase again.		
