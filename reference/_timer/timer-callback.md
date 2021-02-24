---
title: timer.callback
command_type: "action"
syntax: .callback()
parameters:
  - name:  element 
description: "**Warning: until PennController beta 0.2, this command has a bug that freezes the script**"
alternates:
  - name: " function "
notes: true
---

+ Will execute the function or element command when the timer has finished running for the first time.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newText("start", "Ready... go!")
@    .print()
@,
@newButton("click", "Click me!")
@    .print()
@,
@newTimer("hurry", 1000)
$    .callback( getButton("click").remove() )
@    .start()
@,
@getButton("click")
@    .wait()
@,
@newText("success", "You're quick!")
@    .print()
</code></pre>

+ Adds a line of text saying *Ready... go!* to the screen above a button reading *Click me!*, then starts a 1s timer and waits for a click on the button. After 1s, the button disappears. The text *You're quick!* appears on the page after a click on the button. If the button was not clicked within 1s, the text does not show up and the script waits for a click forever (since the button no longer can be clicked). If the button was clicked, then the button's `wait` command is validated and the text shows up (the button will still disappear after one second, as specified in the callback).		
