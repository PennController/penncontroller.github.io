---
title: scale.radio
command_type: "action"
syntax: .radio()
description: "Makes the buttons of the scales appear as radio buttons."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newScale("score",   "Terrible", "Bad", "Good", "Terrific")
@    .before( newText("left", "The last movie I saw was ") )
@    .radio()
$    .labelsPosition("top")
@    .print()
@    .wait()
</code></pre>

+ Adds a scale with 4 horizontally aligned radio buttons to the screen, with their respective labels appear on top of them, and waits for a click on a button.		
