---
title: 4. Pausing experiment execution
nav_order: 4
blurb: How to let participants interact with an experiment.
---

Interactive elements and commands can pause experiment script execution, in order
to give participants time to interact with the screen.
{: .h1-blurb }

---

## Some h2

+ [`audio.wait`]({{site.baseurl}}/elements/audio/audio-wait):
Pauses experiment script execution until audio playback finishes.
+ [`key.wait`]({{site.baseurl}}/elements/key/key-wait):
Pauses experiment script execution until a valid keypress.
+ Also: [`button.wait`]({{site.baseurl}}/elements/button/button-wait),
[`controller.wait`]({{site.baseurl}}/elements/controller/controller-wait),
[`dropdown.wait`]({{site.baseurl}}/elements/dropdown/dropdown-wait),
and more.

{% capture instructions %}
1. Create a [`Key`]({{site.baseurl}}/elements/key) named `"keypress"` that "listens" for a press of the `F` or `J` key.
2. Call the [`wait`]({{site.baseurl}}/elements/key/key-wait) command on the `"keypress"` `Key` to pause experiment script execution until the participant presses a valid key, in this case the `F` or `J` key.

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

If the participant presses the `F` or `J` key while the audio file is still playing, the trial ends and the experiment sends its results while the audio file continues playing. 

However, you might want a different sequence of events:

+ **Option 1**: End trial and stop audio playback after a valid keypress.
+ **Option 2**: End trial after audio playback finishes, instead of after a valid keypress.
+ **Option 3**: End trial after audio playback finishes or after a valid keypress, whichever comes second.

In this experiment we'll use [**Option 3**](#option-3), but provide all options for reference.

<div class="dotted-grey-dk-000 px-4 pt-3" markdown="1">
{% capture content %}

**Option 1: End trial and stop audio playback after a valid keypress**

+ Call the [`stop`]({{site.baseurl}}/elements/audio/audio-stop) command on the `"fish-audio"` `Audio` to stop audio playback.

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
+        .stop()
@)
</code></pre>
{% endcapture %}
{% include collapsible-block.html content=content summary="Option 1: click for more details" %}

{% capture content %}

**Option 2: End trial after audio playback finishes, instead of after a valid keypress**

+ Call the [`wait`]({{site.baseurl}}/elements/audio/audio-wait) command on the `"fish-audio"` `Audio` (instead of on the `"keypress"` `Key`) to pause experiment script execution until audio playback finishes.

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
{% include collapsible-block.html content=content summary="Option 2: click for more details" %}
</div>

---

## End trial after audio playback finishes or valid keypress {#option-3}

To end the trial after audio playback finishes or after a valid keypress, whichever comes second, pause the experiment script execution at the `"keypress"` `Key` *and* at the `"fish-audio"` `Audio`.

{% capture instructions %}

+ Call the [`wait("first")`]({{site.baseurl}}/elements/audio/audio-wait#optional-arguments) command on the `"fish-audio"` `Audio` to pause experiment script execution until an end-of-audio-playback event.

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

### Some h3

When called on an `Audio` element, the `wait("first")` command and the plain `wait` command differ in an important way:

+ `wait("first")`: tells PennController to wait for *any* end-of-audio-playback event.
+ `wait`: tells PennController to *start* waiting for an end-of-audio-playback event.

This difference is important in the situation where audio playback finishes before the participant presses a valid key:

+ Using the `wait("first")` command:
  1. Audio playback finishes.
  2. The `wait` command on the `"keypress"` `Key` pauses experiment script execution. The participant presses a valid key.
  3. The `wait("first")` command on the `"fish-audio"` `Audio` pauses experiment script execution. PennController waits for *any* end-of-audio-playback event.
  4. Audio playback has already finished, which satisfies the `wait("first")` command. Experiment script execution continues immediately and the trial ends.
+ Using the plain `wait` command:
  1. Audio playback finishes.
  2. The `wait` command on the `"keypress"` `Key` pauses experiment script execution. The participant presses a valid key.
  3. The basic `wait` command on the `"fish-audio"` `Audio` pauses experiment script execution. PennController *starts* waiting for an end-of-audio-playback event.
  4. However, audio playback has already finished, and PennController will never detect an end-of-audio-playback event. The basic `wait` command cannot be satisfied, and **experiment script execution pauses indefinitely**.
  