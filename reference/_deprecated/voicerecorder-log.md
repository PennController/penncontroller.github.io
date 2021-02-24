---
title: voicerecorder.log
command_type: "action"
syntax: .log()
description: "Will add a line whenever a recording starts and whenever it stops."
notes: true
---

+ **Note** that a line with the filename of the recorded sample is always logged anyway even if you do not call `.log()`, so you can identify it in the output archive.

+ Adds a recording and a playback button to the page and wait for a sample to be recorded. The filename will contain the timestamps of when the recording button was clicked: one line for the first click (start recording) and one for the second click (stop recording).

+ The `VoiceRecorder` element is deprecated since PennController 1.8. See mediarecorder.log instead.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@newVoiceRecorder("recorder")
@    .log()
$    .print()
@    .wait()
</code></pre>

+ Adds a recording and a playback button to the page and wait for a sample to be recorded. The filename will contain the timestamps of when the recording button was clicked: one line for the first click (start recording) and one for the second click (stop recording).		
