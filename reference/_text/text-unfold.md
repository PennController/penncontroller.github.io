---
title: text.unfold
command_type: "action"
syntax: .unfold()
parameters:
  - name:  delay 
description: "Unfolds the text in `delay` milliseconds."
since: PennController 1.3
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("Hello world")
@    .unfold( 3000 )
$,
@newTimer(3000)
@    .start()
@    .wait()
</code></pre>

+ Starts unfolding the text "Hello world" in 3s (which is very slow for only two words) and immediately starts a 3s timer and waits until it ends.		
