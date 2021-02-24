---
title: var.log
command_type: "action"
syntax: .log()
description: "Adds a line to the results file indicating the value of the Var element."
alternates:
  - name: "\"final\""
  - name: "\"set\""
notes: true
---

+ Blank of `"final"` are equivalent and will add a line reporting the value of the Var element at the end of the trial. Passing `"set"` will add a line for each `.set` command that was called during runtime and report the value to which the command set the Var element.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@newVar("image", "none")
@    .log("final", "set")
$,
@newText("instructions", "Press any key")
@    .print()
@,
@newKey("any", "")
@    .wait()
@,
@getKey("any")
@    .test.pressed(" ")
@    .success(
@        newImage("tree", "Tree.png")
@            .print()
@        ,
@        getVar("image")
@            .set( "tree" )
@    )
@,
@getButton("continue", "Continue")
@    .print()
@    .wait()
</code></pre>

+ Adds a line of text reading *Press any key* and wait for any key to be pressed. Adds an image of a tree if the space key was pressed. Adds a button to click to continue.

+ At least one line will be added to the results file, indicating the final value of the Var element (either *none* or *tree*, depending on whether the pressed key was the space key). If the space key was pressed, another line will be added, reporting the value and the timestamp corresponding to the `.set` command (and to the key press, since `.set` is executed immediately after it).		
