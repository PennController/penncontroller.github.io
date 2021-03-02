---
title: EyeTracker
since: PennController 1.8
children_collection: eyetracker
thumbnail: eyetracker.png
parameters:
  - name: OUT_OF
    type: int
    description: the number of cycles
    optional: true
  - name: LOOKED_AT
    type: int
    description: proportion of cycles
    optional: true
description: Creates an eye-tracking data collector.
---

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
        .callback(function(x,y){ getText("lookedAt").text(`Looking at ${this.id} (${x},${y})`)._runPromises(); })
        .start()
    ,
    newSelector().add( getText("Left") , getText("Right") ).wait()
)
```

+ Will initiate eyetrackekr and display the name of the element being looked-at, along with the X and Y coordinates.

