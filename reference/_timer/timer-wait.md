---
title: timer.wait
command_type: "action"
syntax: .wait()
description: "Waits until the timer has finished running before evaluating and executing the next commands."
alternates:
  - name: "\"first\""
  - name: " test "
notes: true
---

+ If you call `wait("first")`, then if the timer has already completed a full run before this command is evaluated, the next commands are evaluated and executed right away. If the timer was never completed before, the next commands are only evaluated and executed after the timer has finished running.

+ If you pass a test on an element as an argument, it only evaluates and executes the next commands when the timer finishes *while the test is successful*. If the test is not successful, it will be checked again next time the timer finishes.

+ **Note:** if you do not call `start` on the timer before calling `wait`, the script will wait forever. This can be useful for the last screen of your experiment, or if you set an interaction with an element on the screen to call the special command *end*.

+ Adds a line of text to the page, starts listening for any press on the spacebar, waits 1 second (1000ms) and tests whether the key was pressed: if it was, adds *Good job!* to the screen, adds *Too slow...* otherwise.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newText("instructions", "Please press the spacebar in less than a second")
@    .print()
@,
@newKey("spacebar", " ")
@,
@newTimer("hurry", 1000)
@    .start()
$    .wait()
@,
@getKey("spacebar")
@    .test.pressed(" ")
@    .success( newText("success", "Good job!").print() )
@    .failure( newText("failure", "Too slow...").print() )
</code></pre>

+ Adds a line of text to the page, starts listening for any press on the spacebar, waits 1 second (1000ms) and tests whether the key was pressed: if it was, adds *Good job!* to the screen, adds *Too slow...* otherwise.		
