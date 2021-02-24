---
title: selector.frame
command_type: "action"
syntax: .frame()
parameters:
  - name: "border style"
description: "Defines the style of the frame around the selected element. By default, it is set to `solid 2px green`."
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
@    .frame("dashed 3px violet")
$    .wait()
</code></pre>

+ Adds two images side by side, waits for a click on either one of them and then prints a button. Until the button is clicked, the selected image appears in a dashed, violet, 3px-wide frame.		
