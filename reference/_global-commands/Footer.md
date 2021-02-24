---
title: Footer
syntax: Footer()
parameters:
  - name:  sequenceOfCommands 
description: "Will append `sequenceOfCommands` to the end of the sequence of commands of each trial created with `PennController`."
since: beta 0.3
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@Footer(
$    newText("validation instructions", "Click to go to next trial")
$        .print()
$    ,
$    newButton("validation button", "Validate")
$        .print()
$        .wait()
$);
@
@newTrial(
@    newText("test sentence", "The cat chases the mouse")
@        .print()
@    ,
@    newScale("natural", 5)
@        .slider()
@        .before( newText("left", "Unnatural") )
@        .after(  newText("right", "Natural")  )
@        .print()
@);
</code></pre>

+ Without the footer, the trial defined above would be validated immediately after it has started running, since it includes no `wait` command. Thankfully, the footer adds a button at the bottom of the page that must be clicked for validation.		
