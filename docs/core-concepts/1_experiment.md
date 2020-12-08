---
layout: default
title: Experiment structure
parent: Core Concepts
nav_order: 1
numbered_headings: true
numbered_examples: true
---

# {{ page.title }}

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
{: .fs-5 .fw-300 }

---

## Basic experiment script

The most basic PennController experiment script contains a single line:

```js
PennController.newTrial()
```

When you run a PennController script, its commands are evaluated and executed in sequential order, from top to bottom. In this basic script, the only command is the [`PennController.newTrial`]({{site.baseurl}}/docs/global-commands/newtrial){:target="_blank"} command, which creates and starts a trial. 

Once a trial starts, it ends when all of the commands within the trial finish being executed. In this basic script, the trial does not have commands, meaning that it starts and then ends almost immediately.

A PennController script ends when it finishes executing all of its commands. In this

A PennController experiment ends when it finishes executing all of its commands. In this example, the only command created a trial that 

The experiment itself also ends almost immediately; 

### Trial structure
Trials have the following (simplified) structure:

+ The first parameter is a string and the trial's label; or
    ```js
    PennController.newTrial("TRIAL_LABEL", 
        newX()
            .ELEMENT_COMMAND()
            .ELEMENT_COMMAND()
        ,
        getX()
            .ELEMENT_COMMAND()
    )
    ```
+ The trial has no label
    ```js
    PennController.newTrial(
        newX()
            .ELEMENT_COMMAND()
            .ELEMENT_COMMAND()
        ,
        getX()
            .ELEMENT_COMMAND()
    )
    ```

Although trial labels are optional, **we recommend giving every trial a label**. Trial labels are useful in distinguishing different trials from each other, and are actually *required* to use a command like `Sequence`, which manually defines a trial order. 

The other trial parameters are blocks of elements and the commands that are called on them. We'll talk about elements and commands more in upcoming sections, but for now the important parts to know are that:

+ `newX()` creates an element.
+ `getX()` refers back to an element that has already been created.
+ Elements contain content, and element commands manipulate that content.

### The `PennController.` prefix
Element commands are called inside a trial. In comparison, global commands are called outside of a trial. For example, [`PennController.newTrial`]({{site.baseurl}}/docs/global-commands/newtrial){:target="_blank"} is a global command that creates a trial.

All PennController global commands begin with the prefix `PennController.`, in order to avoid naming conflicts with other JavaScript modules. In addition, the `newX()` and `getX()` functions have the prefix `PennController.Elements.`

The original form of the trial struture example above:
```js
PennController.newTrial("TRIAL_LABEL", 
    PennController.Elements.newX()
        .ELEMENT_COMMAND()
        .ELEMENT_COMMAND()
    ,
    PennController.Elements.getX()
        .ELEMENT_COMMAND()
)
```

This can make an experiment script hard to read!

The global command [`PennController.ResetPrefix(null)`]({{site.baseurl}}/docs/global-commands/resetprefix){:target="_blank"}removes the prefix for all subsequent global commands and instances of the `newX` or `getX` functions. You can also pass a string as an argument instead of `null`, which will reset the `PennController.(Elements).` prefix to the given string. 

**We recommend calling** [`PennController.ResetPrefix(null)`]({{site.baseurl}}/docs/global-commands/resetprefix){:target="_blank"} **at the start of every experiment script** for readability and convenience. 

+ Removing the prefix
    ```js
    PennController.ResetPrefix(null)

    newTrial("TRIAL_LABEL", 
        newX()
            .ELEMENT_COMMAND()
            .ELEMENT_COMMAND()
        ,
        getX()
            .ELEMENT_COMMAND()
    )
    ```
+ Resetting the prefix to a string
    ```js
    PennController.ResetPrefix("kiwi")

    kiwi.newTrial("TRIAL_LABEL", 
        kiwi.newX()
            .ELEMENT_COMMAND()
            .ELEMENT_COMMAND()
        ,
        kiwi.getX()
            .ELEMENT_COMMAND()
    )
    ```

From this point forward, this documentation assumes that the `PennController.(Elements).` prefix has been removed. For example, in prose we'll say "the `newTrial` command" instead of "the `PennController.newTrial` command". The exception is the `PennController.ResetPrefix` command, which must have the `PennController.` prefix when it's first called.

However, some code examples may still explicitly have the command `PennController.ResetPrefix(null)` at the top.

---

## Syntax
PennController does not care about whitespace: all line breaks, tabs, and spaces are optional and purely for human readability. 

The two scripts below are functionally equivalent:
+ ```js
  newTrial("TRIAL_LABEL", 
      newX()
          .ELEMENT_COMMAND()
      ,
      getX()
          .ELEMENT_COMMAND()
  )
  ```
+ ```js
  newTrial("TRIAL_LABEL",newX().ELEMENT_COMMAND(),getX().ELEMENT_COMMAND())
  ```

The critical tokens are as following:
+ `(` and `)` : The opening and closing parentheses of any command/function, for example `newTrial()`
+ `.` : The period that goes in front of an element command, for example `.ELEMENT_COMMAND()`
+ `,` : The comma that separates the parameters of a trial or command.

Omitting one or more of these tokens will cause an error when the experiment script is executed. 

### Comment syntax
PennController is a JavaScript module and follows the [JavaScript comment style](https://www.w3schools.com/js/js_comments.asp){:target="_blank"}:

```js
// This is a single-line comment

PennController.newTrial()   // This is also a single-line comment

/*
This 
is
a
multi-line
comment
*/
```

### Style guidelines (optional)

Code block examples in this documentation generally use the following format:

```js
PennController.ResetPrefix(null)

newTrial("TRIAL_ONE", 
    newX()
        .ELEMENT_COMMAND()
        .ELEMENT_COMMAND()
    ,
    getX()
        .ELEMENT_COMMAND()
)

newTrial("TRIAL_TWO", 
    newX()
        .ELEMENT_COMMAND()
)
```

+ Call every command or function on a new line.
+ Separate every global command with an empty line.
+ Within a trial:
  + Place the opening and closing parentheses of the `newTrial` command on separate lines.
  + Place the trial label and following comma on the same line as the opening parenthesis of the `newTrial` command.
  + Place all other commas on an indented (4 spaces or 1 tab) new line.
  + Indent an instance of the `newX()` or `getX()` functions by 4 spaces or 1 tab.
  + Indent an element command by 4 spaces or 1 tab from the element it's called on.
 
However, these style "rules" are only suggestions; PennController doesn't actually care about whitespace. Don't be surprised to find experiment scripts in a different format, and feel free to adapt your scripts to your own style.
