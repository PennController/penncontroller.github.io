---
title: timer.stop
command_type: "action"
syntax: .stop()
description: "Stops the timer early. Nothing happens if the timer has already elapsed."
notes: true
---

+ When timers are stopped early, the script proceeds in the same way as if they had elapsed on their own: any `callback` command associated to the timer is executed and any `wait` command on the timer is resolved.

+ Will wait 3 seconds before proceeding, or will proceed if the space bar is pressed in the meantime.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newText("instructions", "Wait 3s or press Space")
@    .print()
@,
@newTimer("delay", 3000)
@    .start()
@,
@newKey("stop early", " ")
$    .callback( getTimer("delay").stop() )
@,
@getTimer("delay")
@    .wait()
</code></pre>

+ Will wait 3 seconds before proceeding, or will proceed if the space bar is pressed in the meantime.

+ 		
