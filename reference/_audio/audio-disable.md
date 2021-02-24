---
title: audio.disable
command_type: "action"
syntax: .disable()
description: "Will disable the controls interface. Note that some browsers might be render disabled interfaces as a plain gray rectangle with no controls visible whatsoever."
alternates:
  - name: "opacity"
notes: true
---

+ If you pass no parameter, a 50% opaque layer will be printed on top of the interface. You can pass a value from 0.01 (fully transparent*******) to 1 (fully opaque) to control the aspect of the layer.

+ ******* the value 0 is mistreated as no-parameter by PennController 1.6, hence the need to use a non-null value close to 0.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newAudio("test.mp3")
@  .print()
@  .disable()
$  .play()
@  .wait()
</code></pre>

+ Prints a disabled interface for the audio *test.mp3* and starts playing it.		
