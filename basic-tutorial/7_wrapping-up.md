---
title: 7. Wrapping up
nav_order: 7
blurb: Summary of tutorial, and next steps.
next_page: Advanced Tutorial
---

Congratulations, you're done!
{: .h1-blurb }

---

## Summary

In the **Basic Tutorial**, you learned how to:

+ Create experiments and trials on the PCIbex Farm.
+ Use multimedia and interactive elements.
+ Manipulate elements with commands.
+ Combine interactive elements.
+ Change elements visually.
+ Set trial-wide commands with default objects.
+ Log experimental data.

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
{% include collapsible-block.html content=content summary="Click to see the final experiment script" outer-border=true %}

---

## Next steps

Now that you've learned the basics of PennController, we recommend reading the [**Advanced Tutorial**]({{site.baseurl}}/advanced-tutorial), where you'll learn how to do things like:

+ Create a trial template and use tables.
+ Implement a trial timeout and trial delay.
+ Manipulate content with CSS styles.
+ Randomize experimental item order.
+ Control group assignment.
+ Create obligatory checkboxes and global variables.
+ Examine PennController results files.

You can also jump right in and [start creating your own experiments](https://farm.pcibex.net/){:target="_blank"}. If you have questions, visit the [**Troubleshooting**]({{site.baseurl}}/docs/troubleshooting) page, check out our [**How-to guides**]({{site.baseurl}}/docs/how-to-guides), or post a question on our [support forum](https://farm.pcibex.net/experiments/new){:target="_blank"}.
