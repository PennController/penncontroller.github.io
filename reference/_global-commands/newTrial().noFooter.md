---
title: newTrial().noFooter
syntax: newTrial().noFooter()
description: "Will not run the footer sequence at the end of the trial."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@Footer(
@    newButton("validate", "Got it!")
@        .print()
@        .wait()
@);
@
@newTrial( "with footer" ,
@    newScale("score", 5)
@        .before( newText("left","Score:") )
@        .print()
@        .wait()
@);
@  
@newTrial( "without footer" ,
@    newScale("score", 5)
@        .before( newText("left","Score:") )
@        .print()
@        .wait()
@)
@.noFooter();
</code></pre>

+ The first trial (labeled *with footer*) will show a radio-button scale on the screen and reveal a button reading *Got it!* to be clicked when a radio button is selected. The second trial (labeled *without footer*) will end right after a radio button is selected.

+ 		
