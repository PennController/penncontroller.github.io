---
title: video.remove
command_type: "action"
syntax: .remove()
description: "Removes the `<video>` element from the screen."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newVideo("skate", "skate.mp4")
@    .print()
@    .wait()
@,
@getVideo("skate")
$    .remove()
</code></pre>

+ Adds the video *ksate.mp4* onto the screen, and removes it from the screen after the video has been fully played.		
