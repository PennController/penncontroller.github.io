---
title: dragdrop.callback
command_type: "action"
syntax: .callback()
parameters:
  - name:  command 
description: "The commands passed to callback will be run whenever an element is (successfully) dropped."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newDragDrop("dd", "bungee", "swap")
@        .addDrag(getCanvas("dot"),getCanvas("otherdot"))
@        .addDrop(getCanvas("start"),getCanvas("end"))
@        .offset(0, getCanvas("start"))
@        .offset(50, getCanvas("end"))
@        .drop(getCanvas('dot'),getCanvas('start')) // start dropped by default
$        .callback(
$            newText("feedback","Good job! Now make sure that Red is on Start and Blue is on End")
$                .css("background-color","lightgray")
$                .print("center at 50vw", "middle at 50vh")
$            ,
$            newTimer(3000).start().wait()
$            ,
$            getText("feedback").remove()
$        )
@        .log("all") // Log every drag event and every drop event
@        .wait()
</code></pre>

+ If the element is successfully dropped, the callback will execute the command and print the feedback to the screen.
