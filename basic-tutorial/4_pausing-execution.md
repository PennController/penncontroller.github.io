---
title: 4. Pausing experiment execution
nav_order: 4
blurb: How to let participants interact with an experiment.
---

Interactive elements and commands can pause experiment script execution.
{: .h1-blurb }

---

## Pause experiment until a valid keypress

We'll use a [`wait`]({{site.baseurl}}/key/key-wait) command on a
[Key]({{site.baseurl}}/key) element to pause experiment script execution until
the participant presses a valid key.

{% capture instructions %}
1. Create a Key element named `"keypress"` that is validated by a press of
the `F` or `J` key.
2. Call the [`wait`]({{site.baseurl}}/key/key-wait) command on the `"keypress"`
Key to pause the trial until the participant presses a valid
key, in this case the `F` or `J` key.

<pre><code class="language-diff-javascript diff-highlight">
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
@
@newTrial("experimental-trial",
@    newAudio("fish-audio", "2fishRoundTank.mp3")
@        .play()
@    ,
@    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
@        .print()
@    ,
@    newImage("fish-plural", "2fishRoundTank.png")
@        .print()
+    ,
+    newKey("keypress", "FJ")
+        .wait()
@)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

### Pause experiment until audio playback finishes

The `wait` command on the `"keypress"` Key pauses the trial until a valid
keypress. However, you might want to pause the trial until audio playback
finishes.

We won't actually use this option in the **BasicTutorial** experiment, but
we provide its code as a reference.

<i>Optional - Think about what the code should look like, and then check to see
if you're right!  
(Hint: You'll need to
[refer back]({{site.baseurl}}/basic-tutorial/2_creating-elements#referring-back-to-an-element)
to the `"fish-audio"` Audio)</i>

<div class="dotted-grey-dk-000 px-4 pt-3" markdown="1">
{% capture content %}

1. Remove the `wait` command on the `"keypress"` Key.
2. [Refer back]({{site.baseurl}}/basic-tutorial/2_creating-elements#referring-back-to-an-element)
to the `"fish-audio"` Audio with `getAudio`.
3. Call a [`wait`]({{site.baseurl}}/audio/audio-wait) command on the
`"fish-audio"` Audio.

<pre><code class="language-diff-javascript diff-highlight">
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
@
@// Experimental trial
@newTrial("experimental-trial",
@    newAudio("fish-audio", "2fishRoundTank.mp3")
@        .play()
@    ,
@    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
@        .print()
@    ,
@    newImage("fish-plural", "2fishRoundTank.png")
@        .print()
@    ,
@    newKey("keypress", "FJ")
-        .wait()
+    ,
+    getAudio("fish-audio")
+        .wait()
@)
</code></pre>
{% endcapture %}
{% include collapsible-block.html content=content summary="Pause trial until audio playback finishes" %}
</div>

---

## Pause experiment until a valid keypress *or* audio playback finishes {#pause-experiment}

The experiment pauses until a valid keypress, meaning that if a participant
presses a valid key before audio playback finishes, it ends audio playback
early because when the experiment unpauses, the trial (and experiment) ends.

If we want audio playback to finish before the trial ends, we have to also
pause experiment execution at the Audio element. However, simply calling a `wait`
command on the `"fish-audio"` Audio will not work as intended.

<pre><code class="language-diff-javascript diff-highlight">
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
@
@// Experimental trial
@newTrial("experimental-trial",
@    newAudio("fish-audio", "2fishRoundTank.mp3")
@        .play()
$        .wait()
@    ,
@    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
@        .print()
@    ,
@    newImage("fish-plural", "2fishRoundTank.png")
@        .print()
@    ,
@    newKey("keypress", "FJ")
@        .wait()
@)
</code></pre>

The `wait` command here actually prevents the printing of the `"fish-sentence"`
and `"fish-plural"` elements until the `"fish-audio"` Audio finishes playing,
because PennController executes experiment scripts from top to bottom.

To get around this, we can use the `getAudio()` function to
[refer back]({{site.baseurl}}/basic-tutorial/2_creating-elements#referring-back-to-an-element)
to the `"fish-audio"` Audio at a later part of the script, and call the `wait`
command there.

<pre><code class="language-diff-javascript diff-highlight">
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
@
@// Experimental trial
@newTrial("experimental-trial",
@    newAudio("fish-audio", "2fishRoundTank.mp3")
@        .play()
@    ,
@    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
@        .print()
@    ,
@    newImage("fish-plural", "2fishRoundTank.png")
@        .print()
@    ,
@    newKey("keypress", "FJ")
@        .wait()
@    ,
$    getAudio("fish-audio")
$        .wait()
@)
</code></pre>

But calling the `wait` command here doesn't work as intended either! This experiment
"freezes" if the participant presses a valid key after audio playback
finishes.

The `wait` command on the `"keypress"` Key pauses the experiment until a valid
keypress, at which point PennController evaluates the `wait` command on the
`"fish-audio"` Audio. This command, like all `wait` commands, pauses the experiment
until a certain event occurs.

However, by default PennController starts waiting for the event *after* the `wait`
command is evaluated. In other words, since audio playback finished before
the `wait` command on the `"fish-audio"` Audio was evaluated, it doesn't qualify
as an event that unpauses the experiment. As a result, the experiment pauses without
a way to ever unpause it.

The solution is to add the `"first"` parameter, which tells PennController to
pause the experiment until the event *has occurred*. If the event occurs
before the `wait("first)` command is evaluated, when the `wait("first")` command
is actually evaluated the experiment pauses and immediately unpauses, as if it
didn't pause at all.

{% capture instructions %}
1. [Refer back]({{site.baseurl}}/basic-tutorial/2_creating-elements#referring-back-to-an-element)
to the `"fish-audio"` Audio with `getAudio`.
2. Call the
[`wait("first")`]({{site.baseurl}}/audio/audio-wait#optional-arguments)
command on the `"fish-audio"` Audio.

<pre><code class="language-diff-javascript diff-highlight">
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
@
@// Experimental trial
@newTrial("experimental-trial",
@    newAudio("fish-audio", "2fishRoundTank.mp3")
@        .play()
@    ,
@    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
@        .print()
@    ,
@    newImage("fish-plural", "2fishRoundTank.png")
@        .print()
@    ,
@    newKey("keypress", "FJ")
@        .wait()
+    ,
+    getAudio("fish-audio")
+        .wait("first")
@)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}
