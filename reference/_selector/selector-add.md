---
title: selector.add
command_type: "action"
syntax: .add()
parameters:
  - name:  element1
  - name:  element2
  - name:  ... 
description: "Adds as many elements to the selector. By default, selection is done through clicks. See `.keys` and `.enableClicks` and `.disableClicks`."
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
$    .wait()
</code></pre>

+ Adds two images side by side and waits for a click on either one of them.		
