---
title: 1. Experiment structure
nav_order: 1
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
[`PennController.newTrial`]({{site.baseurl}}/global-commands/newtrial)
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

+ The optional first argument is a string and the trial's label,
or the trial has no label.
    <pre><code class="language-diff-javascript diff-highlight">
    @// Option 1: Trial has the label "example-label"
    $PennController.newTrial("example-label",
    @    newX()
    @        .<var>ELEMENT_COMMAND()</var>
    @    ,
    @    getX()
    @        <var>.ELEMENT_COMMAND</var>()
    @)
    @
    @// Option 2: Trial does not have a label
    $PennController.newTrial(
    @    newX()
    @        <var>.ELEMENT_COMMAND</var>()
    @    ,
    @    getX()
    @        <var>.ELEMENT_COMMAND</var>()
    @)
    </code></pre>
    **Trial labels are case-sensitive**: `"helloWorld"` and `"HelloWorld"` are two
    different labels.

{% capture label %}
Although trial labels are not strictly obligatory,
**we recommend giving every trial a label**. Labeled trials make it easier to
debug an experiment script, and some commands actually require that a trial
have a label.
{% endcapture %}
{% include label-note.html label-body=label indent=true %}

+ Any other argument is an element-command block.
    <pre><code class="language-diff-javascript diff-highlight">
    @PennController.newTrial("<var>TRIAL_LABEL</var>",
    $    newX()
    $        <var>.ELEMENT_COMMAND</var>()
    @    ,
    $    getX()
    $        <var>.ELEMENT_COMMAND</var>()
    @)
    </code></pre>
+ All arguments are separated by a comma (note the comma after the first argument,
the trial label *`"TRIAL_LABEL"`*).
    <pre><code class="language-diff-javascript diff-highlight">
    $PennController.newTrial("<var>TRIAL_LABEL</var>",
    @    newX()
    @        <var>.ELEMENT_COMMAND</var>()
    $    ,
    @    getX()
    @        <var>.ELEMENT_COMMAND</var>()
    @)
    </code></pre>

We'll talk about elements and commands more in upcoming sections,
but for now the important parts to know are that:

+ `newX()` is a function that creates an element.
+ `getX()` is a function that refers back to an element that has been created.
+ <code><var>.ELEMENT_COMMAND()</var></code> is a placeholder for an element command.
+ Elements contain content, and element commands manipulate that content.

---

## The `PennController.` prefix

PennController global commands are commands that used outside of a trial.
By default, all global commands begin with the prefix `PennController.` in order
to avoid naming conflicts with other JavaScript modules. For example,
[`PennController.newTrial`]({{site.baseurl}}/global-commands/newtrial)
is a global command that creates a trial. In addition, the `newX()`
and `getX()` functions have the prefix `PennController.Elements.`

The global command
[`PennController.ResetPrefix(null)`]({{site.baseurl}}/global-commands/resetprefix)
removes the `PennController.(Elements.)` prefix for all subsequent calls
of a global command and instances of a `newX` or `getX()` function.
You can also pass a string instead of `null`, which resets the prefix to
the given string.

+ Before removing the prefix
    <pre><code class="language-javascript">
    PennController.newTrial("<var>TRIAL_LABEL</var>",
        PennController.Elements.newX()
            <var>.ELEMENT_COMMAND</var>()
        ,
        PennController.Elements.getX()
            <var>.ELEMENT_COMMAND</var>()
    )
    </code></pre>
+ After removing the prefix
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
+ After resetting the prefix to a string
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

From this point forward, this guide assumes that
[`PennController.ResetPrefix(null)`]({{site.baseurl}}/global-commands/resetprefix)
has been called, and the `PennController.(Elements.)` prefix removed.

For example, in prose we'll say "the `newTrial` command" instead of
"the `PennController.newTrial` command". Code examples will generally omit
an explicit call to `PennController.ResetPrefix`, but may include such a call
for additional clarity.

However, the `PennController.` prefix is always included when referring to the
[`PennController.ResetPrefix`]({{site.baseurl}}/global-commands/resetprefix)
command itself, because the command must include the prefix when it is first
called.

{% capture label %}
**We recommend calling**
[`PennController.ResetPrefix(null)`]({{site.baseurl}}/global-commands/resetprefix)
**at the start of every experiment script for readability and convenience**.
Not having to type the `PennController.(Elements.)` prefix quickly adds up
once you start writing a script with multiple trials and elements!
{% endcapture %}
{% include label-note.html label-body=label %}

---

## Syntax

The following special symbols are obligatory, and omitting one or more will
cause an error.

### `(` and `)` (parentheses)

When calling a function or command, the function or command name must be followed
by a pair of matching parentheses. For example, to call the `newTrial` command,
type `newTrial()`.

<pre><code class="language-diff-javascript diff-highlight">
@// Incorrect: The newTrial command does not have a closing parenthesis
parenthesis
%newTrial("example-trial-one",
%    newX)
%    ,
%    newX()
%    ,
%    getX()
@
@// Incorrect: The second call of the newX() function does not have parentheses
%newTrial("example-trial-two",
%    newX()
%    ,
%    newX
%    ,
%    getX()
%)
@
@// Correct: All functions and commands have matching parentheses
~newTrial("example-trial-three",
~    newX()
~    ,
~    newX()
~    ,
~    getX()
~)
</code></pre>

### `.` (period)

When calling an element command, the command name must be preceded by a period.
For example, to call the `print` command, type `.print()`.

<pre><code class="language-diff-javascript diff-highlight">
@// Incorrect: the 'print' element command does not have a preceding period
%newTrial("example-trial-one",
%    newX()
%        print()
%)
@
@// Correct: The 'print' element command has a preceding period
~newTrial("example-trial-two",
~    newX()
~        .print()
~)
@
@// Incorrect: The 'newTrial' command is a global command, not an element command.
@// It should not be preceded by a period.
%.newTrial("example-trial-three",
%    newX()
%        .print()
%)
</code></pre>

### `,` (comma)

Trial arguments must be separated by a comma.

<pre><code class="language-diff-javascript diff-highlight">
@// Incorrect: There is no comma after the trial label argument "example-trial"
%newTrial("example-trial"
%    newX()
%   ,
%    newX()
%)
@
@// Correct: All three trial arguments are separated by a comma.
~newTrial("example-trial",
~    newX()
~   ,
~    newX()
~)
</code></pre>

### `"` or `'` (quote mark)

If there is a trial label argument, it is a string and must be surrounded by
matching quote marks. You can use single quotes or double quotes, as long as they match.

<pre><code class="language-diff-javascript diff-highlight">
@// Incorrect: The trial label "example-trial-one" does not have a closing
quote mark
%newTrial("example-trial-one,
%    newX()
%)
@
@// Incorrect: The trial label "example-trial-two" does not have matching
quote marks
%newTrial('example-label",
%    newX()
%)
@
@// Correct: The trial label "example-trial-three" has matching double quotes
~newTrial("example-trial-three",
~    newX()
~)
@
@// Correct: The trial label 'example-trial-four' has matching single quotes
~newTrial('example-trial-four',
~    newX()
~)
</code></pre>

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

---

## Style guidelines (optional)

PennController does not care about whitespace: all line breaks, tabs, and spaces
are optional and purely for human readability.

The two scripts below are equivalent:

<pre><code class="language-javascript">
newTrial("example-trial",
    newX()
        <var>.ELEMENT_COMMAND</var>()
    ,
    getX()
        <var>.ELEMENT_COMMAND</var>()
)
</code></pre>

<pre><code class="language-javascript">
newTrial("example-trial",newX()<var>.ELEMENT_COMMAND</var>(),getX()<var>.ELEMENT_COMMAND</var>())
</code></pre>

Therefore, the following style guidelines are only suggestions. Feel free to adapt
your scripts to your own style, and be aware that you may see scripts written in
other styles.

### Within a trial

+ Place the opening parenthesis, trial label, and following comma of a `newTrial`
command on the same line. Place the closing parenthesis on a new line.
    <pre><code class="language-diff-javascript diff-highlight">
    $newTrial("example-trial",
    $)
    </code></pre>
+ Call every instance of a `newX()` or `getX()` function on an indented (4 spaces
or 1 tab) new line. Except for the comma that follows the trial label argument, commas
that separate trial arguments should be placed on an indented new line.
    <pre><code class="language-diff-javascript diff-highlight">
    @newTrial("example-trial",
    $    newX()
    $    ,
    $    getX()
    @)
    </code></pre>
+ Call an element command on an indented new line under the element it's called
on; or
    <pre><code class="language-diff-javascript diff-highlight">
    @newTrial("example-trial",
    @    newX()
    $        <var>.ELEMENT_COMMAND</var>()
    $        <var>.ELEMENT_COMMAND</var>()
    @)
    </code></pre>
  call an element command on the same line as the element it's called on.
  <pre><code class="language-diff-javascript diff-highlight">
  @newTrial("example-trial",
  $    newX()<var>.ELEMENT_COMMAND</var>()<var>.ELEMENT_COMMAND</var>()
  )
  </code></pre>

### Global commands

Place every global command on an unindented new line, and separate global
commands with an empty new line.

<pre><code class="language-diff-javascript diff-highlight">
@newTrial("example-trial-one",
@  newX()
@)
$
@newTrial("example-trial-two",
@    newX()
@)
</code></pre>

### Special commands

We won't learn about special commands until section
[3. Commands]({{site.baseurl}}/core-concepts/3_commands),
but here's a preview: special commands are commands that are called within a
trial but not on an element. Like a `newX()` or `getX()` function, call a
special command on an indented new line.

<pre><code class="language-diff-javascript diff-highlight">
@newTrial("example-trial",
@    newX()
@    ,
$    <var>SPECIAL_COMMAND()</var>
@    ,
@    getX()
@)
</code></pre>

### Trial labels

*To be filled in*

---

## Flow of evaluation

PennController scripts are evaluated and executed from top to bottom. As soon
as one command is executed, the next command is immediately evaluated. When
there are no more commands to evaluate and execute, the experiment sends its
results to the server and ends.

**Certain elements and certain commands can interact in a way that pauses**
**experiment script evaluation**. For example, you can create a button and use
a command to pause the rest of the experiment until the participant clicks
on the button.

If your experiment script doesn't include any interactive elements and commands,
PennController will straightforwardly evaluate and execute the script
without ever giving the participant time to interact with the experiment,
and the experiment will likely end within a few milliseconds.
This is probably not what you want!
