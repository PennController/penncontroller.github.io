---
title: button.callback
command_type: "action"
syntax: .callback()
parameters:
  - name:  command 
description: "Will execute the command(s) whenever the button is clicked."
alternates:
  - name: " command1, command2 "
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newVideo("skate", "skate.mp4")
@    .print()
@,
@newButton("(Re)play")
@    .callback( 
$        getVideo("skate")
$            .stop()
$            .play()
$    )
$    .print()
</code></pre>

+ Adds onto the page a video and a button which, whenever clicked, starts or restarts playing the video from the beginning.		
