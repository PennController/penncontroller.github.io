---
layout: default
title: Basic Tutorial
nav_order: 3
---

# Basic tutorial
{: .no_toc}

This section... (*to be filled in*)
{: .fs-5 .fw-300 }

---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Getting started

In this section, you will create the **BasicTutorial** experiment:

1. Welcome screen with instructions
2. *To be filled in*

---
## Create an experiment

1. [Create a PCIbex Farm account](#creating-account).
2. Go to the [PCIbex Farm home page](https://expt.pcibex.net/).
3. Click **Design experiments**.
4. Enter your login information and click **login**.
5. Click **Create a new experiment**.
6. In the "Name" field, enter "BasicTutorial".
7. Click **Create**.

Click on the **BasicTutorial** experiment to begin editing.

---

## Load resource files

Option 1: Upload directly

+ *To be filled in*

Option 2: Upload through GitHub

+ *To be filled in*

---

## Edit an experiment

The **Script** folder contains the file `main.js`, the experiment code. Update your experiment by editing `main.js` in the script editor and saving your changes.

The script editor has the following features:

+ Two links at the top for easy access
  + [PennController docs](https://www.pcibex.net/documentation/): Links to PCIbex documentation.
  + [ibex docs](https://github.com/addrummond/ibex/blob/master/docs/manual.md): Links to the original Ibex documentation.
+ Autocomplete 
  1. Start typing within the script editor. 
  2. A modular window with suggested command names for autocompletion will pop up.
  3. Navigate the autocomplete suggestions with the **Up** and **Down** arrow keys, and press **Enter/Return** to select a suggestion.
+ Four buttons at the bottom
  + **Discard changes**: Close the script editor without saving any changes.
  + **Save changes**: Save changes without closing the script editor.
  + **Save and close**: Save changes and close the script editor.
  + **Save and test**: Save changes and open the updated experiment in a new tab or window.

Click **main.js** to open `main.js` in the script editor. 

By default, new experiments are initialized with a demo experiment.  If you uploaded the resource files directly,  the original `main.js` file  should start with the following lines:
```javascript
// This is a simple demo script, feel free to edit or delete it
// Find a tutorial and the list of availalbe elements at:
// https://www.pcibex.net/documentation/

PennController.ResetPrefix(null) // Shorten command names (keep this line here)
```

If you uploaded the resource files through GitHub,  the newly uploaded `main.js` should contain only the following lines:
```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null) 
```

{% capture description %}
If you uploaded the resource files directly, delete all lines in `main.js` that follow `PennController.ResetPrefix(null) // Shorten command names (keep this line here)` before continuing the tutorial.

If you uploaded the resource files through GitHub, you can continue the tutorial directly.
{% endcapture %}
{% include note-label.html text=description  %}

---

## Create a trial

PennController trials are created with the command `PennController.newTrial`:

```javascript
// Create a Trial named "first-trial"
PennController.newTrial("first-trial")
```

All PennController commands begin with the prefix `PennController.`, in order to avoid naming conflicts with other JavaScript modules. However, adding this prefix for every command quickly becomes tiring.

The tutorial uses the command [`PennController.ResetPrefix`](./commands/global-commands/resetprefix/), which resets the `PennController.` prefix to the string of your choice, to remove the prefix:
```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null) 

// Create a Trial named "first-trial"
newTrial("first-trial")
```

{% capture description %}
It is recommended to start every experiment with `PennController.ResetPrefix(null)`  for general clarity and readability. 
{% endcapture %}
{% include recommended-label.html text=description  %}

---

## Add elements

**Elements** are the basic unit of a PennController experiment. 

Element types can represent visual content, interactive content, or some combination of the two:

+ `Text`: Represents text content (visual).
+ `Image`: Represents image content (visual)
+ `Key`: Represents keyboard keypresses (interactive).
+ `Button`: Represents clickable buttons (visual and interactive).

{% capture description %}
This tutorial uses the term "element" as shorthand for "instance of an element type". For example "an **Image** element"  or "an **Image**" is short for "an instance of the `Image` type". If "element type" is intended, the  term "element type" will be used.
{% endcapture %}
{% include note-label.html text=description  %}

{% capture description %}
For a list of all PennController element types, see the [Reference: Elements](./elements) page.
{% endcapture %}
{% include reference-label.html text=description  %}

Add two **Text** elements and an **Image** element:
```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null)

// Create a Trial named "first-trial"
newTrial("first-trial",
    // Create a Text element 
    newText("fish-description", "The fish swim in a tank which is perfectly round.")
    ,
    // Create an Image element
    newImage("fish-round", "2fishRoundTank.png")    
)
```


> + The **Text** element is named `"fish-description"`, and contains the string `The fish swim in a tank which is perfectly round.`
> + The **Image** element is named `"fish"`, and contains the image `2fishRoundTank.png`, within the **Resources** folder.

{% capture description %}
It is not strictly necessary to name an element. For example, `newImage("fish", "2fishRoundTank.png")` and `newImage("2fishRoundTank.png")` both contain the image `2fishRoundTank.png`.

However, it is recommended to name every element for general clarity and readability. If you want to refer back to an existing element, as in [Manipulate layout](#manipulate-layout), the element must have a name.
{% endcapture %}
{% include recommended-label.html text=description  %}

---

## Add commands

Elements contain content; **commands** do things with that content. For example, once you create an element, you can use a command to print it to the screen.

{% capture description %}
Commands that manipulate elements begin with the prefix `standard.` or `X.`

+ Commands that begin with `standard.` can be used on any element type, like `standard.print`
+ Commands that begin with `X.` can only be used on `X` element types, like `text.unfold`

This guide omits the element command prefixes for simplicity.
{% endcapture %}
{% include note-label.html text=description  %}

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

Use the `wait` command to pause experiment execution:

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

{% capture description %}
Only interactive elements like **Key** or **Button** can have a defined `wait` command. To read more about element-specific commands, see...
{% endcapture %}
{% include reference-label.html text=description  %}

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

The [**Canvas** element](./elements/canvas.html) creates a transparent surface that can be used to place elements at specific coordinates. 

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
   	newCanvas(450,200)
        .add(  0, 0, getImage("fish-round"))
        .add(250, 0, getImage("fish-square"))
        .print()
    ,
    // Create a Key element and wait until the F or J key is pressed
    newKey("keypress", "FJ")
         .wait()
)
```

> + Existing elements must be named in order to use the `getX` function, where `X` is an element type. 
> + If you call `print` on a **Canvas** element, do not call `print` directly on the elements that have been added to the **Canvas**.

## Log data

+ add `log`

## Add trials

### Instruction trial

+ add a new trial with instructions

### Second experiment trial

+ add another experimental trial

### Manipulate trial order

+ use `Sequence` to manipulate trial order

## Examine results

+ look at results


