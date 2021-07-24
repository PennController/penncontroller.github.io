---
title: dragdrop.offset
syntax: .offset()
description: "Adds a (x,y) offset to all or only the specified dropzones."
notes: true
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newDragDrop("dd", "bungee")
@        .log()
@       .addDrop( getCanvas("listOfWords") , getCanvas("gap-0") , getCanvas("gap-1") )
@        .addDrag( getText("sentence") , getText("illustrate") , getText("dummy") )
@        .swap( getCanvas("gap-0"), getCanvas("gap-1") )       
$        .offset('0.5em','0em', getCanvas("gap-0"), getCanvas("gap-1"))
@        .wait(
@            self.test.dropped(getCanvas("gap-0"),getCanvas("gap-1"))
@        )
</code></pre>

+  Words will have a 0.5em horizonal offset from the left edge of the gap Canvas elements.
