---
title: textinput.wait
command_type: "action"
syntax: .wait()
description: "Waits until the *enter/return* key is pressed while entering text in the input box. **Note** that if you have a multiple-line input box, this can also mean insertion of a new line."
alternates:
  - name: "\"first\""
  - name: " test "
notes: true
---

+ If you call `wait("first")`, then if the enter/return key was already pressed while editing when this command is evaluated, the next commands are evaluated and executed right away. If the enter/return key was not clicked while editing before, the next commands are only evaluated and executed after the enter/return key is clicked while editing.

+ If you pass a test on an element as an argument, it only evaluates and executes the next commands when the enter/return key is pressed *while the test is successful*. If the test is not successful, it will be checked again next time the enter/return key is pressed while editing.

+ Adds a one-line input box to the screen preceded with *Violets are blue, roses are red,* on its left and waits for a press on the enter/return key.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTextInput("poem", "")
@    .before( newText("flowers", "Violets are blue, roses are red, ") )
@    .print()
$    .wait()
</code></pre>

+ Adds a one-line input box to the screen preceded with *Violets are blue, roses are red,* on its left and waits for a press on the enter/return key.		
