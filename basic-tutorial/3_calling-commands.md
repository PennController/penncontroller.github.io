---
title: 3. Calling commands
nav_order: 3
blurb: How to manipulate elements with commands.
---

Commands can manipulate elements and the content they contain.
{: .h1-blurb }

---

## Types of commands

PennController has three main types of commands:

+ [Element commands]({{site.baseurl}}/core-concepts/3_commands#element-commands):
Used within a trial and called on an element.
+ [Global commands]({{site.baseurl}}/core-concepts/3_commands#global-commands):
Used outside of a trial.
+ [Special commands]({{site.baseurl}}/core-concepts/3_commands#special-commands):
Used within a trial, but not called on an element.

Element commands have two subtypes:

+ Action command: Directly manipulates an element.
+ Test command (PennController equivalent of a conditional statement):
Runs a test on an element, and executes different code blocks depending on the
success or failure of the test.

{% capture label %}
In the **BasicTutorial** experiment, we'll only use action commands, which
we'll refer to just as "commands".
{% endcapture %}
{% include label-note.html label-body=label %}

---

## Commands

Commands do at least one of three things:

+ Manipulate an element's visual content
+ Trigger an element-related event
+ Control an element's interaction with the participant

For example, the
[`print`]({{site.baseurl}}/standard-element-commands/standard-print)
command prints an element to the screen (manipulates visual content), and the
[`play`]({{site.baseurl}}/audio/audio-play) command causes an element
to start playing (triggers element-related event).

### Calling a command

{% capture instructions %}
1. Call the
[`play`]({{site.baseurl}}/audio/audio-play)
command on the `"fish-audio"` Audio element to start audio playback.
2. Call the
[`print`]({{site.baseurl}}/standard-element-commands/standard-print)
command on the `"fish-sentence"` Text element and `"fish-plural"` Image
element to print them to the screen.
3. Click **Refresh** or **Open in new tab** to run the experiment.

When you call a command, you must precede it with a period `.` and follow
it with a pair of parentheses `()`.

<pre><code class="language-diff-javascript diff-highlight">
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
@
@// Experimental trial
@newTrial("experimental-trial",
@    newAudio("fish-audio", "2fishRoundTank.mp3")
+        .play()
@    ,
@    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
+        .print()
@    ,
@    newImage("fish-plural", "2fishRoundTank.png")
+        .print()
@)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

### Evaluating an experiment script

If you run the experiment, it once again immediately ends and displays the
message "The results were successfully sent to the server. Thanks!".

That's odd, didn't we add elements *and* commands?

This reveals a crucial aspect of PennController: it executes experiment scripts
sequentially and continuously, unless it's told to pause.

The current experiment script is executed as follows:

1. Remove the command prefix for all commands.
2. Start the `"experimental-trial"` trial.
3. Create the `"fish-audio`" Audio element and play it.
4. Create the `"fish-sentence"` Text element and print it.
5. Create the `"fish-plural"` Image element and print it.
6. End the `"experimental-trial"` trial.

When the `"experimental-trial"` trial ends, the whole experiment ends because
there are no more trials, and the experiment sends its results to the server
(the PCIbex Farm). All of this occurred within a few milliseconds!

In order to give a participant time to actually interact with an experiment,
your experiment must include elements and commands that explictly pause
experiment script execution.
