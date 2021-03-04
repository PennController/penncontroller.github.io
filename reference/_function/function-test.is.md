---
title: function.test.is
command_type: "test"
syntax: .test.is()
description: "Executes the function and tests the value it returns. If you specify no value, it yields success if the return value is 0, *null*, *undefined* or *false*."
alternates:
  - name: " value "
notes: true
---

+ **NOTE:** remember that the expression you pass as the test value is executed at the very beginning of the experiment. So calling *getFunction("myFunction").test.is( **Date.now()** )* will test that the function returns the timestamp *corresponding to the beginning of the experiment*. In this case, you may consider rewriting your function so it takes care of testing *Date.now()* and returns *true* or *false* in consequence.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newFunction("timestampMultipleOfThree", () => Date.now() % 3 )
@,
@newText("missed", "Bad luck, try again!")
@    .color("red")
@    .bold()
@,
@newButton("myButton", "Click me")
@    .print()
@    .wait(
@        getFunction("timestampMultipleOfThree")
$            .testNot.is()
$            .success( getText("missed").remove() )
$            .failure( getText("missed").print() )
@    )
</code></pre>

+ Adds a button to the screen whose clicks are validated only if happening at a time when the timestamp is **not** a multiple of 3 (i.e., the modulo value returned by the function is **different** from 0).		
