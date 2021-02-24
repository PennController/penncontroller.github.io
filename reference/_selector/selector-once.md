---
title: selector.once
command_type: "action"
syntax: .once()
description: "Disables the selector after the first selection has happened."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newImage("square", "square.png")
@,
@newImage("triangle", "triangle.png")
@    .before( getImage("square") )
@    .print()
@,
@newSelector("shapes")
@    .add( getImage("square") , getImage("triangle") )
$    .once()
</code></pre>

+ Adds two images side by side and a button to click below them. Any selection is definitive: further clicks will not move the frame.		
