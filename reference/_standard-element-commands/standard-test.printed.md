---
title: standard.test.printed
command_type: "test"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .test.printed()
description: "Tests whether the element was printed onto the page (and has not been removed since then)."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newText("instructions", "Click on Top/Bottom to NOT print its word")
@    .print()
@,
@newButton("top", "Top")
@    .callback( getButton("top").remove() ) 
@    .print()
@,
@newButton("bottom", "Bottom")
@    .callback( getButton("bottom").remove() )
@    .print()
@,
@newButton("print", "Print the buttons' words")
@    .print()
@    .wait()
@    .remove()
@,
$getButton("top")
$    .test.printed()
$    .success( newText("top word", "hello").print() )
$,
$getButton("bottom")
$    .test.printed()
$    .success( newText("bottom word", "world").print() )
</code></pre>

+ Prints a *Top* and a *Bottom* button onto the page, which disappear when clicked. After a click on the *print* button, the word *hello* will appear if the *top* button is still displayed, and the word *world* will appear if the *bottom* button is still displayed.

+ 		
