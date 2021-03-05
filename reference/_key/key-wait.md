---
title: key.wait
command_type: "action"
syntax: .wait()
description: "Waits until a key is pressed."
alternates:
  - name: "\"first\""
  - name: "test"
notes: true
---

+ If you call `wait("first")`, then if a valid key has been pressed since the creation of the key element, the next commands are evaluated and executed right away. If no valid key was pressed in the meantime, the next commands are only evaluated and executed after a valid key is pressed.

+ If you pass a test on an element as an argument, it only evaluates and executes the next commands when a valid key is pressed *while the test is successful*. If the test is not successful, it will be checked again upon the next key press.

+ Adds a text asking for a press of the spacebar key. The text *Thank you!* get printed below it only after the spacebar was pressed.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("instructions", "Please press the spacebar")
@    .print()
@,
@newKey("space", " ")
$    .wait()
@,
@newText("thanks", "Thank you!")
@    .print()
</code></pre>

+ Adds a text asking for a press of the spacebar key. The text *Thank you!* get printed below it only after the spacebar was pressed.		
