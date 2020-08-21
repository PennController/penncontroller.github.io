---
layout: element
title: Canvas element
parent: Elements
thumbnail: sample-element.png
syntax: newCanvas("*ELEMENT_NAME*", *WIDTH*, *HEIGHT*)
blurb: Creates rectangular surfaces that you can place other elements onto.
extended_description: >- 
  Use the [CanvasCreation tool](http://files.lab.florianschwarz.net/ibexfiles/CanvasCreation/) to help visualize **Canvas** layouts and generate code that you can use directly in a PCIbex experiment.
---

## Example
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
> Creates a 800x400px **Canvas** and places the **Image** `"square"` at the (x=0, y=0) coordinate and the **Image** `"triangle"` at the (x=400, y=0) coordinate.
