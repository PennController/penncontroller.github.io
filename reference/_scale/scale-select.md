---
title: scale.select
command_type: "action"
syntax: .select()
parameters:
  - name: option
description: "Selects the specified option on the scale."
alternates:
  - name: "index"
  - name: "option, \"log\""
notes: true
---

+ If you pass a second argument (e.g. *"log"*) then the selection will be treated as if it were a manual selection, and will be recorded in the results file if you called `log`.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("What programming language is PennController based on?")
@    .print()
@,
@newScale("answer",  "C++", "JavaScript", "Python", "R")
@    .labelsPosition("right")
@    .print()
@,
@newButton("Check my answer")
@    .print()
@    .wait( getScale("answer").test.selected() )
@,
@getScale("answer")
@    .test.selected("JavaScript")
@    .success(
@        newText("Good job!")
@            .print()
@    )
@    .failure(
@        newText("Wrong...")
@            .print()
@    )
@,
@getScale("answer")
@    .select("JavaScript")
$    .disable()
</code></pre>

+ Adds a question, a scale with four options and a button onto the page, then waits until the button is clicked while an option is selected. Once the button is clicked, prints a different feedback message depending on whether *JavaScript* is selected, then selects the *JavaScript* option (the correct answer) and disables the scale.

+ 		
