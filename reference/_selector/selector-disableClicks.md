---
title: selector.disableClicks
command_type: "action"
syntax: .disableClicks()
description: "Makes it impossible to select by clicking. If no `.keys` command is called on the element, this makes any selection impossible."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newImage("square", "square.png")
@,
@newImage("triangle", "triangle.png")
@    .before( getImage("square") )
@    .print()
@,
@newSelector("shapes")
@    .disableClicks()
$    .add( getImage("square") , getImage("triangle") )
@    .keys(     "F"           ,        "J"           )
@    .wait()
</code></pre>

+ Adds two images side by side and waits for a selection by pressing either the F key or the J key.		
