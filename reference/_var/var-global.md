---
title: var.global
command_type: "action"
syntax: .global()
description: "Makes the Var element accessible from the script that has not been evaluated yet (=~ all the script below `.global()`)."
notes: true
---

+ **Note:** any `newVar` command using the same *id* will be ignored if it comes further below the `.global()` setting command. This is particularly helpful when calling `newVar` in the `Header`, the `Footer` or within `Template`: the value of the global Var element will *not* be reset with each new trial

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@PennController(
@    newVar("participantsName", "")
$        .global()
@    ,
@    newTextInput("name", "Please write your name")
@        .print()
@        .wait()
@        .setVar( "participantsName" )
@)
@.log("Participant", getVar("participantsName") );
@
@PennController(
@    newText("hello", "How are you today ")
@        .after( newText("name", "").text(getVar("participantsName")) )
@        .print()
@    ,
@    newButton("good", "Good, thank you")
@        .after( newButton("bad", "Not so well") )
@        .print()
@    ,
@    newSelector("mood")
@        .add( getButton("good"), getButton("bad") ) 
@        .wait()
@)
@.log("Participant", getVar("participantsName") );
</code></pre>

+ The code above creates two PennController trials: the first one creates a global Var element named *participantsName* whose value is set to the text contained in the TextInput element at the end of the trial; the second trial prints a Text element reading *"How are you today "* and appends another Text element to its right, whose content is set to the value of the global Var element.		
