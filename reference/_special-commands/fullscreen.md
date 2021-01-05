---
layout: command
command_type: special
title: fullscreen
parent: Special commands
grand_parent: Commands
syntax: fullscreen()
description: Sends a fullscreen request to the participant’s browser. 
notes: >-
  The success of this command depends on the browser configuration. Most browsers will block fullscreen requests if they happen before the user has interacted with the page in any way.

  Call `exitFullscreen()` to quit fullscreen mode.
---

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
