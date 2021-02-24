---
title: timer.test.ended
command_type: "test"
syntax: .test.ended()
description: "Tests whether the timer has ended."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newText("start", "Ready... go!")
@    .print()
@,
@newTimer("hurry", 1000)
@    .start()
@,
@newButton("click", "Click me!")
@    .print()
@    .wait()
@,
@getTimer("hurry")
$    .test.ended()
@    .success( newText("slow", "Too slow...").print() )
@    .failure( newText("fast", "Good job!").print() )
</code></pre>

+ Adds a line of text saying *Ready... go!* to the screen, starts a 1s timer, adds a button reading *Click me!*, and waits for a click on the button. If the timer has ended by the time the button is clicked, the text *Too slow...* is added to the screen, otherwise if the button is clicked within 1s, *Good job!* appears below it.		
