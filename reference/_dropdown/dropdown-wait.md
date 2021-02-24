---
title: dropdown.wait
command_type: "action"
syntax: .wait()
description: "Waits until an option is selected from the drop-down list before proceeding."
alternates:
  - name: "\"first\""
  - name: "test"
notes: true
---

+ If you call `wait("first")`, then if an option has already been selected by the time this command is evaluated, the next commands are evaluated and executed right away. If no option has been selected so far, the next commands are only evaluated and executed after a selection happens.

+ If you pass a test on an element as an argument, it only evaluates and executes the next commands when a selection happens *while the test is successful*. If the test is not successful, it will be checked again next time a selection happens.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("I want ")
@    .after( newDropDown("what", "").add("candy","to break free") )
@    .print()
@,
@newTimer("read", 2000)
@    .start()
@    .wait()
@,
@getDropDown("what")
@    .wait("first")
</code></pre>

+ Prints the text *I want* and, to its right, a drop-down list containing *candy* and *to break free* onto the page, then waits 2s and waits until an option is selected before proceeding. Since `wait` was called with the argument `"first"`, execution will immediately proceed at the end of the 2s timer if an option was selected in the meantime, or it will wait for a selection to happen is no option has been selected at the end of the 2s timer.		
