---
title: button.wait
command_type: "action"
syntax: .wait()
description: "Waits until the button it clicked before evaluating and executing the next commands."
alternates:
  - name: "\"first\""
  - name: " test "
notes: true
---

+ If you call `wait("first")`, then if the button was already clicked at least once by the time this command is evaluated, the next commands are evaluated and executed right away. If it was never clicked before, the next commands are only evaluated and executed after the button has been clicked.

+ If you pass a test on an element as an argument, it only evaluates and executes the next commands when the button is clicked *while the test is successful*. If the test is not successful, it will be checked again next time the button is clicked.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTextInput("poem", "")
@    .before( newText("Violets are blue, roses are red,") )
@    .print()
@,
@newButton("validation", "Validate")
@    .print()
@    .wait( getTextInput("poem").testNot.text("") )
</code></pre>

+ Adds an input box to the screen preceded with *Violets are blue, roses are red,* on its left, and a button with the text *Validate* below it. Proceeds only when the button is clicked *and the input box is **not** empty*.		
