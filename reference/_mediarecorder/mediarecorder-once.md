---
title: mediarecorder.once
command_type: "action"
syntax: .once()
description: "Disables the button to record after the first recording. You can still play back the recording, or programmatically start a new recording using the command `record`."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@InitiateRecorder("https://myserver/upload.php");
@
@newTrial(
@    newMediaRecorder("recorder")
@        .once()
$        .print()
@        .wait()
@        .play()
@        .wait("playback")
@);
</code></pre>

+ Adds a media player and a recording button to the page, and when the recording stops, the button becomes disabled and the video automatically plays back.		
