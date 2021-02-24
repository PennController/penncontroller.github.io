---
title: GetTable
syntax: GetTable()
parameters:
  - name:  tablename 
description: "Refers to a table, where `tablename` can be the filename of a CSV file you uploaded to *Resources* (*chunk_includes*) or the name of a table that was created with `AddTable`. "
notes: true
---

+ You would typically use `GetTable` within `Template` when your project contains more than one table and/or when you need to use only a subset of a table, using `GetTable().filter`.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
$Template( GetTable( "spreadsheet.csv" ) , row =>
@    newTrial( "button trial" , 
@        newButton("test button", row.ButtonText)
@            .print()
@            .wait()
@    )
@    .log( "Group" , row.Item )
@    .log( "Text"  , row.ButtonText )
@);
</code></pre>

+ Generate two trials from the table *spreadsheet.csv* which contains two rows and the columns *Item* and *ButtonText*.		
