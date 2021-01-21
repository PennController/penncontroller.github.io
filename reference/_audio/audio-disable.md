---
title: audio.disable
command_type: action
syntax: .disable()
description: Disables the audio player interface controls.
optional_parameters:
  - syntax: .disable(*OPACITY*)
    description: Prints a grey rectangular layer of specified opacity onto the audio player interface. 
    note: 
---

<pre><code class="language-diff-javascript diff-highlight">
@// Option 1:
@newAudio("sentence", "test.mp3")
@    .print()
@    .play()
@    .wait()
$    .disable()
@
@// Option 2:
@newAudio("sentence", "test.mp3")
@    .print()
$    .disable()
@    .play()
@    .wait()
</code></pre>

↳ Option 1: lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

↳ Option 2: Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

<https://www.pcibex.net/wiki/audio-settings-disable/>
