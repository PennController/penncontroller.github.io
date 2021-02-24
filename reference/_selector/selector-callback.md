---
title: selector.callback
command_type: "action"
syntax: .callback()
parameters:
  - name:  element 
description: "Will execute the command on the element upon next selection, or the function whenever selection happens."
alternates:
  - name: " function "
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
@    .callback( getSelector("shapes").shuffle() )
$    .wait()
</code></pre>

+ Adds two images side by side. The positions of the images are shuffled anytime either image is clicked.		
