---
title: dropdown.add
command_type: "action"
syntax: .add()
parameters:
  - name: "option"
description: "Adds an option, or several options to the drop-down list."
alternates:
  - name: "\"option1\",\"option2\",..."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newDropDown("language" , "First language")
@    .add( "English" , "French" , "Tagalog" )
$    .print()
</code></pre>

+ Creates a drop-down list with default text *First language* and adds three options to it: *English*, *French* and *Tagalog*, then prints the list onto the page.		
