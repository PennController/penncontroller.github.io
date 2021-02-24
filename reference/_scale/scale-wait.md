---
title: scale.wait
command_type: "action"
syntax: .wait()
description: "Waits until one of the buttons is clicked before evaluating and executing the next commands."
alternates:
  - name: "\"first\""
  - name: "test"
notes: true
---

+ If you call `wait("first")`, then if a button is already selected when this command is evaluated, the next commands are evaluated and executed right away. If no button in the scale was clicked before, the next commands are only evaluated and executed after a button is clicked.

+ If you pass a test on an element as an argument, it only evaluates and executes the next commands when a button is clicked *while the test is successful*. If the test is not successful, it will be checked again upon the next click.

+ Adds a 5-point radio scale to the screen and waits for a click on one of its buttons.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newScale("hunger", 5)
@    .before( newText("left", "Right now, I am... very hungry ") )
@    .after( newText("right", " not hungry at all") )
@    .print()
@    .wait()
</code></pre>

+ Adds a 5-point radio scale to the screen and waits for a click on one of its buttons.		
