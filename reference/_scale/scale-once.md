---
title: scale.once
command_type: "action"
syntax: .once()
description: "Disables the scale after the first selection has happened."
notes: true
---

+ Adds a 5-point radio scale and waits for a click on one of its buttons, after which selection cannot be changed and a button appears below the scale.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newScale("hunger", 5)
@    .before( newText("left", "Right now, I am... very hungry ") )
@    .after( newText("right", " not hungry at all") )
$    .once()
@    .print()
@    .wait()
</code></pre>

+ Adds a 5-point radio scale and waits for a click on one of its buttons, after which selection cannot be changed and a button appears below the scale.		
