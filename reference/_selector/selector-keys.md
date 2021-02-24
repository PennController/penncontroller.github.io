---
title: selector.keys
command_type: "action"
syntax: .keys()
parameters:
  - name:  "key1"
  - name:  "key2"
  - name:  ... 
description: "Makes it possible to select the elements by pressing the specified keys. The keys are associated to the element in the order in which they were added, if no shuffle took place in the meantime."
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
$    .wait()
</code></pre>

+ Adds two images side by side and waits for a selection by pressing either the F key or the J key.		
