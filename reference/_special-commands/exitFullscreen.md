---
title: exitFullscreen
syntax: exitFullscreen()
description: to be filled in
---

+ Calling `exitFullscreen()` quits fullscreen mode.

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
