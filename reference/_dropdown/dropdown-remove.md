---
title: dropdown.remove
command_type: "action"
syntax: .remove()
parameters:
  - name: "option"
description: "Removes a single option from the list. Nothing happens if the option passed as an argument is in fact not in the list."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newDropDown("value" , "Truth value")
@    .add( "True" , "False" )
@    .print()
@,
@newScale("logic",  "Binary","Three-valued")
@    .default("Binary")
@    .before( newText("Logic: ") )
@    .labelsPosition("right")
@    .callback(
@        getScale("logic")
@            .test.selected("Three-valued")
@            .success( 
@                getDropDown("value")
@                    .add("Other") 
@            )
@            .failure( 
@                getDropDown("value")
$                    .remove("Other") 
@            )
@    )
@    .print()
</code></pre>

+ Creates a drop-down list with two options, *True* and *False*, and prints it onto the page. Then creates a Scale element with two options, *Binary* and *Three-value*, the former being selected by default, preceded with the text *Logic:*. Whenever a value gets selected on the Scale, a test checks whether the selected value corresponds to *Three-valued* and, if so, it adds the option *Other* to the drop-down list, or removes it from the list otherwise.		
