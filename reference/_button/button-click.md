---
title: button.click
command_type: "action"
syntax: .click()
description: "Simulates a click on the button."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newKey(" ")
@    .callback(
@        getButton("continue")
$            .click()
$    )
@,
@newButton("continue", "Continue")
@    .print()
@    .wait()
</code></pre>

+ Creates a Key element associated with the spacebar which, whenever pressed, will simulate a click on the *continue* button added below it, then will wait until the button is clicked (or thus until the spacebar is pressed) before proceeding.

+ 		
