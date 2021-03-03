---
title: eyetracker.callback
command_type: "action"
syntax: .callback()
parameters:
  - name:  function 
description: "Tell the script to continuously execute the specified javascript function as long as an element is being looked at."
notes: true
since: PennController 1.8
---

+ The function takes is passed two arguments, the estimated X and Y coordinates. The keyword `this` in the callback function points to the PennElement instance corresponding to the looked-at element.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@newTrial( newButton("Start").print().wait(newEyeTracker().test.ready()) )
@
@newTrial(
@    newEyeTracker("tracker").calibrate(70)
@    ,
@    newText("lookedAt", "").print()
@    ,
@    newText("Left").css("padding","20vw").print("20vw", "40vh"),
@    newText("Right").css("padding","20vw").print("60vw", "40vh")
@    ,
@    getEyeTracker("tracker")
@        .add( getText("Left") , getText("Right") )
$        .callback(function(x,y){ getText("lookedAt")
$                                 .text(`Looking ${this.id} (${x},${y})`)._runPromises(); })
@        .start()
@    ,
@    newSelector().add( getText("Left") , getText("Right") ).wait()
@)
</code></pre>

+ Will display the name of the element being looked-at, along with the X and Y coordinates.		
