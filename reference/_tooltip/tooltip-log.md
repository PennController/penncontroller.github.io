---
title: tooltip.log
command_type: "action"
syntax: .log()
description: "Will add a line in the results file each time the tooltip is validated."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@newAudio("sentence", "test_sentence.ogg")
@    .log()
@    .wait()
@    .print()
@,
@newTooltip("instructions", "Use this interface to replay the audio as many times as you want")
$    .log()
@    .print( getAudio("sentence") )
@    .wait()
</code></pre>

+ Starts playing the audio file *test*sentence.ogg_ and, when it has finished playing, adds an interface to replay it at will onto the page and attaches a tooltip at its bottom-right corner. Since `.log` is called on both the audio and the tooltip, the results file can tell how long of a delay passed between the end of playback and the validation of the tooltip, and whether and how many times the audio was replayed before and after validating the tooltip.		
