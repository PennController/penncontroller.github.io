---
title: Selector
since: beta 0.3
parent: Elements
children_collection: selector
thumbnail: selector.png
description: Creates a group that elements can be added to and selected from.
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTrial(
@  newText("q1", "What's up?")
@    .print()
@  ,
@  newText("q2", "How are you doing?").
@    .print()
@  ,
@  newText("q3", "All good?")
@    .print()
@  ,
@  newText("q4", "How's it going?")
@    .print()
@  ,
$  newSelector("choice")
$   .add( getText("q1") , getText("q2") , getText("q3") , getText("q4")  )
$   .shuffle()
$   .wait()
@)
</code></pre>

+ Adds a selection of four questions.

