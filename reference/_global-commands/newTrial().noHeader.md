---
title: newTrial().noHeader
syntax: newTrial().noHeader()
description: "Will not run the header sequence at the beginning of the trial. Note that this also concerns default commands defined in the header: those will *not* be run in trials where you use `noHeader`."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@Header(
@    defaultButton
@        .print()
@        .wait()
@    ,
@    newText("please", "Please give a score")
@        .print()
@)
@
@newTrial( "twoClicks" ,
@    newScale("score", 5)
@        .print()
@    ,
@    newButton("validate", "Validate")
@        .wait( getScale("score").test.selected() )
@)
@
@newTrial( "oneClick" ,
@    newScale("score", 5)
@        .print()
@    ,
@    newButton("validate", "Validate")
@        .print()
@        .wait( getScale("score").test.selected() )
@)
$.noHeader()
</code></pre>

+ The first trial (labeled *twoClicks*) will show a text at the top of the page, then a radio-button scale and a button. Because the header already contains a `wait` command, two clicks will be necessary to validate the button (the second one having to happen after a radio-button is selected). On the contrary, the second trial (labeled *oneClick*) which uses `noHeader`, will show no text at the top of the page and will only require one click on the button to validate it (assuming a radio-button is selected), because it will only evaluate and execute one `wait` command.

+ 		
