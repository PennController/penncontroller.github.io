---
title: var.set
command_type: "action"
syntax: .set()
parameters:
  - name:  value 
description: "Sets the Var element to the specified value."
alternates:
  - name: " function "
notes: true
since: beta 0.3
---

+ You can pass a function as *value*, which takes the current value of the Var element as an argument and should return the new value to which it will be updated.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@defaultText
@    .print()
@,
@defaultKey
@    .wait()
@,
@newVar("firstKeyPressed")
@,
@newText("firstPress", "Press any key")
@,
@newKey("firstKey", "")
@,
@getVar("firstKeyPressed")
@    .set( getKey("firstKey") )
$,
@newText("printFirstKey", "")
@    .text( getVar("firstKeyPressed") )
@,
@newText("secondPress", "Good, now press a second key.")
@,
@newKey("secondKey", "")
@    .test.pressed( getVar("firstKeyPressed") )
@    .success( newText("same", "So, you pressed the same key twice!") )
@    .failure( newText("diff", "You appear to be quite inconstant.") )
@,
@newButton("validate", "OK")
@    .print()
@    .wait()
</code></pre>

+ First creates a Var element named *firstKeyPressed* and then prints a text inviting to press any key. When a key is pressed, it is stored in the Var element (`.set` command). The Var element is then used to print which key was pressed, and when a second key is pressed, it is used to test that the same key was pressed.		
