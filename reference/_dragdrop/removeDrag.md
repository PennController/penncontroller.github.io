---
title: dragdrop.removeDrag
command_type: "action"
syntax: .removeDrag()
description: "Makes the specified elements no longer draggable."
notes: true
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@    newDragDrop("dd", "bungee", "swap")
@        .addDrag(getCanvas("dot"),getCanvas("otherdot"))
@        .addDrop(getCanvas("start"),getCanvas("end"))
$        .removeDrag(getCanvas("dot"),getCanvas("otherdot"))
@        .offset(0, getCanvas("start"))
@        .offset(50, getCanvas("end"))
@        .drop(getCanvas('dot'),getCanvas('start')) // start dropped by default
@        .callback(
@            newText("feedback","Good job! Now make sure that Red is on Start and Blue is on End")
@                .css("background-color","lightgray")
@               .print("center at 50vw", "middle at 50vh")
@           ,
@            newTimer(3000).start().wait()
@            ,
@            getText("feedback").remove()
@        )
</code></pre>

+ Makes canvas "dot" no longer draggable.
