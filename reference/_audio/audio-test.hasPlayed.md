---
title: audio.test.hasPlayed
command_type: "test"
syntax: .test.hasPlayed()
description: "Tests whether the audio stream has played at least once before in the trial."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newAudio("test.mp3")
@  .print()
@  .play()
@  .test.hasPlayed()
@  .log()
</code></pre>

+ Checks whether the audio was played at least once. In this case it would return the result as correct. 
+ Note that you can use this command as a conditional to the other functions. 	
