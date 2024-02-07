---
title: Key
since: beta 0.3
parent: Elements
children_collection: key
thumbnail: key.png
parameters:
  - name: VALIDATING_KEYS
    type: string
    description: A string of keyboard keys that validate the `Key` element.
description: Creates a keypress detector.
notes: true
---

+ Pass the empty string `""` for a press on any keyboard key.
+ Pass a single space `" "` for a press of the spacebar key. 
+ Since PennController 1.4, you can pass special keys like `"Enter"`, `"Shift"`,
and `"Escape"`.
+ Since PennController 1.4, you can pass multiple arguments to named `Key`
elements, for example `"newKey("answer", "FJ", "Escape")`.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newKey("FJ")
@  .log()
@  .wait()
</code></pre>

+ Waits until the key is pressed and logs which key was pressed
