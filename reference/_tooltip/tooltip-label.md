---
title: tooltip.label
command_type: "action"
syntax: .label()
parameters:
  - name: "text"
description: "Resets the text of the validation button."
since: beta 0.3
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newAudio("sentence", "test.mp3")
@    .disable()
@    .print()
@    .play()
@,
@newTooltip("instruction", "After the audio is done playing, you can replay it as many times as you want", "Please wait")
@    .disable()
@    .print( getAudio("sentence") )
@,
@getAudio("sentence")
@    .wait()
@    .enable()
@,
@getTooltip("instruction")
$    .label("OK")
@    .enable()
@    .wait()
</code></pre>

+ Adds a disabled interface to play the audio *test.mp3* to the page, starts playing it immediately and attaches a disabled tooltip to its bottom-right corner, with its validation button reading *Please wait*. After the audio has finished playing, the interface is enabled (so the audio can be replayed at will) as well as the tooltip, whose validation button's text gets changed for *OK*.		
