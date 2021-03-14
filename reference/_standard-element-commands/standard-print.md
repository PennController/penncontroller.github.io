---
title: standard.print
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .print()
description: "Adds the content of the element to the screen. This has no effect for non-visual elements such as the purely interactive Selector elements."
alternates:
  - name: "x,y"
  - name: "x,y,canvas"
notes: true
---

+ Since PennController 1.3, you can pass `x` and `y` values to print the element at a specific position on the page, or on a Canvas element if you pass one (or the name of a Canvas element) as the third parameter. You can use any CSS coordinate format for `x` and `y`, or special string values following the respective formats `"left|center|right at ..."` and `"top|middle|bottom at ..."`. Note that `x` and `y` are not supported for Audio, Canvas, Scale, TextInput, Video and Youtube elements in PennController 1.3 ; note also that elements added with `.before` and `.after` mess with proportional coordinates.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newImage( "smiley" , "ya.png" )
@,
@newCanvas( "myCanvas" , 100 , 100 )
@    .css( "border" , "solid 1px black" )
@    .center()
@    .add( "center at 50%" , "center at 50%" , getImage("smiley") )
$    .print()
</code></pre>

+ Prints the smiley image at the center of the canvas.
