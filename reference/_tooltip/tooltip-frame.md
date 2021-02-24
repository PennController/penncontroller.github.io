---
title: tooltip.frame
command_type: "action"
syntax: .frame()
description: "Will add a frame surrounding the element to which the tooltip is attached when it is printed. You can optionally define the aesthetics of the frame by passing a string following the CSS format for borders."
alternates:
  - name: "\"frame-style frame-width frame-color\""
notes: true
---

+ Adds an image to the page, surrounds it by a 1px, dotted, gray frame (by default) and places a box with the text *This is a square* to its bottom-right corner. Both the frame and the tooltip disappear when the tooltip is validated.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newImage("myImage", "square.png")
@    .print()
@,
@newTooltip("myTooltip", "This is a square")
@    .frame()
$    .print( getImage("myImage") )
@    .wait()
</code></pre>

+ Adds an image to the page, surrounds it by a 1px, dotted, gray frame (by default) and places a box with the text *This is a square* to its bottom-right corner. Both the frame and the tooltip disappear when the tooltip is validated.		
