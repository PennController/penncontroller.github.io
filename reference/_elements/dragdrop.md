---
title: DragDrop 
since: beta 2.0
children_collection: dragdrop
thumbnail: dragdrop.png
description: Allows dragging elements into the specific space.
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newDragDrop("dd", "bungee")
@        .log()
@        // listOfWords is a dropzone as well as the gaps are
@        .addDrop( getCanvas("listOfWords") , getCanvas("gap-0") , getCanvas("gap-1") )
@        .addDrag( getText("sentence") , getText("illustrate") , getText("dummy") )
@       // dropping a word on gap-0 or gap-1 will swap any word already present
@        .swap( getCanvas("gap-0"), getCanvas("gap-1") )
@        // words will have a 0.5em horizonal offset from the left edge of the gap Canvas elements
@        .offset('0.5em','0em', getCanvas("gap-0"), getCanvas("gap-1"))
@        // Wait until both gap-0 and gap-1 have been droppped a word onto them
@        .wait(
@            self.test.dropped(getCanvas("gap-0"),getCanvas("gap-1"))
@        )
</code></pre>

+ Creates gap-0 and gap-1 into which words have to be dropped from the displayed list.
