---
title: textinput.length
command_type: "action"
syntax: .length()
parameters:
  - name:  number 
description: "Limits the maximum number of characters that can be entered in the input box. `0` or lower means no limit (default setting). Note that linebreaks count as characters in the limit (`\n` and `\r`)."
since: beta 0.3
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTextInput("haiku", "hatsu shigure\nsaru mo komino o\nhoshige nari")
$    .length(45)
@    .lines(3)
@    .print()
</code></pre>

+ Adds a 3-line input box limited to 45 characters to the screen, containing a haiku (note the `\n` to insert linebreaks in the text).		
