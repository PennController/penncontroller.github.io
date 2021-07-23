---
title: dragdrop.addDrag
command_type: "action"
syntax: .addDrag()
description: "Adding a feature to the element to be draggable."
notes: true
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newDragDrop("dd", "bungee")
@        .log()
@        .addDrop( getCanvas("listOfWords") , getCanvas("gap-0") , getCanvas("gap-1") )
$        .addDrag( getText("sentence") , getText("illustrate") , getText("dummy") )
@        .swap( getCanvas("gap-0"), getCanvas("gap-1") )
@        .offset('0.5em','0em', getCanvas("gap-0"), getCanvas("gap-1"))
@        .wait(
@            self.test.dropped(getCanvas("gap-0"),getCanvas("gap-1"))
@        )
</code></pre>

+ Adding draggable feature to the text with the ID of "sentence".		
