---
title: timer.log
command_type: "action"
syntax: .log()
description: "Will add a line to the results file each time the timer starts and each time it ends."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newText("pleasewait", "Please wait 1s.")
@    .print()
@,
@newTimer("wait", 1000)
$    .log()
@    .start()
@    .wait()
@,
@newButton("continue", "Now click here to continue.")
@    .print()
@    .wait()
</code></pre>

+ Adds the text *Please wait 1s* to the screen, starts a 1000ms timer and wait until it is done before adding a button to the page. Two lines will be added to the results file, reporting the timestamps at the start and at the end of running the timer (should be spaced apart by about 1000ms).		
