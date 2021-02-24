---
title: controller.wait
command_type: "action"
syntax: .wait()
description: "Waits until the controller has been completed."
alternates:
  - name: " test "
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newButton("Start reading")
@    .print()
@    .wait()
@    .remove()
@,
@newController("DashedSentence", {s: "The mouse that the cat that the dog is petting is hugging is happy"} )
@    .print()
@    .log()
@    .wait()
$    .remove()
@,
@newText("Good job!")
@    .print()
</code></pre>

+ 		
