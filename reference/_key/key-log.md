---
title: key.log
command_type: "action"
syntax: .log()
description: "A line will be added to the results file indicating which key was pressed when."
alternates:
  - name: "\"wait\""
  - name: "\"first\""
  - name: "\"last\""
  - name: "\"all\""
notes: true
---

+ If you leave the parentheses blank or pass `"wait"` (those are equivalent) then key presses will only be logged if they validate a `.wait` command on the Key element.

+ If you pass `"first"` then the first key press on one of the specified keys will be logged (regardless of whether it validates a `.wait` command). Correspondingly, if you pass `"last"` then the last valid key press will be logged. If you pass `"all"` then all key presses will be logged.

+ **Note:** `"all"` (or blank, its equivalent) was the only available option in beta 0.3.

+ Adds a text asking for a press on any key, after which the text *Thank you!* get printed below. The results file will contain a line indicating which key was pressed, and at what time(stamp) it was pressed.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@newText("instructions", "Please press any key")
@    .print()
@,
@newKey("anyKey", "")
@    .log()
$    .wait()
@,
@newText("thanks", "Thank you!")
@    .print()
</code></pre>

+ Adds a text asking for a press on any key, after which the text *Thank you!* get printed below. The results file will contain a line indicating which key was pressed, and at what time(stamp) it was pressed.		
