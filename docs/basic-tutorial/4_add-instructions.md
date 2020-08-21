---
layout: default
title: Add instructions
parent: Basic Tutorial
---

## Add instructions

As the writers of the **BasicTutorial** experiment, we know that the `"first-trial"` **Trial** waits for the participant to press the `F` or `J` key before the experiment continues. However, a naive participant has no way of knowing this. 

There are two ways to add instructions:

+ Option 1: Create a new **Trial** with instructions.
+ Option 2: Add instructions to the `"first-trial"` **Trial**.

For reasons that will become obvious in the **AdvancedTutorial** experiment, we recommend using **Option 1**. However, we provide both options for completeness.

### Option 1: Create a new **Trial** with instructions:

```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null)

// Create a welcome Trial with instructions
newTrial("welcome",
    newText("instructions", "Welcome to the experiment! You will see a sentence and two images. Press the F key if the image on the left matches the sentences. Presss the K key if the image on the right matches the sentence.")
        .print()
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
)
```


As in the `"first-trial"` **Trial**, we need to pause the experiment execution so that participants have time to read the text in the `"welcome"` **Trial**.

Add a **Button** that must be clicked to start the experiment:

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
)
```

### Option 2: Add instructions to the `"first-trial"` **Trial**

Add a **Text** element with instructions and a **Button** that must be clicked to start the experiment:

```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null)

// Create a Trial named "first-trial"
newTrial("first-trial",
    // Add instructions     
    newText("instructions", "Welcome to the experiment! You will see a sentence and two images. Press the F key if the image on the left matches the sentences. Presss the K key if the image on the right matches the sentence.")
        .center()
        .print()
    , 
    newButton("start", "Click to start the experiment")
        .print()
        .wait()
    ,
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
)
```

By default, all printed elements in a **Trial** are printed sequentially on a new line, meaning that all printed elements will be printed onto the same screen. 

If you want to print the `"instructions"` **Text** and `"start"` **Button** on a screen separately from the `"fish-description"` **Text** and `"side-by-side"` **Canvas**, use the special command `clear` to clear the screen:

```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null)

// Create a Trial named "first-trial"
newTrial("first-trial",
    // Add instructions     
    newText("instructions", "Welcome to the experiment! You will see a sentence and two images. Press the F key if the image on the left matches the sentences. Presss the K key if the image on the right matches the sentence.")
        .center()
        .print()
    , 
    newButton("start", "Click to start the experiment")
        .print()
        .wait()
    ,
    // Clear all printed elements from the screen
    clear()
    ,
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
)
```
