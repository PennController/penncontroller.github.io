---
title: controller.callback
command_type: "action"
syntax: .callback()
description: "Will execute the command(s) whenever the Controller is there."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newButton("Start reading")
@    .print()
@    .wait()
@    .remove()
@,
@newController("DashedSentence", {s: "The mouse is happy"} )
@    .print()
@    .log()
@    .wait()
@    .remove()
$    .callback( 
$        getVideo("skate")
$           .stop()
$           .play()
$    )
@,
@newText("Good job!")
@    .print()
</code></pre>



