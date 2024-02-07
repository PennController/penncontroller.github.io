---
title: Timer
since: beta 0.3
parent: Elements
children_collection: timer
thumbnail: timer.png
parameters:
  - name: TIMER_LENGTH
    type: int
    description: The length of the timer, in milliseconds.
description: Represents a timer.
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("pleasewait", "Please wait 1s.")
@    .print()
@,
$newTimer("wait", 1000)
$    .start()
$    .wait()
@,
@getText("pleasewait")
@    .remove()
</code></pre>

+ The code above adds the text Please wait 1s to the screen, starts a 1000ms timer and waits until it is done before removing the text.
