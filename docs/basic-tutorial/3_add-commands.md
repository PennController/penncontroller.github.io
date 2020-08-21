---
layout: default
title: Add commands
parent: Basic Tutorial
---

## Add commands

Elements contain content; **commands** do things with that content. For example, once you create an element, you can use a command to print it to the screen.

{% capture label %}
Commands that manipulate elements begin with the prefix `standard.` or `X.`

+ Commands that begin with `standard.` can be used on any element type, like `standard.print`
+ Commands that begin with `X.` can only be used on `X` element types, like `text.unfold`

This guide omits the element command prefixes for simplicity.
{% endcapture %}
{% include note-label.html label-body=label  %}

Print the `"fish-description"` and `"fish"` elements to the screen:

```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null)

// Create a Trial named "first-trial"
newTrial("first-trial",
    // Create a Text element and print it
    newText("fish-description", "The fish swim in a tank which is perfectly round.")
         .print()
    ,
    // Create an Image element and print it
    newImage("fish-round", "2fishRoundTank.png")    
         .print()
)
```

Click **Save and test** in the script editor to test your changes. 

You may be surprised by the results! As soon as you start the experiment, you see the message "The results were successfully sent to the server. Thanks!". 

While it may seem like nothing happened, all of the commands were executed within a few milliseconds, and the experiment ended almost immediately.

PennController executes experiment scripts sequentially:

 1. Shorten command names.

  2. Create a **Trial**.

  3. Create a **Text** element and print it.

  4. Create an **Image** element and print it.

If there are no more commands, the trial ends. If there are no more trials, the experiment ends. 

### Pause experiment execution

Interactive elements and commands can pause experiment script execution, in order to give participants time to interact with the screen.

Use a **Key** element and the `wait` command to pause experiment execution:

```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null)

// Create a Trial named "first-trial"
newTrial("first-trial",
    // Create a Text element and print it
    newText("fish-description", "The fish swim in a tank which is perfectly round.")
         .print()
    ,
    // Create an Image element and print it
    newImage("fish-round", "2fishRoundTank.png")    
         .print()
    ,
    // Create a Key element and wait until the F or J key is pressed
    newKey("keypress", "FJ")
         .wait()
)
```

> + Once the `wait` command on the **Key** element is reached, the experiment "waits" until the participant presses the `F` or `J` key.
> + After the `F` or `J` key is pressed, there are no more commands or trials, and the experiment ends.

{% capture label %}
Only interactive elements like **Key** or **Button** can have a defined `wait` command. To read more about element-specific commands, see...
{% endcapture %}
{% include reference-label.html label-body=label  %}

### Manipulate element aesthetics

PennController has a variety of commands that manipulate aesthetic aspects of an element, for example:

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

By default, every printed element is printed on a new line. The [**Canvas** element](./elements/canvas.html) creates a transparent surface that can be used to place elements at specific coordinates, for example next to each other.

You can add an existing element to a **Canvas** by referring back to it with the `getX("ELEMENT_NAME")` function, where `X` is any element type and `"ELEMENT_NAME"` is the name of the element. The `getX` function can only be used with named elements.

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

> + The `"fish-round"` **Image** is added to the (x=0, y=0) coordinate of the `"side-by-side"` **Canvas**.
> + The `"fish-square"` **Image** is added to the (x=250, y=0) coordinate of the `"side-by-side"`  **Canvas**.
> + If you call `print` on a **Canvas** element, do not call `print` directly on the elements that have been added to the **Canvas**.
