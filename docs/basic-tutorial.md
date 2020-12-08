---
layout: tutorial-parent
title: Basic Tutorial
has_children: true
has_toc: false
nav_order: 3
---

# {{ page.title }}

This tutorial is designed for people who prefer learning by doing. If you prefer to learn concept-by-concept, check out the [**Core Concepts**](./core-concepts){:target="_blank"} section. You may find it useful to read both this tutorial and the **Core Concepts** section.
{: .fs-5 .fw-300 }

---

## Overview

In the **Basic Tutorial**, you'll learn how to create a picture matching experiment with the following structure:

1. Instructions screen with button to start the experiment
2. Experimental trial:
    1. A sentence plays as audio and unfolds as text on the screen.
    2. Two images are printed to the screen next to each other.
    3. Participant presses a key to select an image.
    4. Trial ends.

<div class="dotted-grey-dk-000 px-4" markdown="1">
Preview the **BasicTutorial** experiment:

<p class="text-delta collapsible-block-title">
  <a href="https://expt.pcibex.net/ibexexps/angelicapan/BasicTutorial/experiment.html" target="_blank">Click to take the experiment</a>
</p> 

{% capture content %}
```javascript
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
    newText("instructions-1", "Welcome!")
    ,
    newText("instructions-2", "<p>In this experiment, you will hear and read a sentence, and see two images.</p>")
    ,
    newText("instructions-3", "<b>Select the image that better matches the sentence:</b>")
    ,
    newText("instructions-4", "<p>Press the <b>F</b> key to select the image on the left.<br>Press the <b>J</b> key to select the image on the right.</p>")
    ,
    newButton("wait", "Click to start the experiment")
        .center()
        .print()
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
    newImage("fish-plural", "2fishRoundTank.png")
        .size(200, 200)
    ,
    newImage("fish-singular", "1fishSquareTank.png")
        .size(200, 200)
    ,
   	newCanvas("side-by-side", 450,200)
        .add(  0, 0, getImage("fish-plural"))
        .add(250, 0, getImage("fish-singular"))
        .center()
        .print()
        .log()
    ,
    newKey("keypress", "FJ")
        .log()
        .wait()
    ,
    getAudio("fish-audio")
        .wait("first")
)
```
{% endcapture %}
{% include collapsible-block.html content=content summary="Click to see the final experiment script" %}
</div>

---

## Table of contents

1. [Overview](#overview)
2. [Creating an experiment](#creating-an-experiment): how to use PennController and the PCIbex Farm
3. [Adding elements](#adding-elements):  how to use elements, the basic unit of a PennController experiment
4. [Adding commands](#adding-commands): how to manipulate elements with commands
5. [Pausing experiment execution](#pausing-experiment-execution): how to let participants interact with an experiment
6. [Enhancing aesthetics](#enhancing-aesthetics): how to adjust the display of multimedia content
7. [Adding instructions](#adding-instructions): how to set trial-wide commands with default objects
8. [Logging data](#logging-data): how to collect and examine experimental data
9. [Wrapping up](#wrapping-up)

---

## Prerequisites

---

## Following the tutorial

Follow the tutorial by completing the tasks in the <span class="label label-purple">instructions</span> blocks:

{% capture instructions %}
Code blocks inside an instruction indicate `main.js`, the [experiment script](#editing-an-experiment).

```javascript
// This is a comment.
```
{% endcapture %}
{% include instructions.html text=instructions%}
