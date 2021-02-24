---
title: var.test.is
command_type: "test"
syntax: .test.is()
parameters:
  - name:  value 
description: "Tests the value of the Var element. You can pass a function which takes the element's value as its argument and returns `true` or `false`."
alternates:
  - name: " function "
since: beta 0.3
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newVar("trialsLeft", 3)
@,
@newText("remain", " Number of remaining attempts: ")
@    .after( newText("trial", "3") )
@,
@newTextInput("guess", "Guess my name")
@    .after( getText("remain") )
@    .print()
@    .wait( 
@      getTextInput("guess")
@        .test.text( /Jeremy/i )
@        .failure(              // Wrong guess:
@          getVar("trialsLeft")
@            .set( v => v-1 )   // Decrease trialsLeft 
@          ,
@          getText("trial")     // Update trial's text with it 
@            .text( getVar("trialsLeft") )
@          ,
@          getVar("trialsLeft") // Disable guess if 0 attempt left
@            .test.is(0)
$            .success( getTextInput("guess").disable() )
$        )   
@    )
</code></pre>

+ 		
