---
title: scale.keys
command_type: "action"
syntax: .keys()
parameters:
  - name:  "key1"
  - name:  "key2"
  - name:  ... 
description: "Respectively associates the scale's options with the specified keys for selection."
notes: true
---

+ If you pass no argument, will check whether your scale's options are all single characters and, if so, will use them as keys. If not, will respectively associate the scale's options with the numeric keys.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newScale("grade",  "A", "B", "C", "D", "E", "F")
@    .labelsPosition("top")
@    .keys()
$    .print()
@,
@newScale(9)
@    .before( newText("Confidence:") )
@    .keys()
$    .print()
@,
@newScale("role",  "TA", "Professor")
@    .labelsPosition("right")
@    .keys("T", "P")
$    .print()
</code></pre>

+ Will add three scales onto the screen. Pressing *A*, *B*, *C*, *D*, *E* or *F* will select an option on the first scale, pressing a numeric key from 1 to 9 will select an option on the second scale, and pressing *T* or *P* will select an option on the third scale.		
