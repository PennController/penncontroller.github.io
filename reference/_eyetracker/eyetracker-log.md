---
title: eyetracker.log
command_type: "action"
syntax: .log()
description: "Tell the EyeTracker element to send the collected data points to the PHP script provided by `EyeTrackerURL` at the end of the trial."
notes: true
---

+ If you do not call `log` on the EyeTracker element, your server will never receive the eye-tracking data.

<!--more-->

```javascript
newTrial( newButton("Start").print().wait(newEyeTracker().test.ready()) )
newTrial(
    newEyeTracker("tracker").calibrate(70)
    ,
    newText("lookedAt", "").print()
    ,
    newText("Left").css("padding","20vw").print("20vw", "40vh"),
    newText("Right").css("padding","20vw").print("60vw", "40vh")
    ,
    getEyeTracker("tracker")
        .add( getText("Left") , getText("Right") )
        .callback(function(x,y){ getText("lookedAt")
                                 .text(`Looking ${this.id} (${x},${y})`)._runPromises(); })
        .start()
    ,
    newSelector().add( getText("Left") , getText("Right") ).wait()
    ,
    getEyeTracker("tracker")
        .log()
)
```
