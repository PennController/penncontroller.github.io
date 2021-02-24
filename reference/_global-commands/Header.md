---
title: Header
syntax: Header()
parameters:
  - name:  sequenceOfCommands 
description: "Will evaluate and run `sequenceOfCommands` at the beginning of each trial created with `PennController`."
notes: true
since: beta 0.3
---

+ **Note** that `default` commands are immediately evaluated (rather than evaluating upon running). As a consequence, any `default` command will only have an effect on PennController trials defined *after* the Header has been set.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
$Header(
$    defaultText
$        .print()
$)
@
@newTrial(
@    newText("test sentence", "The cat is chasing the mouse")
@    ,
@    newText("instructions", "How natural is this sentence?")
@    ,
@    newScale("natural", 5)
@        .slider()
@        .before( newText("left", "Unnatural") )
@        .after(  newText("right", "Natural")  )
@        .print()
@        .wait()
@)
@
@newTrial(
@    newText("test sentence", "The mouse is being chased by the cat")
@    ,
@    newText("instructions", "How natural is this sentence?")
@    ,
@    newScale("natural", 5)
@        .slider()
@        .before( newText("left", "Unnatural") )
@        .after(  newText("right", "Natural")  )
@        .print()
@        .wait()
@)
</code></pre>

+ Though no `print` command explicitly appears in the trials themselves, the Text elements will be printed onto the page because the header defines `print` as a default command for all Text elements.

+ 		
