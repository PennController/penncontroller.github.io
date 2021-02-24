---
title: scale.slider
command_type: "action"
syntax: .slider()
description: "Transforms the scale into a slider. **Note** that sliders always have a default value in order to place their cursor. If you do not use the settings command `default`, the central (or next-to-central) value will be used."
notes: true
---

+ The *Comments* column of the results line will report how long it took to move the slider from its former to its selected value (in ms).

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newScale("slider",   100)
$    .slider()
@    .print()
</code></pre>

+ Adds a 100-point slider to the page and a validation button.		
