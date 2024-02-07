---
title: Youtube
since: beta 0.3
parent: Elements
children_collection: youtube
thumbnail: youtube.png
parameters:
  - name: YOUTUBE_REFERENCE_CODE
    type: string
    description: The YouTube video reference code (the string that comes after `watch?v=` in the YouTube video URL).
  - name: '"show controls"'
    description: Enables the YouTube video player controls, which are disabled by default.
    optional: true
description: Creates a YouTube video player. 
---

+ Youtube elements use Youtube’s IFrame player API. Support might vary across browsers (e.g., preloading seems more efficient on Firefox than on Chrome).

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newYoutube("myVideo", "aFPtc8BVdJk")
</code></pre>

+ Youtube elements let you add youtube videos to the page using their reference code (what comes after watch?v= in the video’s URL) as seen above

