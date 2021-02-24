---
title: mediarecorder.stop
command_type: "action"
syntax: .stop()
description: "Stops recording / playing the latest sample."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@InitiateRecorder("https://myserver/upload.php");
@
@newTrial(
@    newMediaRecorder("recorder")
@        .record()
@    ,
@    newTimer("recording", 3000)
@        .start()
@        .wait()
@    ,
@    getMediaRecorder("recorder")
@        .stop()
$        .disable()
@        .print()
@        .play()
@    ,
@    newTimer("preview", 1000)
@        .start()
@        .wait()
@    ,
@    getMediaRecorder("recorder")
@        .stop()
$);
</code></pre>

+ Will start recording a video and stop recording after 2s, then play back the first second of the recording and stop the playback.		
