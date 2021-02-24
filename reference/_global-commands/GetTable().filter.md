---
title: GetTable().filter
syntax: GetTable().filter()
description: "Returns a filtered version of the table, containing only rows whose specified column's value is a match."
notes: true
---

+ If you use a string then the column's value must match the text *exactly*. Alternatively, you can use a regular expression to test the column's value. You can also use a function that will take each row as an argument and should return `true` to keep the row or `false` to exclude it.

+ You can use several `filter`s in chain.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
@Template( 
@    GetTable( "spreadsheet.csv" )
$        .filter( row => row.Item > 0 )      // 'Item' should be greater than 0, and
$        .filter( "ButtonText" , /second/ )  // 'ButtonText' should contain 'second'
@    ,
@    row => newTrial( "button trial" ,
@        newButton("test button", row.ButtonText)
@            .print()
@            .wait()
@    )
@    .log( "Item" , row.Item       )
@    .log( "Text" , row.ButtonText )
@);
</code></pre>

+ Generates only one trial from a subset of the table *spreadsheet.csv*: first we only consider rows where the value in the *Item* column is a number greater than 0 (this is practically ineffective, for both rows in *spreadsheet.csv* already satisfy this condition) and we further consider only rows among those rows where the value of the *ButtonText* column is a text containing the string *second* (only the second row satisfies this condition).		
