---
title: selector.test.index
command_type: "test"
syntax: .test.index()
parameters:
  - name:  element 
description: "Tests the index of an element in the selector (starting with 0). If you pass no index, the test will be a success if the element is part of the selector, else a failure."
alternates:
  - name: " element , index "
notes: true
since: PennController 1.0
---

+ When testing an element, remember to use a `get*` command, as simply typing its ID will fail (ie. test `getImage("square")`, not just `"square"`)

+ This is particularly useful when you want to test the position of an element after a `shuffle`.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newText("feedback")
@,
@newCanvas("shapes", 825, 440)
@    .add(   0,   0, newImage("square"  , "square.png"  ) ) 
@    .add( 425,   0, newImage("triangle", "triangle.png") ) 
@    .print()
@,
@newSelector("choice")
@    .add( getImage("square") , getImage("triangle") ) 
@    .shuffle()
@,
$getSelector("choice")
$    .test.index( getImage("square") , 0 )
$    .success( getText("feedback").text("Square is on the left!")  )
$    .failure( getText("feedback").text("Square is on the right!") )
@,
@getCanvas("shapes")
@    .add( "center at 50%" , "center at 420" , getText("feedback") )
</code></pre>

+ First draws a *square* Image element to the left of a *triangle* Image element onto a Canvas element, then groups the Image elements into a Selector element and uses this to shuffle their positions. Will draw a Text element saying *Square is on the left!* if the *square* Image element ended up first in the Selector element after shuffling (index = 0), or *Square is on the right!* otherwise (i.e., if it ended up second, index = 1).		
