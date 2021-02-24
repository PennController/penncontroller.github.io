---
title: dropdown.once
command_type: "action"
syntax: .once()
description: "Will disable the DropDown element after selection occurs."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newText("I saw Erika talk to Nate.")
@    .after( newDropDown("").add("He","She").once() )
$    .after( newText("seemed anxious.") )
@    .print()
</code></pre>

+ Prints *I saw Erika talk to Nate. ___ seemed nervous* onto the page, where *___* is a drop-down list containing the options *He* and *She*. The command `.once` makes the selection of *He* or *She* definitive.		
