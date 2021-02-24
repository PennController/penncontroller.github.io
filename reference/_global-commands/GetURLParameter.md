---
title: GetURLParameter
syntax: GetURLParameter()
parameters:
  - name:  parametername 
description: "Retrieves the value of a parameter that was passed after `?` in the URL. This is particularly useful if you pass a uniquely identifying code to the URL when you recruit your participants, like *http://spellout.net/ibexexps/PennController/Demo/experiment.html?**id=abcdefgh***"
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
@newTrial( "my trial" ,
@    newButton("helloworld", "Hello world!")
@        .log()
@        .print()
@        .wait()
@)
$.log( "ID" , GetURLParameter( "id" ) );
</code></pre>

+ Will add a column to each result line logged by *my trial* reporting the value that was passed after `id=` in the URL.		
