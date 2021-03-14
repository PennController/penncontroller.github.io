---
title: youtube.once
command_type: "action"
syntax: .once()
description: "Will disable the Youtube video after it has finished playing."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newYoutube("myYoutube", "aFPtc8BVdJk")
$    .once()
@    .print()
@    .play()
@    .wait()
@,
@newButton("validate", "Validate")
@   .print()
@   .wait()
</code></pre>

+ Shows a video on the page and starts playing it. Playback will become disabled after it has finished.		
