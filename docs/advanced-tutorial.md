---
layout: bottom-navbar-parent
title: Advanced Tutorial
permalink: /advanced-tutorial/
nav_order: 5
---

# {{ page.title }}

The **Advanced Tutorial** is a continuation of the **Basic Tutorial**. You'll
learn how to use a table to create trial items, counterbalance, add an informed
consent section, and more.
{: .h1-blurb }

{% capture label %}
The Basic and Advanced Tutorials are a learning-by-doing introduction to
PCIbex: you'll learn how to use PCIbex by creating an actual experiment.

If you prefer learning things concept-by-concept, check out the
understanding-oriented [**Core Concepts**]({{site.baseurl}}/core-concepts)
section!
{% endcapture %}
{% include label-note.html label-body=label %}

---

## Table of contents

{% assign children_list = site.html_pages | where: "parent", page.title | sort: "start_heading" %}
<ul>
{% for child in children_list %}
  <li>
    <a href="{{ child.url | prepend: site.baseurl }}">
      {{ child.title -}}
    </a>
  </li>
{% endfor %}
</ul>

---

## Objective

In the **Advanced Tutorial**, we'll create a picture matching experiment with the
following structure:

1. Consent form trial:
    + Checkbox to indicate consent
    + Button to continue
2. Instructions trial:
    + Text input box for participants to enter their ID
    + Button to start the experiment
3. Four experimental trials:
    1. One-second delay.
    2. A sentence plays as audio and unfolds as text on the screen.
    3. Two images are printed to the screen next to each other.
    4. Participant clicks on an image or presses a key to select an image.
    5. Trial timeout (trial ends if the participant does not select an image
    before audio playback finishes).
4. Exit screen

<div class="dotted-grey-dk-000 px-4" markdown="1">
Preview the **AdvancedTutorial** experiment:

<p class="text-delta collapsible-block-title">
  <a href="https://farm.pcibex.net/r/AeTXMk/experiment.html" target="_blank">
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
