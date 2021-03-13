---
title: scale.horizontal
command_type: "action"
syntax: .horizontal()
description: "Makes the buttons and labels of the scale appear horizontally. This is the default aesthetics of scales."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newScale("slider",   100)
@    .slider()
@    .vertical()
@    .print()
@,
@newButton("rotate", "Horizontal slider")
@    .print()
@    .wait()
@,
@getScale("slider")
$    .horizontal()
@    .print()
</code></pre>

+ Adds a vertical slider to the page and a button which, when clicked, rotates the slider so it appears horizontally.		
