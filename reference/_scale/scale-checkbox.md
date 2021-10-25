---
title: scale.checkbox
command_type: "action"
syntax: .checkbox()
description: "Turns the options into checkoxes that can all independently be on/off."

---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTrial(
@    newScale("answer", "hello", "world")
$        .checkbox()
@        .print()
@    ,
@    newButton("Hello world")
@        .print()
@        .wait()
)

</code></pre>

+ Adds a scale with 3 checkboxes to the screen.
