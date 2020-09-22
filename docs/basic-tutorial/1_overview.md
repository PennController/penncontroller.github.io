---
layout: default
title: Overview
parent: Basic Tutorial
---

## {{ page.title }}

In the **Basic Tutorial**, you'll learn how to create a picture matching experiment. In the experiment, the participant hears and reads a sentence, sees two images, and presses a key to match the sentence with an image.

<div class="border-grey-dk-000 px-4 pb-4" markdown="1">
Preview the **BasicTutorial** experiment:

<p class="text-delta collapsible-block">
  <a href="https://expt.pcibex.net/ibexexps/angelicapan/BasicTutorial/experiment.html" target="_blank">Click to take the experiment</a>
</p> 

<details markdown="block">
<summary class="text-delta collapsible-block">Click to see the final experiment script</summary>
<pre><code class="language-javascript"> 
// This is the BasicTutorial experiment.
// Type code below this line.

// Remove command prefix
PennController.ResetPrefix(null)

// Turn off debugger
DebugOff()

// Instructions
newTrial("instructions",
    defaultText
        .center()
        .print()
    ,
    newText("instructions-1", "&lt;p&gt;Welcome!&lt;/p&gt;")
    ,
    newText("instructions-2", "&lt;p&gt;In this experiment, you will match a sentence with an image. You will hear and read a sentence, and see two images.&lt;/p&gt;")
    ,
    newText("instructions-3", "Press the &lt;b&gt;F&lt;/b&gt; key if the sentence matches the image on the left.")
    ,
    newText("instructions-4", "Press the &lt;b&gt;J&lt;/b&gt; key if the sentence matches the image on the right.")
    ,
    newText("instructions-5", "&lt;p&gt;Click the Spacebar to start the experiment.&lt;/p&gt;")
    ,
    newKey("wait", " ")
        .wait()
)

// Experimental trial
newTrial("experimental-trial",
    newAudio("fish-audio", "2fishRoundTank.mp3")
        .play()
    ,
    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
        .center()
        .unfold(2676)
    ,
    newImage("fish-round", "2fishRoundTank.png")
        .size(200, 200)
    ,
    newImage("fish-square", "1fishSquareTank.png")
        .size(200, 200)
    ,
   	newCanvas("side-by-side", 450,200)
        .add(  0, 0, getImage("fish-round"))
        .add(250, 0, getImage("fish-square"))
        .center()
        .print()
    ,
    newKey("keypress", "FJ")
        .wait()
        .log()
    ,
    getAudio("fish-audio")
        .wait("first")
)
</code></pre>
</details>
</div>

This tutorial is divided into several sections:

+ [Creating an experiment](#creating-an-experiment): how to use PennController and the PCIbex Farm.
  + Creating experiments and trials.
  + Using the debugger.
+ [Adding elements](#adding-elements): how to use elements, the basic unit of a PennController experiment.
  + Using multimedia and interactive elements.
+ [Adding commands](#adding-commands): how to manipulate elements with commands.
  + Displaying multimedia content; playing audio and printing text and images to the screen.
+ [Pausing experiment execution](#pausing-experiment-execution): how to let participants interact with an experiment.
  + Combining interactive elements; pausing an experiment until audio playback finishes or a valid keypress.
+ [Enhancing aesthetics](#enhancing-aesthetics): how to adjust the display of multimedia content.
  + Changing elements visually; centering text and resizing images.
  + Manipulating printed layouts.
+ [Adding instructions](#adding-instructions): how to set trial-wide commands with default objects.
  + Modifying text with HTML tags.
+ [Logging data](#logging-data): how to collect and examine experimental data.
  + Reading a PennController results file.
  + Comparing timestamps to calculate response time.

Each section ends with a <span class="text-delta"><a href="#">Back to top</a></span> link, and you can hover to the left of a section title for a shortcut link to that section.

{% capture label %}
Features that are not covered in this tutorial but that are covered in the [**Advanced Tutorial**]({{site.baseurl}}/docs/advanced-tutorial){:target="_blank"}:

+ Making selections with mouse clicks.
+ Creating timeout tasks.
+ Including HTML documents.
+ Using CSVs or other tables to fill in trial templates.
+ Collecting metadata, for example participant information.
+ Manipulating trial sequencing and trial randomization.
+ Analyzing data in R.
{% endcapture %}
{% include label-note.html label-body=label %}

Follow the tutorial by completing the tasks in the <span class="label label-purple">instructions</span> blocks:

{% capture instructions %}
Code blocks inside an instruction indicate `main.js`, the [experiment script](#editing-an-experiment).

```javascript
// This is a comment.
```
{% endcapture %}
{% include instructions.html text=instructions%}
