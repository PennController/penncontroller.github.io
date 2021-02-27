---
title: canvas.log
command_type: action
syntax: .log()
description: "Logs the time when the canvas is printed on the page."

---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newImage("square", "square.png")
@    .size(50, 50)
@,
@newCanvas("shape", 200, 200)
@    .center()
@    .add( 0, 0, newText("description","This is a square") )
@    .print()
$    .log()
</code></pre>

