---
title: Debug
syntax: Debug()
description: "Runs your experiment in Debug mode."
notes: true
---

+ A pop-in console appears at the bottom-right corner of the page when your experiment runs in Debug mode. The Debug console gives you information on the experiment's structure and on the current trial. Buttons in the *Sequence* and *Log* tabs let you force the experiment to move on to the next steps/trials. The *Tables* tab lists the tables available to your script, which you can click to explore.

+ In Debug mode, the `items` variable containing the content of all your trials is publicly accessible. This means that, for example, you can open your browser Javascript's console and type `items` to take a look at how each of your trials is defined. 

+ Make sure to use `PennController.DebugOff()` (since PennController 1.4) before running the final version of your experiment (the `items` variable will then be undefined during runtime).

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
$PennController.Debug()
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

+ 		
