---
title: selector.select
command_type: "action"
syntax: .select()
parameters:
  - name: element
description: "Selects the specified element."
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
$    .wait()
</code></pre>

+ Adds two images side by side, selects the image *square* by default, and waits for a click on either one of them.

+ 		
