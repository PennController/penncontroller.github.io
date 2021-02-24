---
title: tooltip.print
command_type: "action"
syntax: .print()
description: "Adds the tooltip to the page, or attaches it to the referenced element (if any)."
alternates:
  - name: " getElement(id) "
  - name: " x , y "
notes: true
---

+ Since PennController 1.6, you can pass `x` and `y` coordinates to print the tooltip at a specific point on the screen/document.

+ Adds an image to the page and places a box with the text *This is a square* to its bottom-right corner, which disappears when a validation button (reading *OK* by default) is clicked.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newImage("myImage", "square.png")
@    .print()
@,
@newTooltip("myTooltip", "This is a square")
@    .print( getImage("myImage") )
$    .wait()
</code></pre>

+ Adds an image to the page and places a box with the text *This is a square* to its bottom-right corner, which disappears when a validation button (reading *OK* by default) is clicked.		
