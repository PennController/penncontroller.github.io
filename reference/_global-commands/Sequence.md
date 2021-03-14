---
title: Sequence
syntax: Sequence()
parameters:
  - name:  labels 
description: "Determines the order in which your trials will be run. Use your trials' labels to manipulate the running order."
notes: true
---

+ `Sequence` is a handler for the definition of Ibex's `shuffleSequence` variable. As such, its arguments follow the same format as those of Ibex's `seq` function. See Ibex's documentation manual, section called *Shuffle sequences*.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
$Sequence( "hello" , randomize("world") )
@
@newTrial( "world" ,
@    newButton("world", "Earth")
@        .print()
@        .wait()
@)
@newTrial( "world" ,
@    newButton("world", "Moon")
@        .print()
@        .wait()
@)
@newTrial( "world" ,
@    newButton("world", "Mars")
@        .print()
@        .wait()
@)
@
@newTrial( "hello" ,
@    newButton("world", "Hello...")
@        .print()
@        .wait()
@)
</code></pre>

+ Will run the trial labeled *hello* first, even though it is defined below the *world* ones, and then will run all three trials labeled *world* in a random order.		
