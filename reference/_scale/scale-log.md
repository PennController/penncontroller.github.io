---
title: scale.log
command_type: "action"
syntax: .log()
description: "Adds a line to the result file indicating which button is selected at what time(stamp)."
alternates:
  - name: "\"last\""
  - name: "\"first\""
  - name: "\"all\""
notes: true
---

+ Leaving the parentheses blank is equivalent to passing only `"last"`: only the very last option to be selected will be saved. If `"first"`, then the very first option to be selected will be saved. If `"all"`, a line will be added for each selection on the scale.

+ **Note:** in beta 0.3, blank and `"all"` were equivalent and were the only available options.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newScale("hunger", 5)
@    .before( newText("left", "Right now, I am... very hungry ") )
@    .after( newText("right", " not hungry at all") )
@    .log("first", "last")
$    .print()
@    .wait()
@,
@newButton("validation", "Validate")
@    .print()
@    .wait()
</code></pre>

+ Adds a 5-point radio scale and waits for a click on one of its buttons before adding a button to the screen. Only the very first and the very last clicks on the scale will be saved in the results file (if only one selection happened, only one line will be added).		
