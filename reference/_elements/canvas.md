---
layout: element
element_type: canvas
title: Canvas
parent: Elements
has_children: true
has_toc: false
children_code_font: true
thumbnail: canvas.png
syntax: newCanvas("*ELEMENT_NAME*", *WIDTH*, *HEIGHT*)
description: Creates a rectangular surface to place elements onto.
notes: true
---

+ Use the [CanvasCreation tool](http://files.lab.florianschwarz.net/ibexfiles/CanvasCreation/) to help visualize **Canvas** layouts and generate code that you can use directly in a PCIbex experiment.

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
> 1. Creates a 800x400px **Canvas**.
> 2. Places the **Image** `"square"` at the (x=0, y=0) coordinate and the **Image** `"triangle"` at the (x=400, y=0) coordinate.
