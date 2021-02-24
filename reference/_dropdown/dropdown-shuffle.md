---
title: dropdown.shuffle
command_type: "action"
syntax: .shuffle()
description: "Shuffles the options that have been added to the DropDown *so far*. If you call `shuffle` *before* `settings.add` then it will have no effect."
alternates:
  - name: " \"keep selected\" "
notes: true
---

+ Passing an argument means that you want any option currently selected to remain selected after the shuffle (`"keep selected"` is simply given as an example---you can pass an arbitrary string).

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newDropDown("warmth", "")
@    .add("hot", "lukewarm", "cold")
@    .shuffle()
$,
@newText("Spring in Colorado is ")
@    .after( getDropDown("warmth") )
@    .print()
@,
@getDropDown("warmth")
@    .wait()
</code></pre>

+ Creates a drop-down list containing the options *hot*, *lukewarm* and *cold*, shuffles them, adds the drop-down list to the right of the text *Spring in Colorado is* and prints everything onto the page, then waits until an option is selected from the drop-down list before proceeding.		
