---
title: mediarecorder.test.recorded
command_type: "test"
syntax: .test.recorded()
description: "Tests whether a recording was completed."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@newMediaRecorder("recorder")
@    .log()
@    .print()
,
@newButton("next", "Press to go to the next page")
@    .print()
@    .wait(getMediaRecorder("recorder").test.recorded())
</code></pre>

+ Initiates new media recorder, and allows going to the next page by the button press only if recording was completed.
