---
layout: default
title: Wrapping up
parent: Advanced Tutorial
---

## {{ page.title }}

Congratulations! You’ve learned how to:

+ Create a trial template and use tables.
+ Implement a trial timeout and trial delay.
+ Manipulate content with CSS styles.
+ Randomize experimental item order.
+ Control group assignment.
+ Create obligatory checkboxes and global variables.
+ Examine PennController results files.

{% capture content %}
```js
// This is the AdvancedTutorial experiment.
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
{% include collapsible-block.html content=content summary="Click to see the final experiment script" outer-border=true %}