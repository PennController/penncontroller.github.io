---
layout: bottom-navbar-child
title: 1. Experiment structure
parent: Core Concepts
nav_order: 1
numbered_headings: true
previous_page: Core Concepts
---

---

## Basic experiment script

The most basic PennController experiment script contains a single line:

```js
PennController.newTrial()
```

When you run a PennController script, its commands are evaluated and executed in
sequential order, from top to bottom. In this basic script, the only command is the
[`PennController.newTrial`]({{site.baseurl}}/commands/global-commands/newtrial){:target="_blank"}
command, which creates and starts a trial.

Once a trial starts, it ends when all of the commands within the trial finish
being executed. In this example, the trial does not have commands, meaning that
the trial starts and then ends almost immediately.

Similarly, a PennController experiment ends when all of its commands finish
being executed. In this example, the experiment ends after its only command,
the `PennController.newTrial` command, ends.

---

## Trial structure

Trials have the following (simplified) structure, where:

+ The first parameter is a string and the trial's label, or the trial has no label.

    <pre><code class="language-diff-javascript diff-highlight">
    *// Trial has the label "TRIAL_LABEL"
    $PennController.newTrial("<var>TRIAL_LABEL</var>",
    *    newX()
    *        .ELEMENT_COMMAND()
    *    ,
    *    getX()
    *        <var>.ELEMENT_COMMAND</var>()
    *)
    *
    *// Trial does not have a label
    $PennController.newTrial(
    *    newX()
    *        <var>.ELEMENT_COMMAND</var>()
    *    ,
    *    getX()
    *        <var>.ELEMENT_COMMAND</var>()
    *)
    </code></pre>
+ All other parameters are blocks of elements and commands.

    <pre><code class="language-diff-javascript diff-highlight">
    *PennController.newTrial("<var>TRIAL_LABEL</var>",
    $    newX()
    $        <var>.ELEMENT_COMMAND</var>()
    *    ,
    $    getX()
    $        <var>.ELEMENT_COMMAND</var>()
    *)
    </code></pre>
+ Trial parameters are separated by a comma.

We'll talk about elements and commands more in upcoming sections,
but for now the important parts to know are that:

+ Elements contain content, and element commands manipulate that content.
+ `newX()` is a function that creates an element.
+ `getX()` is a function that refers back to an element that has been created.
+ <code><var>.ELEMENT_COMMAND()</var></code> is a placeholder for an element command.

**We recommend giving every trial a label**.

Although trial labels are technically
optional in most cases, they are obligatory when calling a command like
[`Sequence`]({{site.baseurl}}/commands/global-commands/sequence){:target="_blank"},
which manually defines an experiment's trial order. Trial labels are also useful
for distinguishing different trials from each other, which is helpful for debugging.

### The `PennController.` prefix

PennController has three types of
[commands]({{site.baseurl}}/core-concepts/3_commands){:target="_blank"}:

+ Element commands: Used within a trial and called on an element.
+ Global commands: Used outside of a trial.
+ Special commands: Used within a trial, but not called on an element.

By default, all global commands begin with the prefix `PennController.` in order
to avoid naming conflicts with other JavaScript modules. In addition, the `newX()`
and `getX()` functions have the prefix `PennController.Elements.` For example,
[`PennController.newTrial`]({{site.baseurl}}/commands/global-commands/newtrial){:target="_blank"}
is a global command that creates a trial.

The global command
[`PennController.ResetPrefix(null)`]({{site.baseurl}}/commands/global-commands/resetprefix){:target="_blank"}
removes the `PennController.(Elements.)` prefix for all subsequent calls
of a global command and instances of the `newX` or `getX()` functions.
You can also pass a string instead of `null`, which resets the prefix to
the given string.

**We recommend calling**
[`PennController.ResetPrefix(null)`]({{site.baseurl}}/commands/global-commands/resetprefix){:target="_blank"}
**at the start of every experiment script for readability and convenience**.

+ Without removing the prefix
    <pre><code class="language-javascript">
    PennController.newTrial("<var>TRIAL_LABEL</var>",
        PennController.Elements.newX()
            <var>.ELEMENT_COMMAND</var>()
        ,
        PennController.Elements.getX()
            <var>.ELEMENT_COMMAND</var>()
    )
    </code></pre>
+ Removing the prefix
    <pre><code class="language-javascript">
    PennController.ResetPrefix(null)

    newTrial("<var>TRIAL_LABEL</var>",
        newX()
            <var>.ELEMENT_COMMAND</var>()
        ,
        getX()
            <var>.ELEMENT_COMMAND</var>()
    )
    </code></pre>
+ Resetting the prefix to a string
    <pre><code class="language-javascript">
    PennController.ResetPrefix("kiwi")

    kiwi.newTrial("<var>TRIAL_LABEL</var>",
        kiwi.newX()
            <var>.ELEMENT_COMMAND</var>()
        ,
        kiwi.getX()
            <var>.ELEMENT_COMMAND</var>()
    )
    </code></pre> 

The difference may not seem that large in these toy examples,
but not having to type the `PennController.(Elements.)` prefix quickly adds up
once you start writing a script with multiple trials and elements!

From this point on, this guide assumes that
[`PennController.ResetPrefix(null)`]({{site.baseurl}}/commands/global-commands/resetprefix){:target="_blank"}
has been called, and the `PennController.(Elements.)` prefix removed.

For example, in prose we'll say "the `newTrial` command" instead of
"the `PennController.newTrial` command". Code examples will generally omit
an explicit call to `PennController.ResetPrefix`, but may include such a call
for additional clarity.

However, the `PennController.` prefix will always be included when referring to the
[`PennController.ResetPrefix`]({{site.baseurl}}/commands/global-commands/resetprefix){:target="_blank"}
command itself.

---

## Syntax

PennController does not care about whitespace: all line breaks, tabs, and spaces
are optional and purely for human readability.

The two scripts below are functionally equivalent:

+ <pre><code class="language-javascript">
  newTrial("<var>TRIAL_LABEL</var>",
      newX()
          <var>.ELEMENT_COMMAND</var>()
      ,
      getX()
          <var>.ELEMENT_COMMAND</var>()
  )
  </code></pre>
+ <pre><code class="language-javascript">
  newTrial("<var>TRIAL_LABEL</var>",newX()<var>.ELEMENT_COMMAND</var>(),getX()<var>.ELEMENT_COMMAND</var>())
  </code></pre>

However, omitting one of the following special symbols will cause an error:

+ Parentheses `(` and `)` : Indicates a call to a function/command,
for example, `newTrial()`. If there is an opening right parenthesis,
there must be a corresponding closing left parenthesis.
+ Period `.` : Indicates a call to an element command,
for example <code><var>.ELEMENT_COMMAND</var>()</code>
+ Comma `,` : Separates the parameters of a trial or command.

### Comment syntax
PennController is a JavaScript module and follows the
[JavaScript comment style](https://www.w3schools.com/js/js_comments.asp){:target="_blank"}:

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

Code examples in this documentation generally use the following "rules":

+ Call every command or function on a new line.
+ Separate every global command with an empty line.
+ Within a trial:
  + Place the opening and closing parentheses of the `newTrial` command
  on separate lines.
  + Place the trial label and following comma on the same line
  as the opening parenthesis of the `newTrial` command.
  + Place all other commas on an indented (4 spaces or 1 tab) new line.
  + Indent an instance of the `newX()` or `getX()` functions by 4 spaces or 1 tab.
  + Indent an element command by 4 spaces or 1 tab from the element it's called on.

Example: 
<pre><code class="language-javascript">
PennController.ResetPrefix(null)

newTrial("TRIAL_ONE",
    newX()
        <var>.ELEMENT_COMMAND</var>()
        <var>.ELEMENT_COMMAND</var>()
    ,
    getX()
        <var>.ELEMENT_COMMAND</var>()
)

newTrial("TRIAL_TWO",
    newX()
        <var>.ELEMENT_COMMAND</var>()
)
</code></pre>

However, these style "rules" are only suggestions; PennController doesn't
actually care about whitespace. Feel free to adapt your scripts to your own style,
and keep in mind that you may see scripts written in a variety of styles.

---

## Flow of evaluation

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
