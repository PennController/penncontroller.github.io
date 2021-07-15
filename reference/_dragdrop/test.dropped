---
title: dragdrop.test.dropped
command_type: "test"
syntax: .test.dropped()
description: "Tests whether any element, or the specified ones, have been dragged and/or dropped."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@    newDragDrop("dd", "bungee")
@        .log()
@        .addDrop( getCanvas("listOfWords") , getCanvas("gap-0") , getCanvas("gap-1") )
@        .addDrag( getText("sentence") , getText("illustrate") , getText("dummy") )
@        .swap( getCanvas("gap-0"), getCanvas("gap-1") )
@        .offset('0.5em','0em', getCanvas("gap-0"), getCanvas("gap-1"))
@        .wait(
$            self.test.dropped(getCanvas("gap-0"),getCanvas("gap-1"))
@        )
</code></pre>

+ Tests wheter gap-0 and gap-1 have words dropped on them/
+ Script waits for the further execution until both gap-0 and gap-1 have been droppped a word onto them.
