---
layout: bottom-navbar-parent
title: Basic Tutorial
permalink: /basic-tutorial/
nav_order: 4
---

# {{ page.title }}

This tutorial is designed for people who prefer learning by doing. If you prefer
to learn concept-by-concept, check out the
[**Core Concepts**]({{site.baseurl}}/core-concepts)
section. You may find it useful to read both this tutorial and the
**Core Concepts** section.
{: .h1-blurb }

---

## Goal

In the **Basic Tutorial**, you'll learn how to create a simple picture matching
experiment with the following structure:

1. Instructions screen with button to start the experiment
2. Experimental trial:
    1. A sentence plays as audio and unfolds as text on the screen.
    2. Two images are printed to the screen next to each other.
    3. Participant presses a key to select an image.
    4. Trial ends.

<div class="dashed-grey-dk-000 px-4" markdown="1">
Preview the **BasicTutorial** experiment:

<p class="text-delta collapsible-block-title">
  <a href="https://farm.pcibex.net/r/QuFrkC/experiment.html" target="_blank">
    Click to take the experiment
  </a>
</p>

{% capture content %}
```javascript
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
{% include collapsible-block.html content=content
summary="Click to see the final experiment script" %}
</div>

---

## Table of contents

{% assign children_list = site.html_pages | where: "parent", page.title %}
<ol>
{% for child in children_list %}
  <li>
  {% assign modified_title = child.title | split: ". " | last %}
    <a href="{{ child.url | prepend: site.baseurl }}">
      {{ modified_title }}
    </a>
    : {{ child.blurb }}
  </li>
{% endfor %}
</ol>

---

## How to follow the tutorial

After reading each step, try editing the file provided in the code editor and familiarize yourself with the environment. In case you have a trouble, visit the support page on the farm. 

### Prerequisites

PennController does not require any background in JavaScript. However, you should
have some general knowledge of programming and experimental design.


### Instruction blocks

Follow the tutorial by completing the tasks in the <span class="label label-purple">instructions</span>
blocks:

{% capture instructions %}
1. *Step one*
2. *Step two*
3. *Step three*

```javascript
// Lorem ipsum dolor sit amet, consectetur adipiscing elit.
```
{% endcapture %}
{% include instructions.html text=instructions %}
