---
title: Video
since: beta 0.4
parent: Elements
children_collection: video
thumbnail: video.png
parameters:
  - name: URL
    type: string
    description: The URL of the video file.
description: Creates a media player that supports video playback.
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newVideo("myVideo", "http://myserver/video.mp4")
</code></pre>

+ Creates a <video> tag in the cache.

