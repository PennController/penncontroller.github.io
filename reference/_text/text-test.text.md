---
title: text.test.text
command_type: "test"
syntax: .test.text()
parameters:
  - name:  string 
description: "Tests whether the text matches the string (identical, case-sensitive) or the regular expression."
alternates:
  - name: " /RegExp/ "
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTrial(
@  newText("q1", "What's up?")
@    .print()
@  ,
@  getText(q1)
$  .test.text( "Hi" )
@)
</code></pre>

+ Adds a text to the screen and then tests if it is equal to the string "Hi" .
