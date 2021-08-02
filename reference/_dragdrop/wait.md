---
title: dragdrop.wait
command_type: "action"
syntax: .wait()
description: "Pauses the script's execution until one element is dragged and dropped onto a dropzone."
notes: true
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@    newDragDrop("dd")
@        .addDrag(getCanvas("dot"))
@        .addDrop(getCanvas("start"),getCanvas("end"))
@        .offset(25) 
@        .single()
@        .log()
$        .wait()
</code></pre>

+ Pauses the script's execution until element "dot" is dragged and dropped onto a dropzone.
