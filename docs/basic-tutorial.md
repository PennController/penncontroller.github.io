---
layout: tutorial-parent
title: Basic Tutorial
has_children: true
has_toc: false
nav_order: 3
---

# {{ page.title }}

This tutorial is designed for people who prefer learning by doing. If you prefer to learn concept-by-concept, check out the [**Core Concepts**](./core-concepts){:target="_blank"} section. You may find it useful to read both this tutorial and the **Core Concepts** section.
{: .h1-blurb }

---

## Goal

In the **Basic Tutorial**, you'll learn how to create a picture matching experiment with the following structure:

1. Instructions screen with button to start the experiment
2. Experimental trial:
    1. A sentence plays as audio and unfolds as text on the screen.
    2. Two images are printed to the screen next to each other.
    3. Participant presses a key to select an image.
    4. Trial ends.

<div class="dashed-grey-dk-000 px-4" markdown="1">
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

{% assign children_list = site.html_pages | where: "parent", page.title %}
<ol>
{% for child in children_list %}
  <li>
  {% assign modified_title = child.title | split: ". " | last %}
    <a href="{{ child.url | prepend: site.baseurl }}" target="_blank">{{ modified_title }}</a>: {{ child.blurb }}
  </li>
{% endfor %}
</ol>

---

## How to follow the tutorial

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

### Prerequisites

PennController does not require any background in JavaScript. However, you should have some general knowledge of programming and experimental design.

In particular, you should be familiar with the following terms and concepts:
+ Calling a command, command parameters
+ Strings, integers, truth values, code comments,
+ Experimental items, trials, 

### Technical notes

Blocks that are labeled with <span class="label">technical notes</span> contain extra information about PennController. 

{% capture label %}
This is an example of a technical note.
{% endcapture %}
{% include label-technical.html label-body=label %}

**Reading technical notes is optional**, but you 

### Instruction blocks

Follow the tutorial by completing the tasks in the <span class="label label-purple">instructions</span> blocks:

{% capture instructions %}
1. *Step one*
2. *Step two*
3. *Step three*

```javascript
// Lines that begin with a + sign and that have a green background indicate newly-added lines.

// Lines that begin with a - sign and that have a red background indicate newly-deleted lines.

// Lines that begin with a ! sign and that have a yellow background indicate lines that have been modified.
```
{% endcapture %}
{% include instructions.html text=instructions %}
