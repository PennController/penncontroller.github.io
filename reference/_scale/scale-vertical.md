---
title: scale.vertical
command_type: "action"
syntax: .vertical()
description: "Makes the buttons and labels of the scale appear vertically, with the initially left-most value to the bottom and the initially right-most value on top."
notes: true
---

+ If you also use `.labelsPosition`, top labels will accordingly appear on the right, and bottom labels will appear on the left.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newScale("slider",   100)
@    .slider()
@    .vertical()
$    .print()
</code></pre>

+ Adds a 100-point vertical slider to the page and a button to validate.		
