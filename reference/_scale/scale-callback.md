---
title: scale.callback
command_type: "action"
syntax: .callback()
parameters:
  - name:  sequenceOfCommands 
description: "Executes a sequence of commands whenever a choice is made on the scale. This is particularly useful if, for example, you want to reveal a TextInput element only when a certain option is chosen."
since: beta 0.4
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newTextInput( "other" , "" )
@    .hidden()
@,
@newScale("yarrel",  "Yanny", "Laurel", "other")
@    .labelsPosition( "right" )
@    .after( getTextInput("other") )
$    .callback(
$        getScale("yarrel")
$            .test.selected( "other" )
$            .success( getTextInput("other").visible() )
$            .failure( getTextInput("other").hidden()  )
$    )
@    .print()
</code></pre>

+ 		
