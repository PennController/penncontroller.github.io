---
title: selector.unselect
command_type: "action"
syntax: .unselect()
description: "Unselects any element currently selected."
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
@    .add( getImage("square") , getImage("triangle") )
@    .select( getImage("square") )
@    .wait()
$    .unselect( getImage("square") )
</code></pre>

Adds two images side by side, selects the image square by default, and waits for a click on either one of them. After that it unselects image square.
