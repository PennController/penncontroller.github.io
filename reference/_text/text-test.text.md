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
@Template( row => 
@  newTrial(
@    newText("sentence", row.Text ).print()
@    ,
@    newImage( row.Image ).print()
@    ,
$    getText("sentence")
$       .test.text( /\?$/ )
$       .success( newKey("fj").log().wait() )
$       .failure( newTimer(1000).start().wait() )
@  )
@)
</code></pre>

+ Prints a Text element named _sentence_ onto the page using the text from the current table row's _Text_ column, and below it an Image element using the filename from the current table row's _Image_ column. Then, tests whether the text content of the _sentence_ Text element ends with a `?` character: if it does, the script waits for a keypress on `F` or `J`, otherwise it waits 1s before moving on to the next trial.
