---
title: dragdrop.swap
command_type: "action"
syntax: .swap()
description: "Will swap elements if dropping one onto an occupied dropzone."
notes: true
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@ newDragDrop("words", "bungee")
@        .addDrag(getText("hello"),getText("world"),getText("bye"),getText("earth"))
@        .addDrop(getCanvas("word1"),getCanvas("word2"),getCanvas("word3"),getCanvas("word4"),getCanvas("reservoir"))
$        .swap(getCanvas("word1"),getCanvas("word2"),getCanvas("word3"),getCanvas("word4"))
@        .offset('0.5em')
@        .offset('unset', getCanvas("reservoir"))
@        .wait( 
@            self.test.dropped(getCanvas("word1"),getCanvas("word2"),getText("hello"),getCanvas("word4"))
@        )
</code></pre>

+ It will swap elements word1, word2, word3, and word4 if dropping one onto an occupied dropzone.
