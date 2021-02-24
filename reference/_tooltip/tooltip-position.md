---
title: tooltip.position
command_type: "action"
syntax: .position()
parameters:
  - name: "position"
description: "Defines the relative position of the tooltip when it is attached to an element (bottom-right by default)."
notes: true
since: beta 0.3
---

+ If *position* contains *top*, the bottom edge of the tooltip will be aligned with the top edge of the element to which it is attached. If it contains *middle*, the vertical middle axis of the tooltip will be aligned with that of the element to which it is attached. If it contains *bottom*, the top edge of the tooltip will be aligned with the bottom edge of the element to which it is attached.

+ If *position* contains *left*, the right edge of the tooltip will be aligned with the left edge of the element to which it is attached. If it contains *center*, the horizontal middle axis of the tooltip will be aligned with that of the element to which it is attached. If it contains *right*, the left edge of the tooltip will be aligned with the right edge of the element to which it is attached.

+ You can use CSS to define margins to adjust the alignment of tooltips.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newImage("myImage", "square.png")
@    .print()
@,
@newTooltip("myTooltip", "This is a square")
@    .position("top center")
$    .print( getImage("myImage") )
@    .wait()
</code></pre>

+ Adds an image to the page and places a tooltip reading *This is a square* above the image, horizontally centered to its middle axis.		
