---
layout: bottom-navbar-child
title: 3. Commands
parent: Core Concepts
nav_order: 3
numbered_headings: true
---

PennController has three types of commands:
{: .h1-blurb}

+ [Element commands](#element-commands): Used within a trial and called on an element
+ [Global commands](#global-commands): Used outside of a trial
+ [Special commands](#special-commands): Used within a trial, but not called on an element
{: .h1-blurb }

---

## Element commands

Element commands manipulate elements.

### Types of element commands

There are two types of element commands:

+ Action command: Directly manipulates an element
+ Test command (PennController equivalent of a conditional statement):
Runs a test on an element, and executes different code blocks depending on the
success or failure of the test.

Action commands and test commands are either *standard* or *element-specific*:

+ Standard: Can be called on any element type without causing a runtime error.
+ Element-specific: Can only be called on a specific element type. Otherwise,
causes a runtime error.

![Element command types]({{site.baseurl}}/assets/images/command-types.png)

### Action commands

Action commands make an element do "something".

If an element type contains multimedia content, an action command generally
manipulates the aesthetics or display of such content. For example,
the action command
[`standard.center`]({{site.baseurl}}/commands/standard-element-commands/standard-center){:target="_blank"}
horizontally centers an element, and the action command
[`standard.print`]({{site.baseurl}}/commands/standard-element-commands/standard-print){:target="_blank"}
prints an element to the screen.

```javascript
newTrial("trial-one",
    newText("greeting", "Hello, world!")
      .print()  // Prints "Hello, world!" to the screen
)
```

### Test commands

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

Test commands

### Prefixes

Throughout this guide and documentation, we'll occasionally use the prefix
`X.`, where `X` is an element type, or `standard.` to refer to a command.
For example, we might say "the `standard.print` command" or "the `text.center`
command".

The `standard.` prefix indicates that the command is a standard element command,
and can be called on any element type. 

```javascript
```

The `X.` prefix indicates that the command can only be called on the `X` element
type.


The `X.` prefix, where `X` is an element type, refers to the fact that there is actually
no singular "`wait` command". Instead, there are multiple `wait` commands that
behave similarly ("pause experiment script execution until..."), but are considered
separate commands with element-specific behavior, like `audio.wait` and `key.wait`.


The `X.` and `standard.` prefixes are only for illustrative reference,
and are **not used in PennController scripts**. This tutorial also drops the
`X.` or `standard.` prefix when referring to a command in prose.


### Standard and element-specific commands

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

### Multimedia commands

### Interactive commands



### Default commands

Every element type has a corresponding default object that can be accessed by
calling `defaultX`, where `X` is an element type. For example, the default object
of the `Text` element type is `defaultText`.

A default command is set by calling an element command on an element type's
default object. Once a default command has been set, it will be called on all
subsequent instances of that element type **within the same trial**. Instances
of that element type in other trials are not affected.

```javascript
newTrial("trial-one",
  newText("text-one")
)

newTrial("trial-two",
  defaultText
      .center()
  ,
  newText("text-two")
)

newTrial("trial-three",
)
```


### Syntax

To call an element command, the command:

+ Must be surrounded with `.` and `()`, for example `.print()`. The surrounding
`.` and `()` are dropped when referring to a command in prose outside of a code block,
for example "the `print` command".
+ Must be called on an element, in other words on an instance of the `newX` or
`getX` functions.Multiple commands can be called on a single element; commands
are evaluated in the order in which they are called.

Call each command on an indented new line for maximum readability:

```javascript
PennController.ResetPrefix(null)

newTrial("TRIAL_LABEL",
    newX("ELEMENT_1", ...)
        .COMMAND_1()
        .COMMAND_2()
        .COMMAND_3()
    ,
    newX("ELEMENT_2", ...)
        .COMMAND_4()
)
```

However, it is also valid to call multiple commands on a single line:

```javascript
PennController.ResetPrefix(null)

newTrial("TRIAL_LABEL",
  newX("ELEMENT_1", ...).COMMAND_1().COMMAND_2().COMMAND_3()
  ,
  newX("ELEMENT_2", ...).COMMAND_4()
)
```

---

## Global commands

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

---

## Special commands

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
