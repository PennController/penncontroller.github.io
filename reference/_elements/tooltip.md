---
title: Tooltip
since: beta 0.3
children_collection: tooltip
thumbnail: tooltip.png
parameters:
  - name: TOOLTIP_TEXT
    type: string
    description: The text that appears on the tooltip.
  - name: VALIDATION_TEXT
    type: string
    description: The text that appears on a clickable button that validates and closes the tooltip. By default, this text is the string `"OK"`.
    optional: true
description: Represents a tooltip.
---


<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newImage("myImage", "square.png")
@    .print()
@,
$newTooltip("myTooltip", "This is a square")
$   .print( getImage("myImage") )
</code></pre>

+ Adds an image to the page and places a box with the text This is a square to its bottom-right corner, which disappears when a validation button (reading OK by default) is clicked. 

