---
title: TextInput
since: beta 0.3
children_collection: textinput
thumbnail: textinput.png
parameters:
  - name: DEFAULT_TEXT
    type: string
    description: The default text that appears in the text input box.
description: Represents a text input box.
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
$newTextInput("feedback", "Leave your feedback comments here.")
$    .log()
$    .lines(0)
$    .size(400, 200)
$    .print()
@,
@newButton("send", "Send")
@    .print()
@    .wait()
</code></pre>

+ Adds a 400x200px multiple-line input box containg the text Leave your feedback comments here to the screen above a Send button and waits for a click on the button. The text in the box at the end of the trial will be saved in the results file.


