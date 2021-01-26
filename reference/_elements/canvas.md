---
title: Canvas
since: beta 0.3
parent: Elements
children_collection: canvas
thumbnail: canvas.png
parameters:
  - name: WIDTH
    description: The width of the `Canvas`, in pixels.
  - name: HEIGHT
    description: The height of the `Canvas`, in pixels.
description: Creates a rectangular surface that other elements can be placed onto.
notes: true
---

+ Use the
[CanvasCreation tool](http://files.lab.florianschwarz.net/ibexfiles/CanvasCreation/){:target="_blank"}
to help visualize `Canvas` layouts and generate code that can be added directly
to a PennController script.

<!--more-->

```javascript
newImage("square", "square.png")
  .size(400, 400)
,
newImage("triangle", "triangle.png")
  .size(400, 400)
,
newCanvas("shapes", 800, 400)
    .add(   0, 0, getImage("square"))
    .add( 400, 0, getImage("triangle"))
    .print()
```
> 1. Creates a 800x400px `Canvas`.
> 2. Places the `Image` `"square"` at the (x=0, y=0) coordinate and the `Image` `"triangle"` at the (x=400, y=0) coordinate.
