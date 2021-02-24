---
title: AddTable
syntax: AddTable()
parameters:
  - name:  name
  - name:  csv_string 
description: "You can use this command to manually define a table to use with `Template`. You normally do not need to use this command since, as of PennController beta 0.4, you can directly upload your CSV file under *Resources* / *chunk_includes*."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
$AddTable( "myTable",  // Name of the table
$    "Type,Sentence\n"+           // Column names (mind the \n)
$    "practice,Hello world!\n"+   // First row (mind the \n)
$    "test,Bye world!"            // Second row
$);
@
@Template( "myTable" , row => 
@    newTrial(
@        newText("type", row.Type)
@            .print()
@        ,
@        newButton("sentence", row.Sentence)
@            .print()
@            .wait()
@    )
@);
</code></pre>

+ 		
