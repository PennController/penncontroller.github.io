---
title: key.test.pressed
command_type: "test"
syntax: .test.pressed()
description: "Tests whether a key was pressed."
alternates:
  - name: " string "
  - name: " string , \"first\" "
  - name: " number "
  - name: " number , \"first\" "
notes: true
---

+ If you pass no argument, it will yield success if any (valid) key has been pressed since the creation of the Key element. If you pass a string, it will test that the pressed key(s) is/are contained in the string. Alternatively you can pass a number representing a charCode. Since beta 0.3, if you pass a string as a second parameter (e.g. *"first"*) then only the first valid key that was pressed since the creation of the Key element will be tested.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("instructions", "Press F if you think 0.999... = 1, press J otherwise.")
@    .print()
@,
@newKey("forj", "FJ")
@    .wait()
@,
@getKey("forj")
$    .test.pressed("F")
$    .success( newText("success", "You're right!").print() )
$    .failure( newText("failure", "You're wrong, 0.999... and 1 do refer to the same number").print() )
</code></pre>

+ Will print the success message if the key that was pressed was F. Will print the failure message otherwise (i.e., if it was J).		
