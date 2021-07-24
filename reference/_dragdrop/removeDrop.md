---
title: dragdrop.removeDrop
command_type: "action"
syntax: .removeDrop()
description: "No longer marks the specified elements as dropzones."
notes: true
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newDragDrop("dd", "bungee", "swap")
@        .addDrag(getCanvas("dot"),getCanvas("otherdot"))
@        .addDrop(getCanvas("start"),getCanvas("end"))
$        .removeDrop(getCanvas("start"),getCanvas("end"))
@        .offset(0, getCanvas("start"))
@        .offset(50, getCanvas("end"))
@        .drop(getCanvas('dot'),getCanvas('start')) 
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

+ Area surrounded by canvas "start" and canvas "end" is no longer a dropzone.
