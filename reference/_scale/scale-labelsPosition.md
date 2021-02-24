---
title: scale.labelsPosition
command_type: "action"
syntax: .labelsPosition()
parameters:
  - name: "bottom"
description: "*(Since version 1.0, formerly `labels`)*"
alternates:
  - name: "\"left\""
  - name: "\"top\""
  - name: "\"right\""
notes: true
---

+ Sets the position of the labels of the scale to *bottom*, *left*, *top* or *right*. If you did not specify labels, the buttons' indices will be used instead.

+ Adds a scale with 3 horizontally aligned radio buttons to the screen, with labels *Bad*, *So-so* and *Good* above their respective buttons, and waits for a click on one of them.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newScale("score",  "Bad", "So-so", "Good")
@    .radio()
$    .labelsPosition("right")
@    .before( newText("label", "Score: ") )
@    .center()
@    .print()
@    .wait()
</code></pre>

+ Adds a scale with 3 horizontally aligned radio buttons to the screen, with labels *Bad*, *So-so* and *Good* above their respective buttons, and waits for a click on one of them.

+ 		
