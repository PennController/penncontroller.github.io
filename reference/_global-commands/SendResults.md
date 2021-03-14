---
title: SendResults
syntax: SendResults()
description: "Since PennController 1.7, `SendResults` can be used in three different environments: "
alternates:
  - name: " \"label\" "
notes: true
---

+ Sending the results early is useful if you want your participants to see a confirmation screen at the end.

+ Through the Try-it interface, the *Send  quit now* button will crash because the experiment is not run globally but instead from within the test page.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
$Sequence( "hello" , "world" , SendResults() , "bye" )
@
@newTrial( "hello" ,
@    newButton("Hello")
@        .log()
@        .print()
@        .wait()
@)
@newTrial( "world" ,
@    newButton("Send  quit now")
@        .callback( 
@            getButton("World")
@                .remove()
@            ,
@            SendResults()
@        )
@        .print( 10 , 10 )
@    ,
@    newButton("World")
@        .log()
@        .print()
@        .wait()
@)
@
@newTrial( "bye" ,
@    newText("thanks", "Thank your for participating in this experiment.")
@        .print()
@    ,
@    newText("link", "Click here to confirm your participation.")
@        .print()
@    ,
@    newTimer("forever", 1)
@        .wait()            // Timer never started: will wait forever
@)
@.setOption("countsForProgressBar",false)
</code></pre>

+ Through the Try-it interface, the *Send  quit now* button will crash because the experiment is not run globally but instead from within the test page.		
