---
title: Keywords
permalink: /keywords/
nav_order: 5
blurb: Parts of the trial/code that describe key events/outcomes such as success and failure

# {{ page.title }}

---

## `success`

+ Determines what should be done if the condition is fulfilled. 

+ In the following example if the word in a row "ShowImage" in the csv table is equal to "True" then the image will be printed to the page.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@Template( row => 
@  newTrial(
@    newText( row.Question ).print()
@   ,
@    newVar("showImage")
@      .set( row.ShowImage )
@      .test.is( "Yes" )
$      .success( newImage( row.Image ).print() )
@    ,
@    newScale("answer", "Yes", "No")
@      .button()
@      .print()
@      .wait()
@  )
@)
</code></pre>
---

## `failure`

+ Determines what should be done if the condition if not fulfilled.

+ In the following example if the wrong key is pressed, failure keyword will signal printing out negative feedback. Furthermore, if the key is pressed too slow, failure keyword will singal printing out feedback saying "Too slow..."

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@getKey("response")    
@    .test.pressed()
@    .success( getKey("response").test.pressed(row.answer)
$        .failure(newText("negative feedback", "Wrong answer!")
@            .log()
@            .print()
@            .center()
@            .cssContainer({"font-size": "160%", "color": "red"})
@        )
@    )
$    .failure(newText("slow", "Too slow...")
@        .log()
@        .print()
@        .center()
@        .cssContainer({"font-size": "160%", "color": "red"})  
@    )
</code></pre>
---

## `testNot`

+ Tests if the outcome is not equal to the given value.

+ In the following example function tests if the value of the outcome is not equal to null / non-existent. In the other words, it tests whether the outcome matches one of the brands of the phone given a line above.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newFunction( ()=>navigator.userAgent.match(/Android|BlackBerry|iPhone|iPad|iPod|Opera Mini|IEMobile/i) )
$    .testNot.is(null)
</code></pre>
---

## `and`

+ Used to connect code of the same part of statement that is to be taken jointly.

+ In the following example function first function tests if "17 or younger" is not selected, and then with the keyword "add" tests if "32 or older" is not selected either.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@.wait( getDropDown("age")
@  .testNot.selected("17 or younger")
$  .and( getDropDown("age").testNot.selected("32 or older") )
</code></pre>

---

## `or`

+ Returns true if and only if one or more of its statements fulfills condition.

+ In the following example function first function tests if "17 or younger" is not selected, and then with the keyword "or" tests if "32 or older" is not selected either. It will result in success if either of those two is not selected.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@.wait( getDropDown("age")
@  .testNot.selected("17 or younger")
$  .or( getDropDown("age").testNot.selected("32 or older") )
</code></pre>

---

## `self`

+ Self is a reference to the called object.

+ In the following example if the video is playing, self keyword will reference to the video to stop, and if the video is not playing, self keyword will reference to the video to play.

<!--more-->


<pre><code class="language-diff-javascript diff-highlight try-true">
@newVideo("video", "short-test.mp4")
@  .disable(0.01)
@  .print()
@,
@newButton("Play/Stop")
@  .print()
@  .callback( getVideo("video").test.playing()
$    .success( self.stop() )
$    .failure( self.play() )  
@  )
</code></pre>
