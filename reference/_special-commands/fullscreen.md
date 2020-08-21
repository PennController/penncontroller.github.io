---
layout: command
title: fullscreen
parent: Special commands
grand_parent: Commands
syntax: fullscreen()
blurb: Sends a fullscreen request to the participant’s browser. 
extended_description: true
---

The success of this command depends on the browser configuration. Most browsers will block fullscreen requests if they happen before the user has interacted with the page in any way.

Call `exitFullscreen()` to quit fullscreen mode

---

## Example

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

{% capture label %}
Through the Try-it interface, browsers usually deny fullscreen requests because the experiment is not run globally but instead from within the test page.
{% endcapture %}
{% include note-label.html label-body=label %}