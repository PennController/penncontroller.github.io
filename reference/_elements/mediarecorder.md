---
title: MediaRecorder
since: PennController 1.8
children_collection: mediarecorder
thumbnail: mediarecorder.png
parameters:
  - name: '"audio"'
    description: Records an audio stream.
    optional: true
  - name: '"video"'
    description: Records a video stream.
    optional: true
description: Creates an audio and/or video recorder. 
notes: true
---

+ If the `"audio"` or `"video"` parameter is not passed, collects
an audio-video sample.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newMediaRecorder("recorder", "audio")
@  .log()
@  .once()
@  .record()
@  .wait()
</code></pre>

+ Initiates audio recorder. 
