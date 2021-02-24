---
title: newTrial().setOption
syntax: newTrial().setOption()
description: "Lets you modify a parameter of the controller, as you would for any other controller in Ibex."
notes: true
---

+ This can be helpful if you want to override some default settings, such as `countsForProgressBar` which is used by Ibex.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
@newTrial(
@    newScale("Score", 8)
@        .slider()
@        .print()
@        .wait()
@)
$.setOption("countsForProgressBar", false);
</code></pre>

+ This trial will not count for the progress bar at the top of the Ibex experiment page (see the Ibex documentation manual).		
