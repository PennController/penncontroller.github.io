---
layout: default
title: Customizing the experimental trial
parent: Advanced Tutorial
nav_order: 4
---
## {{ page.title }}

This section describes ways to customize the `"experimental-trial"` **Trial**:

+ [Selecting an image with a mouse click](#selecting-an-image-with-a-mouse-click)
+ [Creating a trial timeout to end a trial early](#creating-a-timeout)
+ [Adding a delay to the start of a trial](#adding-a-trial-delay)
+ [Manipulating multimedia content visually with CSS styles](#using-css-styles)
+ [Saving experiment results before the end of an experiment](#adding-a-completion-screen)

### Selecting an image with a mouse click

In the **AdvancedTutorial** experiment, the participant selects an image by pressing the `F` or `J` key. We'll include the option of clicking on an image to select it by using a [**Selector**]({{site.baseurl}}/docs/elements/selector){:target="_blank"}. 

A **Selector** creates a group of elements, where (by default) each member can be selected with a mouse click. We can then associate a key to each member, so that a keypress will also select the desired element. 

{% capture instructions %}
+ Remove the `"keypress"` **Key**.
+ Create a [**Selector**]({{site.baseurl}}/docs/elements/selector){:target="_blank"} named `"selection"`.
  1. Call the [`add`]({{site.baseurl}}/docs/selector/selector-add){:target="_blank"} command to add the `"singular"` and `"plural"` **Image** elements
  2. Call the [`keys`]({{site.baseurl}}/docs/selector/selector-keys){:target="_blank"} command to associate the `F` and `J` keys to the singular image and plural image, respectively. 
  3. Call the [`log`]({{site.baseurl}}/docs/selector/selector-log){:target="_blank"} command to log information about the participant's selection.
  4. Call the [`once`]({{site.baseurl}}/docs/selector/selector-once){:target="_blank"} command so that only the first image selection is valid (without the `once` command, the participant can change the selected image, up until the trial ends).
  5. Call the [`wait`]({{site.baseurl}}/docs/selector/selector-wait){:target="_blank"} command to pause experiment script execution until the participant selects an element.

*If you are copy and pasting this code, delete any lines highlighted with a red background.*
<pre><code class="language-diff-javascript diff-highlight"> 
*// code omitted in interest of space
*
*// Experimental trial
*Template("items.csv", row => 
*    newTrial("experimental-trial",
*        newAudio("audio", row.audio)
*            .play()
*        ,
*        newText("sentence", row.sentence)
*            .center()
*            .unfold(row.duration)
*        ,
*        newImage("singular", row.singular_image)
*            .size(200, 200)
*        ,
*        newImage("plural", row.plural_image)
*            .size(200, 200)
*        ,
*        newCanvas("side-by-side", 450,200)
*            .add(  0, 0, getImage("plural"))
*            .add(250, 0, getImage("singular"))
*            .center()
*            .print()
*        ,
-        newKey("keypress", "FJ")
-            .log()
-            .wait()
+        newSelector("selection")
+            .add(getImage("plural"), getImage("singular"))
+            .keys("F", "J")
+            .log()
+            .once()
+            .wait()
*        ,
*        getAudio("audio")
*            .wait("first")
*    )
*    .log("group", row.group)
*    .log("item", row.item)
*    .log("condition", row.inflection)
*)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

### Creating a timeout

The `"experimental-trial"` **Trial** ends after audio playback finishes or a valid keypress, [whichever comes second]({{site.baseurl}}/docs/basic-tutorial/#option3){:target="_blank"}.

We'll modify the trial so that it ends after whichever comes *first*:

+ If the participant presses a valid key while audio playback is still ongoing, the trial ends after the keypress.
+ If audio playback finishes before the participant presses a valid key, the trial ends after audio playback finishes.

In other words, the participant has until the audio playback finishes to press a valid key, otherwise the trial times out and ends. 

{% capture instructions %}
+ Create a timeout:
  1. Create and start a [**Timer**]({{site.baseurl}}/docs/elements/timer){:target="_blank"} named `"timeout"` that is `row.duration` ms long.
  2. Call the [`callback`]({{site.baseurl}}/docs/selector/selector-callback){:target="_blank"} command on the `"selection"` **Selector**. When an image is selected, the `callback` command will stop the `"timeout"` **Timer**. Remove the `once` and `wait` commands.
  3. Call the [`wait`]({{site.baseurl}}/docs/timer/timer-wait){:target="_blank"} command on the `"timeout"` **Timer** to pause experiment script execution until the timer stops.
  4. Call the [`stop`]({{site.baseurl}}/docs/audio/audio-stop){:target="_blank"} command on the `"audio"` **Audio** to stop audio playback when the timer stops. Remove the `wait("first")` command.

*If you are copy and pasting this code, delete any lines highlighted with a red background.*

<pre><code class="language-diff-javascript diff-highlight"> 
*// code omitted in interest of space
*
*// Experimental trial
*Template("items.csv", row => 
*    newTrial("experimental-trial",
*        newAudio("audio", row.audio)
*            .play()
+        ,
+        newTimer("timeout", row.duration)
+            .start()
*        ,
*        newText("sentence", row.sentence)
*            .center()
*            .unfold(row.duration)
*        ,
*        newImage("plural", row.plural_image)
*            .size(200, 200)
*        ,
*        newImage("singular", row.singular_image)
*            .size(200, 200)
*        ,
*        newCanvas("side-by-side", 450,200)
*            .add(  0, 0, getImage("plural"))
*            .add(250, 0, getImage("singular"))
*            .center()
*            .print()
*        ,
*        newSelector("selection")
*            .add(getImage("plural"), getImage("singular"))
*            .keys("F", "J")
*            .log()
-            .once()
-            .wait()
+            .callback(getTimer("timeout").stop())
+        ,
+        getTimer("timeout")
+            .wait()
*        ,
*        getAudio("audio")
-            .wait("first)
+            .stop()
*    )
*    .log("group", row.group)
*    .log("item", row.item)
*    .log("condition", row.inflection)
*)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

The timeout is created as follows:

1. The `"timeout"` **Timer** starts right after the `"audio"` **Audio** starts playing. The `"timeout"` **Timer** and the `"audio"` **Audio** are both `row.duration` ms long.
2. Experiment script execution continues until it reaches the `wait` command on the `"timeout"` **Timer** element. The `wait` command pauses experiment script execution until PennController detects an end-of-timer event.
3. If the participant selects an image before audio playback finishes:
    + The participant selects an image. The `callback` command on the `"selection"` **Seleector** triggers the execution of `getTimer("timeout").stop()`, which stops the `"timeout"` **Timer** element and validates the `wait` command.
    
    *OR*
    
    If audio playback finishes before the participant selects an image:
    + The `"timeout"` **Timer** element stops naturally and validates the `wait` command.
4. Experiment script execution continues. The `stop` command is called on the `"audio"` **Audio** element. There are no more commands, so the **Trial** "times out" and ends.

### Adding a trial delay

Each trial begins as soon as the previous trial ends. This might be overwhelming for participants, so we'll create a one-second pause between trials. 

{% capture instructions %}
Create and start a **Timer** named `"break"` that is 1000ms long. Call the [`wait`]({{site.baseurl}}/docs/timer/timer-wait){:target="_blank"} command to pause experiment script execution until the timer stops:

<pre><code class="language-diff-javascript diff-highlight"> 
*// code omitted in interest of space
*
*// Experimental trial
*Template("items.csv", row => 
*    newTrial("experimental-trial",
+        newTimer("break", 1000)
+            .start()
+            .wait()
*        ,
*        newAudio("audio", row.audio)
*            .play()
*        ,
*        newTimer("timeout", row.duration)
*            .start()
*        ,
*        newText("sentence", row.sentence)
*            .center()
*            .unfold(row.duration)
*        ,
*        newImage("plural", row.plural_image)
*            .size(200, 200)
*        ,
*        newImage("singular", row.singular_image)
*            .size(200, 200)
*        ,
*        newCanvas("side-by-side", 450,200)
*            .add(  0, 0, getImage("plural"))
*            .add(250, 0, getImage("singular"))
*            .center()
*            .print()
*            .log()
*        ,
*        newSelector("selection")
*            .add(getImage("plural"), getImage("singular"))
*            .keys("F", "J")
*            .log()
*            .callback(getTimer("timeout").stop())
*        ,
*        getTimer("timeout")
*            .wait()
*        ,
*        getAudio("audio")
*            .stop()
*    )
*    .log("group", row.group)
*    .log("item", row.item)
*    .log("condition", row.inflection)
*)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

### Using CSS styles

The [`css`]({{site.baseurl}}/docs/standard-element-commands/standard-css){:target=":blank"} and [`cssContainer`]({{site.baseurl}}/docs/standard-element-commands/standard-csscontainer){:target=":blank"} commands are equivalent to using [inline CSS](https://www.w3schools.com/html/html_css.asp){:target="_blank"} to apply a style or styles. The `css` command applies the CSS style(s) to the specified element, and the `cssContainer` command applies the CSS style(s) to the container of the specified element.

{% capture instructions %}
+ Update the instructions to reflect the changes in the `"experimental-trial"` **Trial**.
+ Call the [`cssContainer`]({{site.baseurl}}/docs/standard-element-commands/standard-csscontainer){:target=":blank"} command on the `defaultText` object to add a 1em bottom margin to every **Text** element container. 
+ Remove the `<p></p>` tags.

<pre><code class="language-diff-javascript diff-highlight"> 
*// code omitted in interest of space
*
*// Instructions
*newTrial("instructions",
*    defaultText
+        .cssContainer({"margin-bottom":"1em"})
*        .center()
*        .print()
*    ,
*    newText("instructions-1", "Welcome!")
*    ,
!    newText("instructions-2", "In this experiment, you will hear and read a sentence, and see two images.")
*    ,
*    newText("instructions-3", "&lt;b&gt;Select the image that better matches the sentence:&lt;/b&gt;")
*    ,
!    newText("instructions-4", "Press the &lt;b&gt;F&lt;/b&gt; key to select the image on the left.&lt;br&gt;Press the &lt;b&gt;J&lt;/b&gt; key to select the image on the right.&lt;br&gt;You can also click on an image to select it.")
+    ,
+    newText("instructions-5", "If you do not select an image by the time the audio finishes playing,&lt;br&gt;the experiment will skip to the next sentence.")
*    ,
*    newButton("wait", "Click to start the experiment")
*        .center()
*        .print()
*        .wait()
*)
*
*// code omitted in interest of space
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

We're calling the `cssContainer` command instead of using the `<p></p>` HTML tags in order to better control the vertical line spacing.

{% capture content %}
It's possible to use `<p></p>` tags instead of calling the `cssContainer` command:

<pre><code class="language-diff-javascript diff-highlight"> 
* // code omitted in interest of space
*
*// Instructions
*newTrial("instructions",
*    defaultText
*        .center()
*        .print()
*    ,
*    newText("instructions-1", "Welcome!")
*    ,
*    newText("instructions-2", "&lt;p&gt;In this experiment, you will hear and read a sentence, and see two images.&lt;/p&gt;")
*    ,
*    newText("instructions-3", "&lt;b&gt;Select the image that better matches the sentence:&lt;/b&gt;")
*    ,
!    newText("instructions-4", "&lt;p&gt;Press the &lt;b&gt;F&lt;/b&gt; key to select the image on the left.&lt;br&gt;Press the &lt;b&gt;J&lt;/b&gt; key to select the image on the right.&lt;br&gt;You can also click on an image to select it.&lt;/p&gt;")
+    ,
+    newText("instructions-5", "&lt;p&gt;If you do not select an image by the time the audio finishes playing,&lt;br&gt;the experiment will skip to the next sentence.&lt;/p&gt;")
*    ,
*    newButton("wait", "Click to start the experiment")
*        .center()
*        .print()
*        .wait()
*)
*
*// code omitted in interest of space
</code></pre>

However, if you add `<p></p>` HTML tags to the `"instructions-5"` **Text**, then there will be two lines of space in between the `"instructions-4"` and `"instructions-5"` **Text** elements, because the `"instructions-4"` **Text** also has `<p></p>` tags.

If you don't add the `<p></p>` tags, then there won't be a line of space between the `"instructions-5"` **Text** and `"wait"` **Button**:

<div class="d-flex mb-4" style="flex-flow: row wrap; justify-content: space-around;">
  <div class="centered-50">
    <img class="dotted-grey-dk-000" src="{{site.baseurl}}/assets/tutorials/double-p.png" alt="double-p">with <code>&lt;p&gt;&lt;/p&gt;</code> tags on <code>"instructions-5"</code>
  </div>
  <div class="centered-50">
    <img class="dotted-grey-dk-000" src="{{site.baseurl}}/assets/tutorials/no-p.png" alt="no-p">without <code>&lt;p&gt;&lt;/p&gt;</code> tags on <code>"instructions-5"</code>
  </div>
</div>

With the `cssContainer` command:
<img class="mt-2 dotted-grey-dk-000" src="{{site.baseurl}}/assets/tutorials/margin-bottom.png" alt="margin-bottom">

{% endcapture %}
{% include collapsible-block.html content=content summary="Click for more details" inner-border=true %}

### Adding a completion screen

We'll add a completion screen **Trial** to the end of the experiment.

By default, PennController sends the experiment results to the PCIbex Farm server after all the **Trial** objects have ended. Use the global command [`SendResults`]({{site.baseurl}}/docs/global-commands/sendresults){:target="_blank"} to manually control when PennController sends results, and send results *before* the completion screen **Trial** begins. This will help ensure that participants don't close their web browser before the experiment results are sent and saved.

We'll create a **Button** and call the `wait` command on it to pause experiment script execution, so that participants have time to read the completion screen **Trial**. 

However, there is no need for participants to go beyond this **Trial**; the experiment is already over, and the results have already been sent. Pause experiment script execution indefinitely by calling the `wait` command on the **Button** *without* printing it. The participant will never be able to click the button, and the `wait` command will never be satisfied.

{% capture instructions %}
+ Call the [`SendResults`]({{site.baseurl}}/global-commands/sendresults){:target="_blank"} global command and label it `"send"`.
+ Create a new **Trial** labeled `"completion_screen"`.
  + Create and print a centered **Text** named `"thanks"`.
  + Create a new **Button** named `"void"`. Call the [`wait`]({{site.baseurl}}/docs/button/button-wait){:target="_blank"} command on it, but do *not* print it to the screen.

<pre><code class="language-diff-javascript diff-highlight"> 
*// code omitted in interest of space
*
*// Experimental trial
*Template("items.csv", row => 
*    // code omitted in interest of space
*)
*
+// Send results manually
+SendResults("send")
*
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