---
title: 9. Customizing an experiment
nav_order: 2
start_heading: 9

---

In this section, we'll add the option of selecting an image with a mouse click,
use CSS styles, create a trial timeout and a trial delay, and add a completion
screen.
{: .h1-blurb }

---

## Selecting an image with a mouse click

Currently, the participant can only select an image by pressing the `F` or `J`
key. We'll use a [Selector]({{site.baseurl}}/selector) element to include the
option of clicking on an image to select it.

A Selector creates a group of elements, where (by default) each member can be
selected by a mouse click. We can then associate a key to each member, so that
a keypress also selects the desired element.

{% capture instructions %}
1. Remove the `"keypress"` Key.
2. Create a [Selector]({{site.baseurl}}/selector) named `"selection"`.
3. [`Add`]({{site.baseurl}}/selector/selector-add) the `"singular"` and
`"plural"` Image elements to the Selector.
4. Call the [`keys`]({{site.baseurl}}/selector/selector-keys) command to
associate the `F` and `J` keys to the singular and plural images, respectively.
5. [`Log`]({{site.baseurl}}/selector/selector-log) information about the
Selector element.
6. Call the [`once`]({{site.baseurl}}/selector/selector-once) command so that
only the first image selection is valid (without the `once` command, the
participant can change which image they select).
7. Call the [`wait`]({{site.baseurl}}/selector/selector-wait) command to pause
experiment script execution until the participant selects an element.

<pre><code class="language-diff-javascript diff-highlight">
@// code omitted in interest of space
@
@// Experimental trial
@Template("items.csv", row => 
@    newTrial("experimental-trial",
@        newAudio("audio", row.audio)
@            .play()
@        ,
@        newText("sentence", row.sentence)
@            .center()
@            .unfold(row.duration)
@        ,
@        newImage("singular", row.singular_image)
@            .size(200, 200)
@        ,
@        newImage("plural", row.plural_image)
@            .size(200, 200)
@        ,
@        newCanvas("side-by-side", 450,200)
@            .add(  0, 0, getImage("plural"))
@            .add(250, 0, getImage("singular"))
@            .center()
@            .print()
@        ,
-        newKey("keypress", "FJ")
-            .log()
-            .wait()
+        newSelector("selection")
+            .add(getImage("plural"), getImage("singular"))
+            .keys("F", "J")
+            .log()
+            .once()
+            .wait()
@        ,
@        getAudio("audio")
@            .wait("first")
@    )
@    .log("group", row.group)
@    .log("item", row.item)
@    .log("condition", row.inflection)
@)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

---

## Using CSS styles for vertical spacing

We'll update the instructions to reflect the clicking option. We'll also use the
[`cssContainer`]({{site.baseurl}}/standard-element-commands/standard-csscontainer)
command to replace the `<p></p>` HTML tags on some Text elements with a 1em bottom
margin on all Text elements.

{% capture instructions %}
1. Create a new Text element named `"instructions-5"`.
2. Call the
[`cssContainer`]({{site.baseurl}}/standard-element-commands/standard-csscontainer)
command on the `defaultText` object to add a 1em bottom margin to every Text
element container.
3. Remove the `<p></p>` tags from the `"instructions-2"` and `"instructions-4"`
Text elements.

<pre><code class="language-diff-javascript diff-highlight">
@// code omitted in interest of space
@
@// Instructions
@newTrial("instructions",
@    defaultText
+        .cssContainer({"margin-bottom":"1em"})
@        .center()
@        .print()
@    ,
@    newText("instructions-1", "Welcome!")
@    ,
!    newText("instructions-2", "In this experiment, you will hear and read a sentence, and see two images.")
@    ,
@    newText("instructions-3", "&lt;b&gt;Select the image that better matches the sentence:&lt;/b&gt;")
@    ,
!    newText("instructions-4", "Press the &lt;b&gt;F&lt;/b&gt; key to select the image on the left.&lt;br&gt;Press the &lt;b&gt;J&lt;/b&gt; key to select the image on the right.&lt;br&gt;You can also click on an image to select it.")
+    ,
+    newText("instructions-5", "If you do not select an image by the time the audio finishes playing,&lt;br&gt;the experiment will skip to the next sentence.")
@    ,
@    newButton("wait", "Click to start the experiment")
@        .center()
@        .print()
@        .wait()
@)
@
@// code omitted in interest of space
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

---

## Creating a timeout

Currently, the `"experimental-trial"` trial ends after audio playback finishes
or an image is selected,
[whichever comes second]({{site.baseurl}}/basic-tutorial/#pause-experiment).

We'll modify the trial so that it ends after whichever comes *first*. In other
words, the participant has until the audio playback finishes to select an
image before the trial times out and ends.

The timeout uses a [Timer]({{site.baseurl}}/timer) element and a `callback`
command. A `callback` command specifies an element with some command(s), and when
the `callback` command is evaluated it triggers the execution of the specified
command(s) on the specified element.

{% capture instructions %}
1. Create a [Timer]({{site.baseurl}}/timer) named `"timeout"` that is
`row.duration` ms long.
2. [Start]({{site.baseurl}}/timer/timer-start) the Timer.
3. Remove the `once` and `wait` commands on the `"selection"` Selector.
4. Call the [`callback`]({{site.baseurl}}/selector/selector-callback) command
on the `"selection"` Selector. When an image is selected, the `callback`
command will stop the `"timeout"` Timer.
5. Refer back to the `"timeout"` Timer and call the
[`wait`]({{site.baseurl}}/timer/timer-wait) command to pause experiment script
execution until the Timer stops.
6. Remove the `getAudio("audio").wait("first")` block.

<pre><code class="language-diff-javascript diff-highlight">
@// code omitted in interest of space
@
@// Experimental trial
@Template("items.csv", row =>
@    newTrial("experimental-trial",
@        newAudio("audio", row.audio)
@            .play()
+        ,
+        newTimer("timeout", row.duration)
+            .start()
@        ,
@        newText("sentence", row.sentence)
@            .center()
@            .unfold(row.duration)
@        ,
@        newImage("plural", row.plural_image)
@            .size(200, 200)
@        ,
@        newImage("singular", row.singular_image)
@            .size(200, 200)
@        ,
@        newCanvas("side-by-side", 450,200)
@            .add(  0, 0, getImage("plural"))
@            .add(250, 0, getImage("singular"))
@            .center()
@            .print()
@        ,
@        newSelector("selection")
@            .add(getImage("plural"), getImage("singular"))
@            .keys("F", "J")
@            .log()
-            .once()
-            .wait()
+            .callback(getTimer("timeout").stop())
+        ,
+        getTimer("timeout")
+            .wait()
@        ,
-        getAudio("audio")
-            .wait("first)
@    )
@    .log("group", row.group)
@    .log("item", row.item)
@    .log("condition", row.inflection)
@)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

The timeout is created as follows:

1. The `"timeout"` Timer starts after the `"audio"` Audio starts playing. Both
elements are `row.duration` ms long.
2. Experiment script execution continues as normal until PennController reaches
the `wait` command on the `"timeout"` Timer. The `wait` command pauses experiment
script execution until PennController detects an end-of-timer event.
    + If the participant selects an image before audio playback finishes, the
    image selection calls the `callback` command on the `"selection"` Selector,
    which triggers the execution of `getTimer("timeout").stop()`. The Timer stops,
    and validates the `wait` command.
    + If audio playback finishes before the participant selects an image, the
    `"timeout"` Timer stops naturally, and validates the `wait` command.

---

## Adding a trial delay

Each trial begins as soon as the previous trial ends. This might be overwhelming
for participants, so we'll create a one-second pause between trials.

{% capture instructions %}
1. Create and start a Timer named `"break"` that is 1000ms long.
2. Call the [`wait`]({{site.baseurl}}/timer/timer-wait) command on the `"break"`
Timer to pause experiment script execution until the timer stops.

<pre><code class="language-diff-javascript diff-highlight">
@// code omitted in interest of space
@
@// Experimental trial
@Template("items.csv", row => 
@    newTrial("experimental-trial",
+        newTimer("break", 1000)
+            .start()
+            .wait()
@        ,
@        newAudio("audio", row.audio)
@            .play()
@        ,
@        newTimer("timeout", row.duration)
@            .start()
@        ,
@        newText("sentence", row.sentence)
@            .center()
@            .unfold(row.duration)
@        ,
@        newImage("plural", row.plural_image)
@            .size(200, 200)
@        ,
@        newImage("singular", row.singular_image)
@            .size(200, 200)
@        ,
@        newCanvas("side-by-side", 450,200)
@            .add(  0, 0, getImage("plural"))
@            .add(250, 0, getImage("singular"))
@            .center()
@            .print()
@            .log()
@        ,
@        newSelector("selection")
@            .add(getImage("plural"), getImage("singular"))
@            .keys("F", "J")
@            .log()
@            .callback(getTimer("timeout").stop())
@        ,
@        getTimer("timeout")
@            .wait()
@    )
@    .log("group", row.group)
@    .log("item", row.item)
@    .log("condition", row.inflection)
@)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

---

## Adding a completion screen

By default, PennController sends an experiment's results to the PCIbex Farm
server after all the trials have ended. However, we can use the global command
[`SendResults`]({{site.baseurl}}/global-commands/sendresults) to manually control
when results are sent.

We'll add a completion screen to the end of the experiment, and send results right
before the completion screen trial actually begins. Since the completion screen is
still part of the experiment, this will help ensure that participants don't close
their web browser before the results from the experimental trials are sent to
the server.

As usual, we'll use a Button and a `wait` command to pause experiment script
execution during the completion screen, so that participants have time to read it.
This time though, we'll force the experiment to pause indefinitely by not printing
the Button; since the participant can't click the Button, the `wait` command is
never satisifed.

You can use this trick whenever you want to permanently stop a participant from
continuing!

{% capture instructions %}
1. Call the [`SendResults`]({{site.baseurl}}/global-commands/sendresults) global
command and label it `"send"`.
2. Create a new trial labeled `"completion_screen"`.
3. Create and print a centered Text named `"thanks"`.
4. Create a new Button named `"void"`. Call the
[`wait`]({{site.baseurl}}/button/button-wait) command on it, but do *not* print
it to the screen.

<pre><code class="language-diff-javascript diff-highlight">
@// code omitted in interest of space
@
@// Experimental trial
@Template("items.csv", row => 
@    // code omitted in interest of space
@)
@
+// Send results manually
+SendResults("send")
@
+// Completion screen
+newTrial("completion_screen",
+    newText("thanks", "Thank you for participating! You may now exit the window.")
+        .center()
+        .print()
+    ,
+    newButton("void", "")
+        .wait()
+)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}
