---
title: textinput.lines
command_type: "action"
syntax: .lines()
parameters:
  - name:  number 
description: "Sets the maximum number of lines for the input box (1 by default). As a special case, you set it to 0 to remove the limit constraint."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTextInput("haiku", "hatsu shigure\nsaru mo komino o\nhoshige nari")
@    .lines(3)
$    .print()
</code></pre>

+ Adds a 3-line input box to the screen containing a haiku (note the `\n` to insert linebreaks in the text).		
