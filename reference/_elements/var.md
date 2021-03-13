---
title: Var
since: beta 0.3
children_collection: var
thumbnail: var.png
parameters:
  - name: DEFAULT_VALUE
    description: The default value of the element; set at the start of script evaluation.
description: Creates a variable that can be manipulated during script evaluation.
---

+ If a Var element with the same name was made global before the current newVar command is executed, the current newVar command will refer back to that Var element instead of creating a new one, and the default value will be ignored (the global Var element will not be set to the default value). 

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
$newVar("trialsLeft", 3)
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
$          getVar("trialsLeft")
$            .set( v => v-1 )   // Decrease trialsLeft 
@         ,
@          getText("trial")     // Update trial's text with it 
@            .text( getVar("trialsLeft") )
@          ,
$          getVar("trialsLeft") // Disable guess if 0 attempt left
$           .test.is(0)
$            .success( getTextInput("guess").disable() )
@        )   
@    )
</code></pre>

+ The code above creates a new Var element named trialsLeft and initiates it with the value 3. It then adds a text input box to the page pre-filled with Guess my name, and followed by Number of remaining attempts: 3 to its right.

+ When the return/enter key is pressed while editing the text input box, the code tests whether its content is Jeremy (ignoring case). If the content of the text input box is not a match, trialsLeft is decreased by 1 and the text is updated. Additionally, if 0 was reached, the text input box is disabled, thus preventing further proceeding. 
