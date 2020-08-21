---
layout: default
title: Commands
parent: Core concepts
nav_order: 2
---

<!-- ASSIGN VARIABLES -->
{% assign element_commands = site.html_pages | where: "title", "Element commands" | first %}
{% assign global_commands = site.html_pages | where: "title", "Global commands" | first %}
{% assign special_commands = site.html_pages | where: "title", "Special commands" | first %}

# Commands

**Commands** manipulate [elements]({{ site.baseurl }}/core-concepts/1-elements) or other aspects of an experiment. For example, you can create an element and use a `print` command to print it to the screen, or use the `Sequence` command to order the [trials](#trials) of an experiment.

There are three types of commands:

+ **Element commands**: {{ element_commands.blurb }}
+ **Global commands**: {{ global_commands.blurb }}
+ **Special commands**: {{ special_commands.blurb }}

{% capture label %}
For a list of all PennController commands, see the [Commands]({{ site.baseurl }}/docs/commands) page.
{% endcapture %}
{% include reference-label.html label-body=label %}

## Element commands {#element-commands}

{{ element_commands.blurb }}

There are two types of element commands: 

+ **Action commands** directly manipulate elements.
+ **Test commands** test an element against some conditional statement.

Action and test commands are either **standard** (can be called on any element type), or **element-specific** (can only be called on a certain element type).

![Types of element commands]({{ site.baseurl }}/assets/images/command-types.png)

*Figure 1: Types of element commands*

In addition, action and test commands can be called on a specific instance of an element type, or on the [default object]() of an element type.

> Note: create a section for default objects

### Action commands

**Action commands** directly manipulate elements. 

Standard action commands begin with the prefix `standard.`, although the `standard` part of the prefix is generally omitted for simplicity. Standard commands can be called on any element type, but some standard commands only have an effect on visual element types, and some standard commands only have an effect on interactive element types.

For example, the `standard.print` / `.print` command prints the contents of an element to the screen, but can only print visual element types like `Text` or`Image`. If it is called on an interactive type like `Key`, it has no effect.

Element-specific action commands begin with the prefix `X.`, where `X` is the only element type the command can be called on. For example, the `text.unfold` command creates an unfolding effect as the content of a **Text** element is printed to the screen.

> What happens if .unfold() is called on an **Image** element?

Two (or more) element types may have element-specific commands that seem to be nearly identical in name and functionality. For example, the `button.wait` command waits until the **Button** element it is called on is clicked before evaluating the next commands; the `key.wait` command waits until the **Key** element it is called on is satisfied by a valid keypress before evaluating the next commands. However...

> They are element-specific commands for technical reasons? 

---

**Example 2**

>  The `.print` command prints the contents of an element to the screen.
>
> The `button.wait` command waits until the **Button** element is clicked before evaluating the next commands.

Click **Try it** to see **Example 2** in action.

```javascript
// **Should be an interactive code block**
// Example 2

newText("example-text", "This is an example sentence")
	.print()
,
newButton("example-button", "Click to continue")
	.print()
	.wait()
,
getText("example-text")
	.print()
```

**Example 2** does the following:

1. Creates a **Text** element with the name `example-text` and the content `This is an example sentence`.
2. Prints the content of `example-text` to the screen.
3. Creates a **Button** element with the name `example-button`  and the content `Click to continue`.
4. Prints the content of `example-button` to the screen.
5. Waits until `example-button` is clicked.
6. Refers back to the **Text** element `example-text`.
7. Prints the content of `example-text` to the screen (again).

----

For a list of all standard action commands, see the Standard Commands page.

> Note: create a **Standard Commands** page.
>

### Test commands

**Test commands** test an element against some conditional statement; they are the PCIbex equivalent of an *if-else* statement.

Standard test commands begin with the prefix `standard.test.`, although the `standard` part of the prefix is generally omitted for simplicity. For example, the `standard.test.printed` / `test.printed` command tests whether an element has been printed to the screen at the time of evaluation.

Element-specific test commands begin with the prefix `X.test.`, where `X` is the only element type the command can be called on. For example, the `key.test.pressed` command tests whether a **Key** element has been satisfied by a valid keypress at the time of evaluation.

The consequences of a test command are defined by the `.success` and/or `.failure` helper functions:

+ If the test succeeded, evaluate the commands called within the `.success` function.
+ If the test failed, evaluate the comands called within the `.failure` function.

---

**Example 3** 

> ...

Click **Try it** to see **Example 3** in action.

```javascript
// **Should be an interactive code block**
// Example 3

newText("instructions", "Up to you - press the spacebar before clicking the button, or click the button immediately")
	.print()
,
newKey("example-key", " ")
,
newButton("example-button", "Click to continue")
	.print()
	.wait()
,
getKey("example-key")
	.test.pressed()
	.success(
    	newText("success", "You pressed the spacebar before clicking the button.")
    		.print()
	)
	.failure(
    	newText("failure", "You did not press the spacebar before clicking the button.")
    		.print()
	)
```

**Example 3** evaluation flow (simplified for clarity):

1. Create and print a **Text** element named `instructions`.
2. Create a **Key** element named `example-key` that "listens" for press of the spacebar.
3. Creates a **Button** element with the name `example-button`  and the content `Click to continue`.
4. Prints the content of `example-button` to the screen.
5. Waits until `example-button` is clicked.
6. Refers back to the **Key** element `example-key`.
7. Tests whether the `example-key` was satisfied by a valid keypress, aka whether the spacebar was pressed.
   + If

---



For a list of all test commands, see the Test commands page.

> Note: create a **Test commands** page.

## Global commands {#global-commands}

**Global commands** are...

Important global commands:

+ [`PennController.ResetPrefix(null)`](https://www.pcibex.net/wiki/penncontroller-resetprefix/):
+ [`DebugOff()`](https://www.pcibex.net/wiki/penncontroller-debugoff/):
+ [`AddTable()`](https://www.pcibex.net/wiki/penncontroller-addtable/):
+ [`newTrial()`](https://www.pcibex.net/wiki/penncontroller/):
+ [`Sequence()`](https://www.pcibex.net/wiki/penncontroller-sequence/):

For a list of all global commands, see the Global commands page.

> Note: create a **Global commands** page.

## Special commands

**Special commands** are used within a trial, but do not manipulate elements. 

There are three special commands:

+ [`clear()`](https://www.pcibex.net/wiki/clear-command/): Removes all currently printed elements from the screen.
+ [`end()`](https://www.pcibex.net/wiki/end-command/): Ends a trial immediately.
+ [`fullscreen()`](https://www.pcibex.net/wiki/fullscreen-command/): Sends a fullscreen request to the participant's browser.

[`SendResults()`](https://www.pcibex.net/wiki/global-commands/#menuToc-23) technically qualifies as a special command, since it can be used within a trial, but is generally classifed as a [global command](#global-commands).

