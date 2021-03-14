---
title: DebugOff
syntax: DebugOff()
description: "Tells your experiment to *not* run in Debug mode. This will close the popin window at the bottom-right corner of your experiment, no longer providing you with debugging tools and helpful feedback. You should only use this command when you are ready to collect data."
notes: true
---

+ Check the tutorial for a rapid overview of the Debugger.

+ Use `PennController.DebugOff()` (since PennController 1.4) before running the final version of your experiment (the `items` variable will then be undefined during runtime).

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
$PennController.DebugOff()
@
@PennController(
@    newButton("hello", "Hello world")
@        .print()
@        .wait()
@)
@
@PennController.AddTable( "Words" ,
@    "item,Word\n"  +
@       "1,Hello\n" +
@       "2,World"
@)
@
@PennController.Template( "Words" ,
@    row => PennController(
@        newButton(row.Word)
@            .print()
@            .wait()
@    )
@)
</code></pre>

