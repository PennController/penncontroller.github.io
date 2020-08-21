---
layout: default
title: Log data
parent: Basic Tutorial
---

## Log data

PennController automatically logs when a trial starts and when it ends. Any other information that you want to collect must be **explictly** marked using the `.log` command. 

*To be filled in with more information about `.log`*

Use the `.log` command to record which key is pressed (`F` or `J`), and when:

```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null)

// Create a Trial with instructions
newTrial("welcome",
    newText("instructions", "Welcome to the experiment! You will see a sentence and two images. Press the F key if the image on the left matches the sentences. Presss the K key if the image on the right matches the sentence.")
        .center()
        .print()
    ,
    newButton("start", "Click to start the experiment")
        .print()
        .wait()
)

// Create a Trial named "first-trial"
newTrial("first-trial",
    // Create a Text element, center it, and print it
    newText("fish-description", "The fish swim in a tank which is perfectly round.")
        .center()
        .print()
    ,
    // Create an Image element, resize it to 200x200 px, and print it
    newImage("fish-round", "2fishRoundTank.png")    
        .size(200, 200)
        // .print()
    ,
   	// Create another Image element, resize it 200x200 px, and print it
    newImage("fish-square", "1fishSquareTank.png")
        .size(200, 200)
        // .print()
    ,
   	newCanvas("side-by-side", 450,200)
        .add(  0, 0, getImage("fish-round"))
        .add(250, 0, getImage("fish-square"))
        .print()
    ,
    // Create a Key element and wait until the F or J key is pressed
    newKey("keypress", "FJ")
        .wait()
        .log()
)
```

### Look at logged data

*To be filled in*

