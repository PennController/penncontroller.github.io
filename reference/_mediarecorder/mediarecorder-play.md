---
title: mediarecorder.play
command_type: "action"
syntax: .play()
description: "Starts playing the last recording (if any)."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@InitiateRecorder("https://myserver/upload.php");
@
@newTrial(
@    newMediaRecorder("recorder")
@        .record()
@    ,
@    newTimer("recording", 2000)
@        .start()
@        .wait()
@    ,
@    getMediaRecorder("recorder")
@        .stop()
@        .print()
@        .disable()
$        .play()
@        .wait("playback")
@);
</code></pre>

+ Will record for 2s and then play back the recording.		
