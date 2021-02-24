---
title: video.once
command_type: "action"
syntax: .once()
description: "Disables the buttons to play/pause the video right after its first playing (the video can still be played using the action `play`)."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newText("instructions", "Please watch the video below")
@    .print()
@,
@newVideo("skate", "skate.mp4")
$    .once()
@    .print()
@    .wait()
</code></pre>

+ Adds some instruction text to the screen and a video below the text. After the video has played, the interface is grayed out and playback is no longer accessible.		
