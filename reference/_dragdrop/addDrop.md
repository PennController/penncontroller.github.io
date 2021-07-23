---
title: dragdrop.addDrop
command_type: "action"
syntax: .addDrop()
description: "Adding a feature to the element to be droppable."
notes: true
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newDragDrop("dd", "bungee")
@        .log()
$        .addDrop( getCanvas("listOfWords") , getCanvas("gap-0") , getCanvas("gap-1") )
@        .addDrag( getText("sentence") , getText("illustrate") , getText("dummy") )
@        .swap( getCanvas("gap-0"), getCanvas("gap-1") )
@        .offset('0.5em','0em', getCanvas("gap-0"), getCanvas("gap-1"))
@        .wait(
@            self.test.dropped(getCanvas("gap-0"),getCanvas("gap-1"))
@        )
</code></pre>

+ Adding droppable feature to the canvas "listOfWords".		
