---
title: selector.shuffle
command_type: "action"
syntax: .shuffle()
description: "*See the **action** command `shuffle`*"
alternates:
  - name: " element1, element2, ... "
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newImage("square", "square.png")
@,
@newImage("triangle", "triangle.png")
@    .before( getImage("square") )
@    .print()
@,
@newSelector("shapes")
@    .disableClicks()
@    .add( getImage("square") , getImage("triangle") )
$    .shuffle()
@    .keys(     "F"           ,        "J"           )
@    .wait()
</code></pre>

+ Adds two images side by side. Initially, square is on the left, and triangle is on the right, but .shuffle randomly reverses (or does not reverse) the order. A press on the F key will select the image that ends up on the left (whichever it ends up being) and a press on the J key will select the image that ends up on the right (whichever it ends up being).
