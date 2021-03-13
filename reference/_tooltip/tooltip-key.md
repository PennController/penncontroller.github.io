---
title: tooltip.key
command_type: "action"
syntax: .key()
parameters:
  - name: "keys"
description: "Makes it possible to validate the tooltip by pressing a key. You can either pass a string of keys, or pass the keycode of a specific key (e.g. 13 for enter/return). If you pass a non-null second parameter (e.g. *\"no click\"*) then clicks will have no effect for validation, and if you have not specified a text for the validation button when creating the tooltip, no such button will be displayed at its bottom-right corner."
alternates:
  - name: "\"keys\", \"no click\""
  - name: "keycode"
  - name: "keycode, \"no click\""
notes: true
---

+ Adds an image to the page and places a box with the text *Press enter/return when you are done admiring this beautiful square* to its bottom-right corner, containing *no* validation button. The tooltip will disappear only when the enter/return key (whose keycode is 13) is pressed.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newImage("myImage", "square.png")
@    .print()
@,
@newTooltip("myTooltip", "Press enter/return when you are done admiring this beautiful square")
$    .key(13, "no click")
@    .print( getImage("myImage") )
@    .wait()
</code></pre>

+ Adds an image to the page and places a box with the text *Press enter/return when you are done admiring this beautiful square* to its bottom-right corner, containing *no* validation button. The tooltip will disappear only when the enter/return key (whose keycode is 13) is pressed.

+ 		
