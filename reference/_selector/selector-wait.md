---
title: selector.wait
command_type: "action"
syntax: .wait()
description: "Waits until one of the elements of the selector is selected before evaluating and executing the next commands."
alternates:
  - name: "\"first\""
  - name: "test"
notes: true
---

+ If you call `wait("first")`, then if an element has already been selected before this command is evaluated, the next commands are evaluated and executed right away. If no element was selected before, the next commands are only evaluated and executed after one element in the selector gets selected.

+ If you pass a test on an element as an argument, it only evaluates and executes the next commands when an element gets selected *while the test is successful*. If the test is not successful, it will be checked again upon the next selection.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newImage("square", "square.png")
@,
@newImage("triangle", "triangle.png")
@    .before( getImage("square") )
@    .print()
@,
@newSelector("shapes")
@    .add( getImage("square") , getImage("triangle") )
@    .wait()
</code></pre>

+ Adds two images side by side and waits for a click on either one of them.		
