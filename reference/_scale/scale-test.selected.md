---
title: scale.test.selected
command_type: "test"
syntax: .test.selected()
description: "Tests whether a button is selected."
alternates:
  - name: " value "
notes: true
---

+ If you pass a value, it will check that it matches the label of the selected button if it has a label, its index otherwise. If you do not pass a value, it simply checks that a selection happened.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newScale("score",   5)
@    .before( newText("label", "Score: ") )
@    .print()
@,
@newButton("validation", "Validate")
@    .print()
@    .wait( getScale("score").test.selected() )
</code></pre>

+ Adds a 5-point radio-button scale and a *Validate* button to the screen. Clicking on the *Validate* button is successful only when a radio button is selected.		
