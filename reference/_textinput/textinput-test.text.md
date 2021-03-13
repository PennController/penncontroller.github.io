---
title: textinput.test.text
command_type: "test"
syntax: .test.text()
parameters:
  - name: "string"
description: "Tests for a match with the text in the input box."
alternates:
  - name: " /RegExp/ "
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTextInput("haiku", "hatsu shigure\nsaru mo komino o\nhoshige nari")
@    .lines(3)
@    .print()
@,
@newButton("save", "Save")
@    .print()
$    .wait( getTextInput("haiku").test.text(/^.+[\r\n].+[\r\n].+$/) )
</code></pre>

+ Adds a 3-line input box to the screen containing a haiku (note the `\n` to insert linebreaks in the text) above a *Save* button and waits for a click on the button. The click is validated only if, at the moment of the click, the text in the input box contains three lines of text.		
