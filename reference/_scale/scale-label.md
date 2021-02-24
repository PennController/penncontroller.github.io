---
title: scale.label
command_type: "action"
syntax: .label()
parameters:
  - name: index
  - name: label
description: "Sets the content of the `index`-th label (with `index` starting at 0). This will mostly be useful if you want to use something like an Image element as a label, which cannot be passed as a direct parameter when creating the new Scale."
notes: true
---

+ Adds a scale with 3 horizontally aligned radio buttons to the screen, instantiated with labels *Bad*, *So-so* and *Good*. The *Bad* and *Good* labels are immediately replaced with the images *no.png* and *ya.png*, respectively.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newScale("score",  "Bad", "So-so", "Good")
$    .label( 0 , newImage("no.png") )
$    .label( 2 , newImage("ya.png") )
@    .radio()
@    .labelsPosition("top")
@    .before( newText("label", "Score: ") )
@    .center()
@    .print()
@    .wait()
</code></pre>

+ Adds a scale with 3 horizontally aligned radio buttons to the screen, instantiated with labels *Bad*, *So-so* and *Good*. The *Bad* and *Good* labels are immediately replaced with the images *no.png* and *ya.png*, respectively.

+ 		
