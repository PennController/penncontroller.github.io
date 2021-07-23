---
title: dragdrop.bungee
command_type: "action"
syntax: .bungee()
description: "If an element is dropped outside a drop area, it will go back to its original position."
notes: true
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
$newDragDrop("dd", "bungee")
@        .log()
@        .addDrop( getCanvas("listOfWords") , getCanvas("gap-0") , getCanvas("gap-1") )
@        .addDrag( getText("sentence") , getText("illustrate") , getText("dummy") )
@        .swap( getCanvas("gap-0"), getCanvas("gap-1") )
@        .offset('0.5em','0em', getCanvas("gap-0"), getCanvas("gap-1"))
@        .wait(
@            self.test.dropped(getCanvas("gap-0"),getCanvas("gap-1"))
@        )
$getDragDrop("dd").bungee()
</code></pre>

+ If a word is dropped outside a drop area, it will go back to its original position.
