---
title: newTrial
syntax: newTrial()
parameters:
  - name:  ... 
description: "The `newTrial` command (formerly `PennController`) creates a new PennController trial. You can use it in three environments: on its own to create a trial (since version 1.0), within `Template` to generate trials from a spreadsheet, or within the definition of the Ibex variable `items` to create single elements (deprecated since PennController 1.0)."
alternates:
  - name: " \"label\" , ... "
notes: true
since: PennController 1.7
---

+ It takes a sequence of commands as its parameter, which will define the trial's script. Optionally, you can also pass a string as the first parameter to give a label to your trial which you can refer to when defining the experiment's sequence order in `Sequence`. If you pass no string for a label, the trial will be labeled *unlabeled*.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
$newTrial(
@    newButton("helloworld", "Hello world!")
@        .print()
@        .wait()
@);
@
@Template( row => 
$    newTrial( row.Type ,
@        newButton("button", row.ButtonText)
@            .print()
@            .wait()
@    )
@);
</code></pre>

+ Creates one trial labeled *unlabeled* with a single button on the screen reading *Hello world!*, and generate one-button trials from a spreadsheet, assigning the text from its *Type* cells as their label and the text from its *ButtonText* cells as the button's text (see `Template`).		
