---
title: Scale
since: beta 0.3
children_collection: scale
thumbnail: scale.png
parameters:
  - name: NUMBER_OF_BUTTONS
    type: int
    description: Adds the specified number of radio buttons to the element.
description: Represents a horizontal scale.
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTrial( "mcq" ,
@  newText("Are you male or female?")
@    .print()
@  ,
$  newScale("gender", "male", "female")
$    .labelsPosition("right")
$    .print()
$    .wait()
@)
</code></pre>

+ Adds a question and two radio buttons for two possible options.
