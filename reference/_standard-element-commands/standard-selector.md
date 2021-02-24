---
title: standard.selector
command_type: "action"
relevant_elements: [Audio, Button, Canvas, Controller, DropDown, Html, Image, MediaRecorder, Scale, Selector, Text, TextInput, Tooltip, Video, VoiceRecorder, Youtube]
syntax: .selector()
parameters:
  - name:  selectorName 
description: "Since beta 0.3, *Selector* adds a `.selector` command to all elements as another method for adding them to a selector."
alternates:
  - name: " getSelector(selectorName) "
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newSelector("shapes")
@,
@newImage("square", "square.png")
@    .selector("shapes")
$,
@newImage("triangle", "triangle.png")
@    .selector("shapes")
$,
@newCanvas("shapes canvas", 825, 400)
@    .add(  0, 0, getImage("square") )
@    .add(425, 0, getImage("triangle") )
@    .print()
@,
@getSelector("shapes")
@    .wait()
</code></pre>

+ Adds two images side by side and waits for a click on either one of them.		
