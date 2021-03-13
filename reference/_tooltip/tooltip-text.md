---
title: tooltip.text
command_type: "action"
syntax: .text()
parameters:
  - name:  "string" 
description: "Resets the text of the tooltip."
notes: true
since: beta 0.3
---

+ Shows an interface to play the audio *test.mp3* and attaches a tooltip at its bottom-right corner. The text will be updated after the audio has played, if the tooltip has not been validated, and therefore has not disappeared from the screen in the meantime.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newAudio("sentence", "test.mp3")
@    .log()
@    .print()
@,
@newTooltip("instructions", "Use this interface to play and replay the audio as many times as you want")
@    .print( getAudio("sentence") )
@,
@getAudio("sentence")
@    .wait()
@,
@getTooltip("instructions")
$    .text("Feel free to replay if you want")
</code></pre>

+ Shows an interface to play the audio *test.mp3* and attaches a tooltip at its bottom-right corner. The text will be updated after the audio has played, if the tooltip has not been validated, and therefore has not disappeared from the screen in the meantime.		
