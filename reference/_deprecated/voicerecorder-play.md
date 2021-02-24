---
title: voicerecorder.play
command_type: "action"
syntax: .play()
description: "Starts playing the last recording (if any)."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@InitiateRecorder("https://myserver/upload.php");
@
@newTrial(
@    newVoiceRecorder("recorder")
@        .record()
@    ,
@    newTimer("recording", 2000)
@        .start()
@        .wait()
@    ,
@    getVoiceRecorder("recorder")
@        .stop()
@        .play()
$        .wait("playback")
@);
</code></pre>

+ Will record audio for 2s and then play it back.		
