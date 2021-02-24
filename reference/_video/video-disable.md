---
title: video.disable
command_type: "action"
syntax: .disable()
description: "Will disable the controls interface. Note that some browsers might make the controls disappear altogether."
alternates:
  - name: "opacity"
notes: true
---

+ If you pass no parameter, a 50% opaque layer will be printed on top of the interface. You can pass a value from 0.01 (fully transparent*******) to 1 (fully opaque) to control the aspect of the layer.

+ ******* the value 0 is mistreated as no-parameter by PennController 1.6, hence the need to use a non-null value close to 0.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newVideo("skate.mp4")
@  .print()
@  .disable(0.01)
$  .play()
@  .wait()
</code></pre>

+ Prints a disabled interface for the video *test.mp3* and starts playing it. The video will be fully visible because the layer is transparent (0.01 opacity).		
