---
title: standard.disable
command_type: "action"
relevant_elements: [Audio, Button, Controller, DropDown, Key, MediaRecorder, Scale, Selector, TextInput, Timer, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .disable()
description: "Disables any interactive feature of the element."
notes: true
---

+ **Note:** this does not prevent an element that is part of a Selector element

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newKey("audioanswer", "Y", " ")
@    .log("last")
@    .setVar("inputanswer")
@    .callback( getTimer("time limit").stop() )
@,
@getTimer("time limit")
@    .wait()
@,
$getKey("audioanswer").disable()
</code></pre>

+ Key element remains active until it is disabled in the last line.
