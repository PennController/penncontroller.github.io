---
title: newTrial().noTrialLog
syntax: newTrial().noTrialLog()
description:  "Skip the trial's Start and/or End lines in the results file"

---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
@newTrial(
@    newButton("helloworld", "Hello world!")
@        .log()
@        .print()
@        .wait()
@)
$.noTrialLog("Start","End")
</code></pre>

+ Will skip the trial's Start and End lines in the result file.
