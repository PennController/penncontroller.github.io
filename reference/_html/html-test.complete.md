---
title: html.test.complete
command_type: "test"
syntax: .test.complete()
description: "Tests whether all the obligatory fields form the HTML document have been filled. See the IBEX documentation about the Form controller for a discussion of how fields are set as obligatory."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newHtml("demographics", "example_intro.html")
@    .print()
@,
@newButton("continue", "Continue to the next page")
@    .print()
@    .wait(
$        getHtml("demographics").test.complete()
$            .failure( getHtml("demographics").warn() )
@    )
</code></pre>

+ Prints the content of *example*intro.html_ onto the page and adds a *Continue* button below it. The button is validated only when all the obligatory fields from *example*intro.html_ have been filled.

+ If the button is clicked and at least one obligatory field has not been filled, the `warn` command is executed and will display an appropriate error message.		
