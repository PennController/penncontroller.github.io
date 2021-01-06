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

+ [Action command](){:target="_blank"}: Directly manipulates an element
+ [Test command](){:target="_blank"}(PennController equivalent of a conditional statement):
Runs a test on an element, and executes different code blocks depending on the
success or failure of the test.

Action commands and test commands can be informally categorized as *standard*
or *element-specific*:

+ Standard: Can be called on any element type without causing a runtime error.
+ Element-specific: Can only be called on specific element types. Otherwise,
causes a runtime error.

![Element command types]({{site.baseurl}}/assets/images/command-types.png)

### Action commands

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

### Test commands

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

### `testNot`, `and`, `or`

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

### Standard and element-specific commands

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

### Element command prefixes

You may see...

The `X.` prefix, where `X` is an element type, refers to the fact that there is actually
no singular "`wait` command". Instead, there are multiple `wait` commands that
behave similarly ("pause experiment script execution until..."), but are considered
separate commands with element-specific behavior, like `audio.wait` and `key.wait`.

This is contrast to standard element commands, like
[`standard.print`]({{site.baseurl}}/commands/standard-element-commands/standard-print){:target="_blank"}.
The `standard.` prefix indicates the command can be called on any element type.

The `X.` and `standard.` prefixes are only for illustrative reference,
and are **not used in PennController scripts**. This tutorial also drops the
`X.` or `standard.` prefix when referring to a command in prose.

For more information, read the
[Element commands]({{site.baseurl}}/core-concepts#element-commands){:target="_blank"}
documentation page.

### Default commands

A default command is an element command that has been called on the default object
of an element type.

### Element command syntax

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
