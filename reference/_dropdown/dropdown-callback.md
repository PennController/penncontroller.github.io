---
title: dropdown.callback
command_type: "action"
syntax: .callback()
parameters:
  - name:  command 
description: "Will execute the command(s) whenever an option is selected from the drop-down list."
alternates:
  - name: " command1, command2 "
since: PennController 1.5
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("The weather is")
@    .after( newDropDown("temp","...").add("cold","warm","hot") )
@    .after( newText("implicature", "implies that the weather is ...") )
@    .print()
@,
@getDropDown("temp")
@$   .callback(
$        getDropDown("temp")
$            .test.selected("warm").success( 
$                getText("implicature").text("implicates that the weather is not hot") 
$            )
$            .test.selected("hot").success( 
$                getText("implicature").text("implies that the weather is not cold") 
$            )
$            .test.selected("cold").success( 
$                getText("implicature").text("implies that the weather is not even warm") 
$            )
@    )
</code></pre>

+ Prints *The weather is ... implies that the weather is ...* onto the page, where the first occurrence of *...* is a drop-down list containing the options *cold*, *warm* and *hot*. Upon selection of the option, the continuation will be modified accordingly to the selected option.		
