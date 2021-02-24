---
title: key.callback
command_type: "action"
syntax: .callback()
parameters:
  - name:  command 
description: "Will execute the command(s) whenever a key corresponding to the element is pressed."
alternates:
  - name: " command1, command2 "
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("sentence", "Hello world")
@    .print()
@,
@newVar("word", 0)
@,
@newKey("control", " \n\r")
@    .callback(
$        getText("sentence")
$            .color("red")
$        ,
$        newTimer(1000)
$            .start()
$            .wait()
$        ,
$        getText("sentence")
$            .color("black")
$    )
</code></pre>

+ Prints *Hello world* onto the page and will highlight it in red for 1s whenever the Space or the Enter/Return key is pressed.		
