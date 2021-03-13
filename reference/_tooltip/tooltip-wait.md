---
title: tooltip.wait
command_type: "action"
syntax: .wait()
description: "Waits until the tooltip is validated and disappears before evaluating and executing the next commands."
alternates:
  - name: "\"first\""
  - name: "test"
notes: true
---

+ If you call `wait("first")`, then if the tooltip has already been validated at least once by the time this command is evaluated, the next commands are evaluated and executed right away. If it was never validated before, the next commands are only evaluated and executed after the tooltip has been validated.

+ If you pass a test on an element as an argument, it only evaluates and executes the next commands when the tooltip is validated *while the test is successful*. If the test is not successful, it will be checked again next time the tooltip is validated. **Note** that failure does not prevent the tooltip from being validated and disappearing. To circumvent this behavior, you can print the tooltip again upon failure (see example).

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newAudio("sentence", "test.mp3")
@    .print()
@,
@newTooltip("playAudio", "Play this audio file before proceeding")
@    .print( getAudio("sentence") )
$    .wait( 
$        getAudio("sentence")
$            .test.hasPlayed()
$            .failure( getTooltip("playAudio").print(getAudio("sentence")) )
$    )
@,
@newText("confirmation", "Now you can proceed")
@    .print()
</code></pre>

+ Adds an interface to play the file *test.mp3* to the page and attaches a tooltip reading *Play this audio file before proceeding* at its bottom-left corner. The confirmation text *Now you can proceed* will only be added to the page when clicking the tooltip's validation button (at its bottom-right corner, reading *OK* by default) **after the audio has been played** at least once. If the tooltip is validated before the audio has been played (validation having the systematic effect of making the tooltip disappear) the *failure* command re-attaches the tooltip to the audio interface.		
