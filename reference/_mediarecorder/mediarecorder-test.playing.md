---
title: mediarecorder.test.playing
command_type: "test"
syntax: .test.playing()
description: "Tests whether the recording is currently being played back."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@newMediaRecorder("recorder")
@    .log()
@    .print()
,
@newButton("next", "Press to go to the next page")
@    .print()
@    .wait(getMediaRecorder("recorder").test.playing())
</code></pre>

+ Initiates new media recorder, and allows going to the next page by the button press only if the current recording is playing.
