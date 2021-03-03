---
title: controller.log
command_type: action
syntax: .log()
description: "Logs the time when controller is envoked"

---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@newController("DashedSentence", {s: "The mouse is happy"} )
@   .print()
$   .log()
@   .wait()
@   .remove()
</code></pre>
