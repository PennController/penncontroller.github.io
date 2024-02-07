---
title: MediaRecorder
since: PennController 1.8
parent: Elements
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

+ The filename of the media file in the uploaded zip archives will be based on the MediaRecorder element's name

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newMediaRecorder("recorder", "audio")
@  .log()
@  .once()
@  .record()
@  .print()
@  .wait()
</code></pre>

+ Creates an audio recorder, starts recording, prints an interface and wait until the participant stops the recorder
