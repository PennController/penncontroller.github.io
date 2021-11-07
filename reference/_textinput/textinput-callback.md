---
title: textinput.callback
command_type: "action"
syntax: .callback()
description: "Will execute the command(s) whenever the text is inputted."
notes: true
---

+ Adds a one-line input box to the screen preceded with *Violets are blue, roses are red,* on its left and waits for a press on the enter/return key, after what the text can no longer be edited.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTextInput("poem", "")
@    .before( newText("flowers", "Violets are blue, roses are red, ") )
@    .once()
@    .print()
@    .wait()
$    .callback( 
$        getVideo("skate")
$           .stop()
$            .play()
$    )
</code></pre>

+ Adds a one-line input box to the screen preceded with *Violets are blue, roses are red,* on its left and waits for a press on the enter/return key, after what the text can no longer be edited.		
