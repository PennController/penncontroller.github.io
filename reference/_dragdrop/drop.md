---
title: dragdrop.drop
command_type: "action"
syntax: .addDrag()
description: "Simulates a drop of element onto the another element"
notes: true
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@ newDragDrop("dd", "bungee", "swap")
@        .addDrag(getCanvas("dot"),getCanvas("otherdot"))
@        .addDrop(getCanvas("start"),getCanvas("end"))
@        .offset(0, getCanvas("start"))
@        .offset(50, getCanvas("end"))
$        .drop(getCanvas('dot'),getCanvas('start')) // start dropped by default
@        .callback(
@            newText("feedback","Good job! Now make sure that Red is on Start and Blue is on End")
@                .css("background-color","lightgray")
@                .print("center at 50vw", "middle at 50vh")
@            ,
@            newTimer(3000).start().wait()
@            ,
@            getText("feedback").remove()
@        )
</code></pre>

+ Simulates a drop of the canvas 'dot' onto the canvas 'start'.
