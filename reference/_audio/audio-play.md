---
title: audio.play
command_type: "action"
syntax: .play()
description: "Starts playing the audio file."
alternates:
  - name: "\"loop\""
  - name: "\"once\""
notes: true
---

+ If you pass `"loop"` as a parameter, the audio will loop forever until the next `stop` command, or until `play` is called again, this time using the parameter `"once"`. Note that if you use `play("loop")`, then stop playback using `stop` and use `play()` again later (that is, without passing `"once"` as a parameter) the audio will loop again.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newAudio("test", "test.mp3")
$    .play()
@    .wait()
</code></pre>

+ Starts playing the file *test.mp3* (nothing is added onto the screen).		
