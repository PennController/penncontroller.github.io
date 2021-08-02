---
title: dragdrop.log
command_type: "action"
syntax: .log()
description: "Will log the time/results of the action to your results file."

---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@    newDragDrop("dd", "bungee", "swap")
@        .addDrag(getCanvas("dot"),getCanvas("otherdot"))
@        .addDrop(getCanvas("start"),getCanvas("end"))
@        .offset(0, getCanvas("start"))
@        .offset(50, getCanvas("end"))
@        .drop(getCanvas('dot'),getCanvas('start')) // start dropped by default
@        .callback(
@            newText("feedback","Good job! Now make sure that Red is on Start and Blue is on End")
@                .css("background-color","lightgray")
@                .print("center at 50vw", "middle at 50vh")
@            ,
@           newTimer(3000).start().wait()
@            ,
@            getText("feedback").remove()
@        )
$        .log("all") 
@        .wait()
</code></pre>

+ In this case, log command logs every drag event and every drop event.
