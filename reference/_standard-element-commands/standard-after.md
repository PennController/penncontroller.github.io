---
title: standard.after
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .after()
parameters:
  - name:  getElement(id) 
description: "Adds some content to the right of the element."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newImage("bad", "no.png")
@,
@newImage("good", "ya.png")
@,
@newText("left label", "Bad")
@    .before( getImage("bad") )
@,
@newText("right label", "Good")
$    .after( getImage("good") )
@,
@newScale("judgment", 5)
@    .before( getText("left label") )
$    .after( getText("right label") )
@    .print()
@    .wait()
</code></pre>

+ Creates two image and two text elements and prints a 5-point radio-button scale, with the text *Bad* preceded by the image *no.png* on its left, and the text *Good* followed by the image *ya.png* on its right.		
