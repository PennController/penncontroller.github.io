---
title: standard.refresh
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .refresh()
description: "Calls the command `print` again on the element, while leaving it where it was printed last."
notes: true
---

+ This command is primarily useful if some aesthetic command does not take effect unless `print` is called afterward, but you do not want to call `print` because calling it when you need the aesthetic command to take effect would move the element undesirably.

+ **NOTE:** PennController 1.1 handles this command incorrectly and it bugs systematically (draft)

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newImage( "smiley" , "ya.png" )
@,
@newCanvas( "myCanvas" , 100 , 100 )
@    .css( "border" , "solid 1px black" )
@    .center()
@    .add( "center at 50%" , "center at 50%" , getImage("smiley") )
@    .print()
@,
@newButton( "resize" , "Resize the image" )
@    .print()
@    .wait()
@,
@getImage( "smiley" )
@    .size( 64, 64 )
@,
@getCanvas("myCanvas")
$    .refresh()
</code></pre>

+ Prints the smiley image at the center of the canvas and adds a button below the canvas. After the button is clicked, the smiley is resized to 64x64 and without `refresh` the smiley would no longer be centrally aligned on canvas. Calling `print` on the canvas would recenter the image correctly, but it would move the canvas below the button. The solution is therefore to call `refresh` (or to call the settings command `add` again on the canvas).		
