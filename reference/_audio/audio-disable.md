---
title: audio.disable
command_type: action
syntax: .disable()
description: Disables the audio player interface controls.
alternates:
  - name: OPACITY
    type: float from 0.01 to 1
    description: Prints a rectangular layer of specified value onto the audio player interface, where `0.01` is white and `1` is dark grey.
notes: true
related:
  - name: standard.disable
    collection: standard-element-commands
---

+ Some browsers display disabled interfaces as a plain gray rectangle.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight">
@// Example 1:
@newAudio("sentence", "test.mp3")
@    .print()
$    .disable()
@    .play()
@    .wait()
@
@// Example 2:
@newAudio("sentence", "test.mp3")
@    .print()
$    .disable(0.01)
@    .play()
@    .wait()
@
@// Example 3:
@newAudio("sentence", "test.mp3")
@    .print()
@    .wait()
$    .disable()
</code></pre>

+ Example 1: Prints a disabled audio player interface and then plays the file
*`test.mp3`*.
+ Example 2: Prints a disabed audio player interface and then plays the file
*`test.mp3`*. The disabled audio player is displayed as a solid white rectangle.
+ Example 3: Prints an audio player interface but does not play it; the participant
must click the play button to start audio playback. After audio playback finishes,
the audio player interface is disabled.
