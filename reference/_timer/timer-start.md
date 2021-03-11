---
title: timer.start
command_type: "action"
syntax: .start()
description: "Starts the timer."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("pleasewait", "Please wait 1s.")
@    .print()
@,
@newTimer("wait", 1000)
$    .start()
@    .wait()
@,
@getText("pleasewait")
@    .remove()
</code></pre>

+ The code above adds the text *Please wait 1s* to the screen, starts a 1000ms timer and wait until it is done before removing the text.		
