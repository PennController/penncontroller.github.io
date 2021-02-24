---
title: function.call
command_type: "action"
syntax: .call()
description: "Executes the function."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newFunction("setKeyTime", function(){ this.keyTime = Date.now(); }),
@newFunction("keyTimerDelay", function(){ return Date.now() - this.keyTime > 10; }),
@newButton("Start", "Start")
@    .print()
@    .wait(),
@newText("instrutions", "Quick, you have one second to press the T key!")
@    .print(),
@newTimer("quick", 1010)
@    .start(),
@newKey("t", "T")
@    .wait(),
$getFunction("setKeyTime")
$    .call(),
@getTimer("quick")
@    .wait("first"),
@getFunction("keyTimerDelay")
@    .test.is(true)
@    .success(
@        newText("success", "Good job!")
@            .print()
@    )
@    .failure(
@        newText("failure", "Too slow...")
@            .print()
@    ),
@getButton("Start")
@    .wait()
</code></pre>

+ 		
