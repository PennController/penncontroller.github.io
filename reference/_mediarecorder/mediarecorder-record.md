---
title: mediarecorder.record
command_type: "action"
syntax: .record()
description: "Starts recording."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@InitiateRecorder("https://myserver/upload.php");
@
@newTrial(
@    newMediaRecorder("recorder","audio")
$        .record()
@    ,
@    newTimer("recording", 2000)
@        .start()
@        .wait()
@    ,
@    getMediaRecorder("recorder")
@        .stop()
@        .play()
@        .wait("playback")
@);
</code></pre>

+ Will record audio for 2s and then play it back.		
