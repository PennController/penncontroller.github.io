---
title: audio.test.playing
command_type: "test"
syntax: .test.playing()
description: "Tests whether the audio stream is playing at the moment when the test command gets evaluated."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newAudio("test.mp3")
@  .print()
@  .play()
@  .test.playing()
@  .log()
</code></pre>

+ Checks whether the audio is playing at the moment of the execution of the command. In this case it would return the result as correct. 
+ Note that you can use this command as a conditional to the other functions. 	
