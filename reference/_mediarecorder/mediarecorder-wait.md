---
title: mediarecorder.wait
command_type: "action"
syntax: .wait()
description: "Waits for the current (or next) recording to be over."
alternates:
  - name: "\"first\""
  - name: "\"playback\""
notes: true
---

+ If you pass *"first"* and a sample had already been recorded by the time this command gets evaluated and executed, the commands that come next are immediately evaluated and executed. Otherwise, it waits until a recording has finished before evaluating and executing the next commands.

+ If you pass *"playback"*, the commands that come next will only be evaluated and executed next time a recording has finished playing back.

+ You can also pass a test command, in which case the next commands will be evaluated and executed upon completion of a recording *while the condition of the test is satisfied*. It it is not satisfied, then it will be checked again next time a recording is over.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@InitiateRecorder("https://myserver/upload.php");
@
@newTrial(
@    newMediaRecorder("recorder")
@        .once()
@        .print()
@        .wait()
$        .play()
@        .wait("playback")
$)
</code></pre>

+ Adds a media player and a recording button to the page, and automatically plays back the video once it is recorded.		
