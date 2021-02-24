---
title: text.text
command_type: "action"
syntax: .text()
parameters:
  - name:  string 
description: "Resets the text of the element."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("onlyTextOnScreen", "You have not pressed the spacebar yet")
@    .print()
@,
@newKey("spacebar", " ")
@    .wait()
@,
@getText("onlyTextOnScreen")
@    .text("Now you have pressed the spacebar.")
</code></pre>

+ Updates the text after the spacebar was presssed.		
