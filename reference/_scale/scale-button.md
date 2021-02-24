---
title: scale.button
command_type: "action"
syntax: .button()
description: "Makes the buttons of the scale appear as clickable text buttons that are framed when selected. If you passed a number when creating the scale, the buttons will be labeled with numbers (starting from 0)."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newScale("score", 6)
@    .button()
$    .before( newText("score label", "Score: ") )
@    .after( newText("score text", " / 5") )
@    .print()
@    .wait()
</code></pre>

+ Adds a scale with 6 horizontally aligned buttons to the screen, labeled from 0 to 5, and waits for a click on one of them.		
