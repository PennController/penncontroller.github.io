---
title: voicerecorder.stop
command_type: "action"
syntax: .stop()
description: "Stop recording audio / playing last recording."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@InitiateRecorder("https://myserver/upload.php");
@
@newTrial(
@    newVoiceRecorder("recorder")
@        .record()
@    ,
@    newTimer("recording", 3000)
@        .start()
@        .wait()
@    ,
@    getVoiceRecorder("recorder")
@        .stop()
$        .play()
@    ,
@    newTimer("preview", 1000)
@        .start()
@        .wait()
@    ,
@    getVoiceRecorder("recorder")
@        .stop()
$);
</code></pre>

+ Will start recording audio and stop recording after 2s, then play back the first second of the recording and stop the playback.		
