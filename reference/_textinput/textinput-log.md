---
title: textinput.log
command_type: "action"
syntax: .log()
description: "Will add a line to the result file containing the text in the input box at the moment of the event. By default, leaving the parenthesis blank is equivalent to `.log(\"final\", \"validate\", \"first\")`."
alternates:
  - name: "\"final\""
  - name: "\"validate\""
  - name: "\"first\""
  - name: "\"last\""
  - name: "\"all\""
  - name: "\"final\", \"first\", ..."
notes: true
---

+ `"final"` will add a line reporting the text in the input box at the end of the trial.

+ `"validate"` will add a line for each press on the enter/return key, reporting the text in the input box at that time and the corresponding timestamp.

+ `"first"` will add a line for the first key press that happens in the input box (regardless of whether the key press results in inserting or deleting a character or no change).

+ `"last"` will add a line for the last key press that happens in the input box (same note).

+ These two are helpful if you want to measure how much time was spent on editing the text, by subtracting *first*'s timestamp from *last*'s.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTextInput("feedback", "Leave your feedback comments here.")
@    .log()
$    .lines(0)
@    .size(400, 200)
@    .print()
@,
@newButton("send", "Send")
@    .print()
@    .wait()
</code></pre>

+ Adds a 400x200px multiple-line input box containg the text *Leave your feedback comments here* to the screen above a *Send* button and waits for a click on the button. At least two lines will be added to the results file: one reporting the text in the box at the end of the trial, and one reporting the first key press. Additionally, you will see one line for each time the enter/return key was pressed.

+ 		
