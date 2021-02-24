---
title: dropdown.select
command_type: "action"
syntax: .select()
parameters:
  - name:  "option" 
description: "Selects an option in the drop-down list. Nothing happens if the option passed as an argument does not exist."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newDropDown("warmth", "")
@    .add("hot", "lukewarm", "cold")
@    .select( "lukewarm" )
$,
@newText("Spring in Colorado is ")
@    .after( getDropDown("warmth") )
@    .print()
</code></pre>

+ Creates a drop-down list containing the options *hot*, *lukewarm* and *cold*, selects the option *lukewarm* and adds the list to the right of the text *Spring in Colorado is*, then prints everything onto the page.		
