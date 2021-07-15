---
title: dragdrop.single
command_type: "action"
syntax: .single()
description: "Allows only one element per dropzone at a time."
notes: true
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@    newDragDrop("dd")
@        .addDrag(getCanvas("dot"))
@        .addDrop(getCanvas("start"),getCanvas("end"))
@        .offset(25) 
$        .single()
@        .log()
@        .wait()
</code></pre>

+ Will allow only one element on each canvas dropzone at the time.
