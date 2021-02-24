---
title: newTrial().label
syntax: newTrial().label()
description: "This is another way to assign a label to a PennController trial so you can refer to it in `Sequence`. It is most useful called on `CheckPreloaded` or `InitiateRecorder` since those commands do not take labels as arguments."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@
$Sequence( "practice" , "preload-exp" , rshuffle("filler","test") )
@
@CheckPreloaded( 
@  "filler"
@  ,
@  "test"
$).label( "preload-exp" )
</code></pre>

+ Creates a trial labeled *preload-exp* checking that all the resources used in the PennController trials labeled *filler* or *test* are preloaded, and refers to its label in `Sequence` so it will be run before the *filler* and *test* trials, but after the *practice* trials.		
