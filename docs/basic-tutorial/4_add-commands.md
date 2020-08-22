---
layout: default
title: Add commands
parent: Basic Tutorial
---

{% assign element_commands = site.html_pages | where: "title", "Element commands" | first %}
{% assign global_commands = site.html_pages | where: "title", "Global commands" | first %}
{% assign special_commands = site.html_pages | where: "title", "Special commands" | first %}


## {{ page.title }}

Elements contain content; element **commands** do things with that content. For example, once you create an element, you can use an element command to print it to the screen.

There are three types of commands: 

+ [Element commands]({{ element_commands.url | prepend: site.baseurl }}) are {{ element_commands.blurb | downcase }}
+ [Global commands]({{global_commands.url | prepend: site.baseurl }}) are {{ global_commands.blurb | downcase }}
+ [Special commands]({{special_commands.url | prepend: site.baseurl }}) are {{ special_commands.blurb | downcase }}

{% capture label %}
Element commands are the most common type of command. This tutorial uses the term “command” as shorthand for “element command”. If a global or special command is intended, the term “global command” or "special command" will be used.
{% endcapture %}
{% include note-label.html label-body=label  %}

Commands are **standard** (can be called on any element type) or **element-specific** (can only be called on a specific element type):

+ Standard commands begin with the prefix `standard.` , for example `standard.print`
+ Element-specific commands begin with the prefix `X.`, where `X` is an element type, for example `text.unfold`

{% capture label %}
This tutorial omits the prefix `standard.` when referring to standard commands.
{% endcapture %}
{% include note-label.html label-body=label %}

The syntax for calling a command on an element is `newX("ELEMENT_NAME", ...).COMMAND()` or `getX("ELEMENT_NAME").COMMAND()`, where `COMMAND` is the name of a comment **without** its standard or element-specific prefix.

{% capture label %}
Successive commands can be called on the same line, as in `getX("ELEMENT_NAME").COMMAND_1().COMMAND_2().COMMAND_3()`. 

However, it is recommended to call each command on an indented new line for readability.
{% endcapture %}
{% include recommended-label.html label-body=label %}

Use the `print` command to print the `"fish-description"` and `"fish"` elements to the screen:
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

For example, all interactive element types have a `wait` command:

{% assign audio_wait = site.action-commands | where: "title", "audio.wait" | first %}
{% assign button_wait = site.action-commands | where: "title", "button.wait" | first %}
{% assign key_wait = site.action-commands | where: "title", "key.wait" | first %}
+ [`audio.wait`]({{ audio_wait.url | prepend: site.baseurl }}): {{ audio_wait.blurb }}
+ [`button.wait`]({{ button_wait.url | prepend: site.baseurl }}): {{ button_wait.blurb }}
+ [`key.wait`]({{ key_wait.url | prepend: site.baseurl }}): {{ key_wait.blurb }}
+ Also: `controller.wait`, `dropdown.wait`, `scale.wait`, and more.

Although these commands are related in name and function, they are still considered element-specific commands for technical reasons.

Use a **Key** element and the `key.wait` command to pause experiment execution:

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

> + Once the `key.wait` command on the **Key** element is reached, the experiment "waits" until the participant presses the `F` or `J` key.
> + After the `F` or `J` key is pressed, there are no more commands or trials, and the experiment ends.
