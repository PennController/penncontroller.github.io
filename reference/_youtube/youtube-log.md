---
title: youtube.log
command_type: "action"
syntax: .log()
description: "**Note:** since beta 0.4, blank parentheses default back `\"play\"`. In beta 0.3, they default back to `\"all\"`."
alternates:
  - name: "\"play\""
  - name: "\"end\""
  - name: "\"pause\""
  - name: "\"buffer\""
  - name: "\"play\", \"buffer\", ..."
  - name: "\"all\""
notes: true
---

+ Will add a line for the following events in the results file, regardless of whether they result from a click/key press or from a script command.

+ Each line will report the timestamp of the event, as well as the position (in seconds) of the video at the moment of the event. Given the asynchronous mechanism behind the Youtube API, there may be delays: for instance the position of an **initial** *play* event may not be 0, and you should subtract it from the reported timestamp to get an accurate measure of when the video really started playing.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@newYoutube("myYoutube", "code")
@    .log("play", "buffer")
$    .play()
@    .wait()
</code></pre>

+ Will start playing a Youtube video without showing it. Each play and each buffer event will add a line to the results file.		
