---
layout: default
title: Pausing experiment execution
parent: Basic Tutorial
---

## {{page.title}}

Interactive elements and commands can pause experiment script execution, in order to give participants time to interact with the screen.

For example:

{% assign audio_wait = site.action-commands | where: "title", "audio.wait" | first %}
{% assign key_wait = site.action-commands | where: "title", "key.wait" | first %}
+ [`audio.wait`]({{ audio_wait.url | prepend: site.baseurl }}): {{ audio_wait.blurb }}
+ [`key.wait`]({{ key_wait.url | prepend: site.baseurl }}): {{ key_wait.blurb }}
+ Also: `button.wait`, `controller.wait`, `dropdown.wait`, `scale.wait`, and more.

{% capture instructions %}
Use a **Key** element and the `wait` command to pause experiment execution:

<pre><code class="language-diff-javascript diff-highlight"> 
*// This is the BasicTutorial experiment.
*// Type code below this line.
*
*// Remove command prefix
*PennController.ResetPrefix(null)
*
*// Turn off debugger
*// DebugOff()
*
*newTrial("experimental-trial",
*    newAudio("fish-audio", "2fishRoundTank.mp3")
*        .play()
*    ,
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
*        .print()
*    ,
*    newImage("fish-round", "2fishRoundTank.png")    
*        .print()
+    ,
+    newKey("keypress", "FJ")
+        .wait()
*)
</code></pre>

+ The `"keypress"` **Key** element and `wait` command pause experiment script execution until a valid key is pressed, in this example the `F` or `J` key. 
+ After a valid keypress, there are no more commands or trials, so the experiment sends its results and ends.
{% endcapture %}
{% include instructions.html text=instructions%}

If you're testing this experiment, you may notice that if you press the `F` or `J` key while the audio file is playing, the trial ends and the experiment sends its results while the audio file continues playing. 

However, you might want a different sequence of events:

+ **Option 1**: End trial and stop audio playback after a valid keypress.
+ **Option 2**: End trial after audio playback finishes, instead of after a valid keypress.
+ **Option 3**: End trial after audio playback finishes or after a valid keypress, whichever comes second.

In this experiment we will use [**Option 3**](#option-3), but provide all options for reference.

<hr class="grey-lt-000">

### Option 1: End trial and stop audio playback after a valid keypress {#option-1}
To stop audio playback, use the `getX` function to refer back to the `"fish-audio"` **Audio** element and call the `stop` command on it:

<details markdown="block">
<summary class="text-delta collapsible-block">Click to expand/collapse code block</summary>
<pre><code class="language-diff-javascript diff-highlight"> 
*// This is the BasicTutorial experiment.
*// Type code below this line.
*
*// Remove command prefix
*PennController.ResetPrefix(null)
*
*// Turn off debugger
*// DebugOff()
*
*// Experimental trial
*newTrial("experimental-trial",
*    newAudio("fish-audio", "2fishRoundTank.mp3")
*        .play()
*    ,
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
*        .print()
*    ,
*    newImage("fish-round", "2fishRoundTank.png")    
*        .print()
*    ,
*    newKey("keypress", "FJ")
*        .wait()
+    ,
+    getAudio("fish-audio")
+        .stop()
*)
</code></pre>
</details>

The `wait` command on the `"keypress"` **Key** element pauses experiment script execution until a valid keypress. After a valid keypress, the next commands are executed and audio playback is stopped. If audio playback has already finished, then experiment script execution simply continues. In either case, there are no more commands and the trial ends.

<hr class="grey-lt-000">

### Option 2: End trial after audio playback finishes {#option-2}
To end the trial after audio playback finishes, instead of after a valid keypress, call the `wait` command on the `"fish-audio"` **Audio** element instead of on the `"keypress"` **Key** element:

<details markdown="block">
<summary class="text-delta collapsible-block">Click to expand/collapse code block</summary>
<pre><code class="language-diff-javascript diff-highlight"> 
*// This is the BasicTutorial experiment.
*// Type code below this line.
*
*// Remove command prefix
*PennController.ResetPrefix(null)
*
*// Turn off debugger
*// DebugOff()
*
*// Experimental trial
*newTrial("experimental-trial",
*    newAudio("fish-audio", "2fishRoundTank.mp3")
*        .play()
*    ,
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
*        .print()
*    ,
*    newImage("fish-round", "2fishRoundTank.png")    
*        .print()
*    ,
*    newKey("keypress", "FJ")
-        .wait()
+    ,
+    getAudio("fish-audio")
+        .wait()
*)
</code></pre>
</details>

The `wait` command on the `"fish-audio"` **Audio** element pauses experiment execution until audio playback finishes. After audio playback finishes, the experiment script execution continues and the trial ends.

<hr class="grey-lt-100">

### Option 3: End trial after audio playback finishes or valid keypress {#option-3}
To end the trial after audio playback finishes or after a valid keypress, whichever comes second, call the `wait` command on the `"keypress"` **Key** element *and* the `"fish-audio"` **Audio** element.

Critically, the `wait` command on the `"fish-audio"` **Audio** element takes the `"first"` argument.

{% capture instructions %}
Call the `wait("first")` command on the `"fish-audio"` **Audio** element:

<pre><code class="language-diff-javascript diff-highlight"> 
*// This is the BasicTutorial experiment.
*// Type code below this line.
*
*// Remove command prefix
*PennController.ResetPrefix(null)
*
*// Turn off debugger
*// DebugOff()
*
*// Experimental trial
*newTrial("experimental-trial",
*    newAudio("fish-audio", "2fishRoundTank.mp3")
*        .play()
*    ,
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
*        .print()
*    ,
*    newImage("fish-round", "2fishRoundTank.png")    
*        .print()
*    ,
*    newKey("keypress", "FJ")
*        .wait()
+    ,
+    getAudio("fish-audio")
+        .wait("first")
*)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

The `"fish-audio"` **Audio** element takes the `wait("first")` command in order to interact properly with the `"keypress"` **Key** element; if audio playback finishes before the participant presses a valid key, the basic `wait` command (without the `"first"` argument) will actually **pause experiment script execution indefinitely**:

1. Audio playback finishes.
2. The `wait` command on the `"keypress"` **Key** element pauses experiment script execution. The participant presses a valid key.
2. The basic `wait` command on the `"fish-audio"` **Audio** element pauses experiment script execution until audio playback finishes. More specifically, PennController *starts* waiting for an end-of-audio-playback event.
3. However, audio playback has already finished, and PennController will never detect an end-of-audio-playback event. The basic `wait` command cannot be satisfied, and experiment script execution pauses indefinitely.

In contrast, the `wait("first")` command tells PennController to detect *any* end-of-audio-playback event: 

+ If audio playback finishes before the participant presses a valid key:
  1. Audio playback finishes.
  2. The `wait` command on the `"keypress"` **Key** element pauses experiment script execution. The participant presses a valid key.
  3. The `wait("first")` command on the `"fish-audio"` **Audio** element pauses experiment script execution until PennController detects an end-of-audio-playback event.
  4. Audio playback has already finished, so experiment script execution continues immediately and the trial ends.
+ If the participant presses a valid key before audio playback finishes:
  1. The `wait` command on the `"keypress"` **Key** element pauses experiment script execution. The participant presses a valid key.
  2. The `wait("first")` command on the `"fish-audio"` **Audio** element pauses experiment script execution until PennController detects an end-of-audio-playback event.
  3. Audio playback finishes.
  4. Experiment script execution continues and the trial ends.

In this way, the trial ends after audio playback finishes or after a valid keypress, whichever comes second.
  