---
title: timer.set
command_type: "action"
syntax: .set()
description: "Re(set) timer."
---

+ The set command lets user (re)set the duration of the timer element independently of its creation.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTimer("time"),
@newScale("mode", "easy", "hard")
@    .button().print().wait().remove()
@    .test.selected("easy")
$    .success( getTimer("time").set(2000) )
$    .failure( getTimer("time").set(1000) )
@,
@newScale("answer", "Answer A", "Answer B")
@    .button().print()
@,
@getTimer("time").start().wait()
@    .remove()
</code></pre>

+ The code above gives 2s to answer in the easy mode, but only 1s in the hard mode.
