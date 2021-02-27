---
title: canvas.color
command_type: action
syntax: .color()
description: "Changes the color of the canvas background."

---

+ **Note** This doesn't affect the aspect of the elements contained in the Canvas element

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@ newCanvas(500,500)
@       .add(0,0,newCanvas(100,100).color("purple"))
@       .add(0,100,newText("some text"))
@       .color("orange")
@       .print()
</code></pre>

+ Adds a `<div>` surface of size 500x500px and colors it in orange. Furthermore, text is placed at the coordinates (0,100) at the surface of canvas, and the new shape (square) in the form of canvas is placed onto it and colored purple.

