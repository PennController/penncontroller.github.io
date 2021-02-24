---
title: dropdown.test.selected
command_type: "test"
syntax: .test.selected()
parameters:
  - name: option
description: "Tests whether an option is selected. If you pass no option as an argument, then the test will succeed as long as *any* option is selected."
notes: true
---

+ If you pass a number, and provided there is no option whose text content corresponds to this exact number, it will test the index of the selected option (starting from 0).

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newDropDown("adjective", "")
@    .add( "hot"  , "lukewarm" , "cold" )
@    .shuffle()
@    .print()
@    .wait()
@,
@getDropDown("adjective")
$    .test.selected( 1 )
$    .success(
$        newText("You selected the middle option (index-based).")
$            .print()
$    )
$    .failure(
$        getDropDown("adjective")
$            .test.selected( "lukewarm" )
$            .success(
$                newText("You selected the middle option (scale-based)")
$                    .print()
$            )
$    )
</code></pre>

+ Creates a drop-down list with three options, *hot*, *lukewarm* and *cold*, shuffles the options, prints the list and waits until an option is selected before proceeding. After an option is selected, tests whether the option at index 1 was selected and, if so, will print *You selected the middle option (index-based)*, otherwise will test whether the option *lukewarm* was selected and, if so, will print *You selected the middle option (scale-based)*.		
