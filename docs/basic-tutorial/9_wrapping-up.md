---
layout: default
title: Wrapping up
parent: Basic Tutorial
---

## {{ page.title }}

<div class="border-grey-dk-000 px-4 py-4" markdown="1">
<details markdown="block">
<summary class="text-delta collapsible-block">Click to see the final experiment script</summary>
<pre><code class="language-javascript"> 
// This is the BasicTutorial experiment.
// Type code below this line.

// Remove command prefix
PennController.ResetPrefix(null)

// Turn off debugger
DebugOff()

// Welcome screen
newTrial("welcome",
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
    newAudio("description", "2fishRoundTank.mp3")
        .play()
    ,
    newText("fish-description", "The fish swim in a tank which is perfectly round.")
        .center()
        .unfold(2600)
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
    getAudio("description")
        .wait("first")
)
</code></pre>
</details>
</div>

Congratulations! You’ve learned how to:

+ Create experiments and trials on the PCIbex Farm.
+ Use multimedia and interactive elements.
+ Manipulate elements with commands.
+ Combine interactive elements.
+ Change elements visually.
+ Set trial-wide commands with default objects.
+ Log experimental data.

Now that you've learned the basics of PennController, we recommend reading the [**Advanced Tutorial**]({{site.baseurl}}/docs/advanced-tutorial){:target="_blank"}, where you'll learn how to do things like:

+ Make selections with mouse clicks.
+ Create timeout tasks.
+ Include HTML documents.
+ Use CSVs or other tables to fill in trial templates.
+ Collect metadata, for example participant information.
+ Manipulate trial sequencing and trial randomization.
+ Analyze data in R.

You can also jump right in and [start creating your own experiments](https://expt.pcibex.net/){:target="_blank"}. If you have questions, visit the [**Troubleshooting**]({{site.baseurl}}/docs/troubleshooting){:target="_blank"} page, check out our [**how-to guides**]({{site.baseurl}}/docs/how-to-guides){:target="_blank"}, or post a question on our [support forum](https://www.pcibex.net/forums/){:target="_blank"}.