---
title: html.checkboxWarning
command_type: "action"
syntax: .checkboxWarning()
parameters:
  - name:  message 
description: "Defines the error message that gets displayed if an obligatory checkbox is not checked when calling `warn`. If you use `%name%` in the string it will be replaced with the element's name."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newHtml("intro", "example_intro.html")
$    .checkboxWarning("It is highly recommended that you check the '%name%' box before continuing")
@    .radioWarning("Please consider selecting an option for '%name%'")
@    .inputWarning("We would like you to type some text in these fields")
@    .print()
@,
@newButton("I have completed the form")
@    .print()
@    .wait()
@    .remove()
@,
@getHtml("intro")
@    .warn()
@,
@newButton("Continue")
@    .print()
@    .wait()
</code></pre>

+ Will print the custom warning messages on any missing obligatory field after clicking "I have completed the form."		
