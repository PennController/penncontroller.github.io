---
title: fullscreen
syntax: fullscreen()
description: Sends a fullscreen request to the participant’s browser. 
notes: true  
---

The success of this command depends on the browser configuration. Most browsers
will blockfullscreen requests if they happen before the user has interacted
with the page in any way.

Call `exitFullscreen()` to quit fullscreen mode.

<!--more-->


```javascript
newTrial(
  newButton("Start the experiment and go fullscreen!")
    .print()
    .wait()
  ,
  fullscreen()
)

newTrial(
  newScale(100)
    .before( newText("It is cold here") )
    .after(  newText("It is warm here") )
    .slider()
    .print()
    .wait()
)

SendResults()

newTrial(
   exitFullscreen()
   ,
   newText("Thank you for your participation!")
     .print()
   ,
   newTimer().wait()
)
```
