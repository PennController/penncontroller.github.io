---
title: selector.test.selected
command_type: "test"
syntax: .test.selected()
description: "Tests whether an element is selected."
alternates:
  - name: " element "
notes: true
---

+ When testing an element, remember to use a `get*` command, as simply typing its ID will fail (ie. test for `getImage("square")`, not just `"square"`)

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newImage("square", "square.png")
@,
@newImage("triangle", "triangle.png")
@    .before( getImage("square") )
@    .print()
@,
@newSelector("shapes")
@    .add( getImage("square") , getImage("triangle") )
@,
@newButton("validation", "Validate")
@    .print()
$    .wait( getSelector("shapes").test.selected() )
</code></pre>

+ Adds two images side by side, and a *Validate* button below them. The button will validate a click only after an image has been selected.		
