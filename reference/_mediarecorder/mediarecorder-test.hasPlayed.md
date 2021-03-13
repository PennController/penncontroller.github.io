---
title: mediarecorder.test.hasPlayed
command_type: "test"
syntax: .test.hasPlayed()
description: "Tests whether the recording was ever played back."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@newMediaRecorder("recorder")
@    .log()
@    .print()
,
@newButton("next", "Press to go to the next page")
@    .print()
@    .wait(getMediaRecorder("recorder").test.hasPlayed())
</code></pre>

+ Initiates new media recorder, and allows going to the next page by the button press only after the recording has played.
