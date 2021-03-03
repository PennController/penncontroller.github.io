---
layout: bottom-navbar-parent
title: Advanced Tutorial
permalink: /advanced-tutorial/
nav_order: 5
---

# {{ page.title }}

This tutorial assumes familiarity with the knowledge introduced in the
[**Basic Tutorial**]({{site.baseurl}}/basic-tutorial).
If you prefer to learn concept-by-concept, check out the
[**Core Concepts**]({{site.baseurl}}/core-concepts)
section. You may find it useful to read both the tutorials and the
**Core Concepts** section.
{: .fs-5 .fw-300 }

---

## Goal

In the **Advanced Tutorial**, you'll learn how to make a picture matching experiment with the following structure:

1. Consent form with:
    + Checkbox to indicate consent
    + Button to continue
2. Instructions screen with:
    + Text input box for participants to enter their ID
    + Button to start the experiment
2. Four experimental trials:
    1. One-second delay
    2. A sentence plays as audio and unfolds as text on the screen.
    3. Two images are printed to the screen next to each other.
    4. Participant clicks on an image or presses a key to select an image.
    5. Trial timeout (trial ends if the participant does not select an image before audio playback finishes).
3. Exit screen

<div class="dotted-grey-dk-000 px-4" markdown="1">
Preview the **AdvancedTutorial** experiment:

<p class="text-delta collapsible-block-title">
  <a href="https://farm.pcibex.net/r/AeTXMk/experiment.html" target="_blank">Click to take the experiment</a>
</p> 

{% capture content %}
```js
// Type code below this line.

// Remove command prefix
PennController.ResetPrefix(null)

// Turn off debugger
DebugOff()

// Control trial sequence
Sequence("consent", "instructions", randomize("experimental-trial"), "send", "completion_screen")

// Consent form
newTrial("consent",
    newHtml("consent_form", "consent.html")
        .cssContainer({"width":"720px"})
        .checkboxWarning("You must consent before continuing.")
        .print()
    ,
    newButton("continue", "Click here to continue")
        .center()
        .print()
        .wait(getHtml("consent_form").test.complete()
                  .failure(getHtml("consent_form").warn())
        )
)

// Instructions
newTrial("instructions",
    defaultText
        .cssContainer({"margin-bottom":"1em"})
        .center()
        .print()
    ,
    newText("instructions-1", "Welcome!")
    ,
    newText("instructions-2", "In this experiment, you will hear and read a sentence, and see two images.")
    ,
    newText("instructions-3", "<b>Select the image that better matches the sentence:</b>")
    ,
    newText("instructions-4", "Press the <b>F</b> key to select the image on the left.<br>Press the <b>J</b> key to select the image on the right.<br>You can also click on an image to select it.")
    ,
    newText("instructions-5", "If you do not select an image by the time the audio finishes playing,<br>the experiment will skip to the next sentence.")
    ,
    newText("instructions-6", "Please enter your ID and then click the button below to start the experiment.")
    ,
    newTextInput("input_ID")
        .cssContainer({"margin-bottom":"1em"})
        .center()
        .print()
    ,
    newButton("wait", "Click to start the experiment")
        .center()
        .print()
        .wait()
    ,
    newVar("ID")
        .global()
        .set(getTextInput("input_ID"))
)

// Experimental trial
Template("items.csv", row =>
    newTrial("experimental-trial",
        newTimer("break", 1000)
            .start()
            .wait()
        ,
        newAudio("audio", row.audio)
            .play()
        ,
        newTimer("timeout", row.duration)
            .start()
        ,
        newText("sentence", row.sentence)
            .center()
            .unfold(row.duration)
        ,
        newImage("plural", row.plural_image)
            .size(200, 200)
        ,
        newImage("singular", row.singular_image)
            .size(200, 200)
        ,
        newCanvas("side-by-side", 450,200)
            .add(  0, 0, getImage("plural"))
            .add(250, 0, getImage("singular"))
            .center()
            .print()
            .log()
        ,
        newSelector("selection")
            .add(getImage("plural"), getImage("singular"))
            .shuffle()
            .keys("F", "J")
            .log()
            .callback(getTimer("timeout").stop())
        ,
        getTimer("timeout")
            .wait()
        ,
        getAudio("audio")
            .stop()
    )
    .log("group", row.group)
    .log("item", row.item)
    .log("condition", row.inflection)
    .log("ID", getVar("ID"))
)

// Send results manually
SendResults("send")

// Completion screen
newTrial("completion_screen",
    newText("thanks", "Thank you for participating! You may now exit the window.")
        .center()
        .print()
    ,
    newButton("wait", "")
        .wait()
)
```
{% endcapture %}
{% include collapsible-block.html content=content summary="Click to see the final experiment script" inner-border=true %}
</div>

---

## Table of contents

{% assign children_list = site.html_pages | where: "parent", page.title %}
<ol start="8">
{% for child in children_list %}
  <li>
  {% assign modified_title = child.title | split: ". " | last %}
    <a href="{{ child.url | prepend: site.baseurl }}">{{ modified_title }}</a>: {{ child.blurb }}
  </li>
{% endfor %}
</ol>

---

## How to follow the tutorial

After following each step, try out editing provided code in the farm code editor. In case you have any trouble, visit Support page.

### Prerequisites

PennController does not require any background in JavaScript. 
However, you should have some general knowledge of experimental design.

In particular, you should be familiar with the following terms and concepts:
+ Calling a command, command parameters
+ Strings, integers, truth values, code comments
+ Experimental items, trials

### Technical notes

Blocks that are labeled with <span class="label">technical notes</span> contain extra information about PennController. 

{% capture label %}
This is an example of a technical note.
{% endcapture %}
{% include label-technical.html label-body=label %}

**Reading technical notes is optional**

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

