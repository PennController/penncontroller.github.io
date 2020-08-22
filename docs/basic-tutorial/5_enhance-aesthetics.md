---
layout: default
title: Enhance aesthetics
parent: Basic Tutorial
---

## {{ page.title }}

PennController has a variety of commands that manipulate aesthetic aspects of element with visual content. 

Add a new **Image** element, then use the `text.center` command to center the `"fish-description"` **Text** element, and the `image.size` command to resize the two **Image** elements:
```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null)

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
         .print()
    ,
   	// Create another Image element, resize it 200x200 px, and print it
    newImage("fish-square", "1fishSquareTank.png")
         .size(200, 200)
         .print()
    ,
    // Create a Key element and wait until the F or J key is pressed
    newKey("keypress", "FJ")
         .wait()
)
```

### Manipulate layout

By default, every printed element is printed on a new line. For any other layout, use a [**Canvas**]({{ site.baseurl }}/docs/elements/canvas), which creates a transparent surface that can be used to place elements at specific coordinates.

Define a 450x200 px **Canvas** and print the `"fish-round"` and `"fish-square"` **Image** elements next to each other with a 50px gap:

```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null)

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

> + `"fish-round"` is added to the (x=0, y=0) coordinate of the `"side-by-side"` **Canvas**.
>
> + `"fish-square"` is added to the (x=250, y=0) coordinate of the `"side-by-side"`  **Canvas**.
>
> + If you call `print` on a **Canvas** element, do not call `print` directly on the elements that have been added to the **Canvas**.

### Add instructions

As the writers of the **BasicTutorial** experiment, we know that the `"first-trial"` **Trial** waits for the participant to press the `F` or `J` key before the experiment continues. However, a naive participant has no way of knowing this. 

Add a **Text** element with instructions:

```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null)

// Create a Trial named "first-trial"
newTrial("first-trial",
    // Add instructions     
    newText("instructions", "Press the F key if the image on the left matches the sentence. Presss the K key if the image on the right matches the sentence.")
        .center()
        .print()
    ,
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
