---
title: canvas.add
command_type: "action"
syntax: .add()
parameters:
  - name:  x
  - name:  y
  - name:  element 
description: "Places `element` onto the canvas at the coordinates (`x`, `y`)."
alternates:
  - name: " \"left at x\", \"top at y\", element "
  - name: " \"center at x\", \"middle at y\", element "
  - name: " \"right at x\", \"bottom at y\", element "
notes: true
---

+ **Note** that you do not need to call *print* on the added element: it will be printed along with the canvas.

+ **Note** also that if you pass an element that was already added to the page before, the element will be moved from its original location on the page to the specified coordinates on the canvas, leaving no blank space at the original location. In the particular case where the element was on the canvas before, the result appears as a simple update of its coordinates on the surface.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newImage("square", "square.png")
@    .size(50, 50)
@,
@newCanvas("shape", 200, 200)
@    .center()
$    .add( 0, 0, newText("description","This is a square") )
$    .add( "center at 50%", "middle at 50%", getImage("square") )
@    .print()
</code></pre>

+ Adds a `<div>` surface of size 200x200px to the horizontal center of the page and places a description *This is a square* at its top-left corner and a 50x50px image of `square.png` centered horizontally and vertically onto the surface.		
