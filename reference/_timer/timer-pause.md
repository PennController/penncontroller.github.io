---
title: timer.pause
command_type: "action"
syntax: .pause()
description: "Pauses the timer."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("pleasewait", "Please wait 1s.")
@    .print()
@,
@newTimer("wait", 1000)
@    .start()
@,
@getTimer("wait")
$    .pause()
</code></pre>

+ The code above adds the text *Please wait 1s* to the screen, starts a 1000ms timer and then pauses it.
