---
title: scale.default
command_type: "action"
syntax: .default()
parameters:
  - name:  value 
description: "Makes a value selected by default when printing the scale element. You can pass either an index or a text value as `value`."
notes: true
since: beta 0.3
---

+ **Note** that sliders necessarily have a default value. If you do not use `.default` to specify one, the central one will be used (or next to central if the number of possible values is odd).

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newScale("score",   "Terrible", "Bad", "Good", "Terrific")
@    .before( newText("left", "The last movie I saw was ") )
@    .labelsPosition("top")
$    .default("Terrific")
@    .print()
</code></pre>

+ Adds a scale with 4 horizontally aligned radio buttons to the screen, with their respective labels appear on top of them, selects the right-most button by default, and waits for a click on a radio button.

+ 		
