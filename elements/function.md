---
title: Function
since: beta 0.3
parent: Elements
children_collection: function
thumbnail: function.png
parameters:
  - name: FUNCTION
    description: A JavaScript function.
description: Embeds a JavaScript function.
---

+ Passes a Javascript function to the controller.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newFunction(()=>$(".secret")
@                  .css("background","yellow") )
@                  .call()
</code></pre>

+ This function colors the background of elements with the id "secret" to yellow.


