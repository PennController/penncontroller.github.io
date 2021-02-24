---
title: voicerecorder.once
command_type: "action"
syntax: .once()
description: "Disables the button to record after the first recording. You can still record using the action command `record`."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@InitiateRecorder("https://myserver/upload.php");
@
@newTrial(
@    newVoiceRecorder("recorder")
@        .once()
$        .print()
@        .wait()
@        .play()
@        .wait("playback")
@);
</code></pre>

+ Adds a recording and a playback button to the page, and when the recording button is clicked for the second time (i.e., recording is over) the buttons become disabled and the audio automatically plays back.		
