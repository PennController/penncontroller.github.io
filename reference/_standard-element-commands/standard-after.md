---
title: standard.after
command_type: action
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, Youtube]
syntax: getX("*ELEMENT_NAME*").after(getX("*ARGUMENT_NAME*"))
description: Takes an element as an argument, and adds that element's content to the right of the element that the command is called on.
related:
  - name: standard.before
    collection: standard-element-commands
---

<pre><code class="language-diff-javascript diff-highlight">
@// Option 1: Pass a new element as an argument
@newTrial("option-1",
@    newText("center", "BANANA")
@        .before(newText("left", "apple"))
$        .after(newText("right", "orange"))
@        .print()
@)
@
@// Option 2: Pass an existing element as an argument
@newTrial("option-2",
@    newText("left", "apple")
@    ,
@    newText("right", "orange")
@    ,
@    newText("center", "BANANA")
@        .before(getText("left"))
$        .after(getText("right"))
@        .print()
@)
</code></pre>

↳ Prints `appleBANANAorange` to the screen.