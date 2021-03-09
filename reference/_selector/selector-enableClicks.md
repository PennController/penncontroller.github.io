---
title: selector.enableClicks
command_type: "action"
syntax: .enableClicks()
description: "Makes it possible to select by clicking (default)."
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
@    .add( getImage("square") , getImage("triangle") )
@    .keys(     "F"           ,        "J"           )
@    .wait()
$    .enableClicks()
</code></pre>

+ Adds two images side by side and waits for a selection by pressing either the F key or the J key, after which it becomes possible to select by clicking again.		
