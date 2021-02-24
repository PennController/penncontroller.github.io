---
title: selector.log
command_type: "action"
syntax: .log()
description: "A line will be added to the results file when an element is selected indicating its reference name and the timestamp of selection."
alternates:
  - name: "\"first\""
  - name: "\"last\""
  - name: "\"all\""
notes: true
---

+ Leaving the parentheses blank or calling `"last"` will log the last selection. Calling `"first"` will log the first selection. Calling `"all"` will log all selections.

+ **Note:** in beta 0.3, the only options were blank and `"all"`, and they were equivalent.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@newImage("square", "square.png")
@,
@newImage("triangle", "triangle.png")
@    .before( getImage("square") )
@    .print()
@,
@newSelector("shapes")
@    .add( getImage("square") , getImage("triangle") )
@    .log()
$,
@newButton("validation", "Validate")
@    .print()
@    .wait()
</code></pre>

+ Adds two images side by side and a button to click below them. Any selection of either image will output a line in the results file.		
