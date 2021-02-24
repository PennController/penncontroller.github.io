---
title: voicerecorder.wait
command_type: "action"
syntax: .wait()
description: "Waits for the current (or next) recording to be over."
alternates:
  - name: "\"first\""
  - name: "\"playback\""
notes: true
---

+ If you pass *"first"* and a recording had already been done by the time this command get evaluated and executed, the commands that come next are immediately evaluated and executed. Otherwise, it waits until a recording is over before evaluating and executing the next commands.

+ If you pass *"playback"*, the commands that come next will only be evaluated and executed next time a recording has finished playing back via a click on the triangle-play button.

+ You can also pass a test command, in which case the next commands will be evaluated and executed upon completion of a recording *while the condition of the test is satisfied*. It it is not satisfied, then it will be checked again next time a recording is over.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@InitiateRecorder("https://myserver/upload.php");
@
@newTrial(
@    newVoiceRecorder("recorder")
@        .once()
@        .print()
@        .wait()
$        .play()
@        .wait("playback")
$)
</code></pre>

+ Adds a recording and a playback button to the page, and when the recording button is clicked for the second time (i.e., recording is over) the audio automatically plays back.		
