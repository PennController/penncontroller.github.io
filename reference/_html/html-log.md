---
title: html.log
command_type: "action"
syntax: .log()
description: "Will add a line at the end of the trial for each `<textarea>`, `<input type='text'>`, `<input type='checkbox'>` and `<input type='radio'>` in the document."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@newHtml("feedback", "Feedback.html")
$    .log()
@    .print()
@,
@newButton("send", "Send")
@    .print()
@    .wait()
</code></pre>

+ Adds the content of the file *Feedback.html* from the *Resources* (*chunk_includes*) folder of the Ibex project to the page and a *Send* button below it, and waits for a click on the button. 		
