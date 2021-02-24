---
title: scale.unselect
command_type: "action"
syntax: .unselect()
description: "Will unselect the option currently selected."
notes: true
---

+ If the scale is a slider, it will set it back to the central value.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newScale("score", 10)
@  .print()
@,
@newButton("Unselect")
@  .callback( getScale("score").unselect() )
$  .print()
</code></pre>

+ Prints a 10-point radio button scale and a button reading *Unselect* which, when clicked, unselects the currently selected button on the scale.		
