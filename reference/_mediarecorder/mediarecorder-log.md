---
title: mediarecorder.log
command_type: "action"
syntax: .log()
description: "Will add a line whenever a recording starts and whenever it stops."
notes: true
---

+ **Note** that a line with the filename of the recorded sample is always logged anyway even if you do not call `.log()`, so you can identify it in the output archive.

+ Adds a media player and a recording button to the page and waits for a sample to be recorded. The filename will contain the timestamps of when the recording button was clicked: one line for the first click (starts recording) and one for the second click (stops recording).

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@newMediaRecorder("recorder")
@    .log()
$    .print()
@    .wait()
</code></pre>

+ Adds a media player and a recording button to the page and waits for a sample to be recorded. The filename will contain the timestamps of when the recording button was clicked: one line for the first click (starts recording) and one for the second click (stops recording).		
