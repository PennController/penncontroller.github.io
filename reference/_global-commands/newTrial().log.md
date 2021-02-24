---
title: newTrial().log
syntax: newTrial().log()
description: "You can use the `.log` method to add columns to every line corresponding to this trial that is logged in the results file. You can add as many `.log` as you want."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
@newTrial(
@    newButton("helloworld", "Hello world!")
@        .log()
@        .print()
@        .wait()
@)
$.log("Trial type", "One-Button")
$.log("Text on button", "Hello world!");
</code></pre>

+ Will add *One-Button* and *Hello world!* to the end of every line saved to the results file for this trial.

+ 		
