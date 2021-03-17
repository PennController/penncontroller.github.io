---
title: Template
syntax: Template()
parameters:
  - name:  row => newTrial() 
description: "Generates trials from a table. See this page to learn how to use it. You can have as many `Template` as you want (which is helpful if you use different trial templates)."
alternates:
  - name: " row => [\"controllername\", options, \"controllername\", options, ...] "
  - name: " row => [\"label\", \"controllername\", options, \"controllername\", options, ...] "
  - name: " table, row => ... "
notes: true
---

+ You can pass the name of the table you want to use as a string, or use `GetTable`. If you do not explicitly specify a table, `Template` will use the table whose name comes first in the alpha-numerical order (if any---if you added only one table, it will automatically use that table).

+ The argument of `Template` is a function: you can use arrow functions, as illustrated in this documentation, or old-style functions: [js]Template( function (row) { return newTrial( ... ); } )[/js].

+ The variable (named `row` here, but you could also name it `item`, or however pleases you) is iteratively fed with the content of each row of the table (modulo filtering, see `GetTable().filter`). You retrieve the value of a given column with `row.columnName` or `row["columnName"]` (use the latter if you column's name contains special characters, like spaces, commas, periods or dashes).

+ The argument function can directly return `newTrial()`, defining a PennController template for the trials to be generated. It can also return an array of Ibex item-elements: in that case, it should follow the same format as the definition of a standard Ibex item (though the label string is optional) (see Ibex's documentation manual).

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@AddTable( "mytable" ,
@    "Type,Sentence,TargetPicture,CompetitorPicture\n"+
@    "Test,This is a square,square.png,triangle.png\n"+
@    "Filler,This is a triangle,triangle.png,pear.png"
@);
@
$Template( "mytable" , row => 
$   newTrial( row.Type ,
@        newText("sentence", row.Sentence)
@            .print()
@        ,
@        newSelector("choice")
@        ,
@        defaultImage
@            .size(200,200)
@            .selector("choice")
@        ,
@        newCanvas( "images", 500, 200 )
@            .add(   0, 0, newImage("target", row.TargetPicture)     ) 
@            .add( 300, 0, newImage("target", row.CompetitorPicture) ) 
@            .print()
@        ,
@        getSelector("choice")
@            .shuffle()
@            .wait()
@    )
@);
</code></pre>

+ Generates trials labeled according to the *Type* column of the table, showing a sentence whose text is retrieved from the *Sentence* column of the table, and two pictures side by side retrieved from the *TargetPicture* and *CompetitorPicture* columns.

<pre><code class="language-diff-javascript diff-highlight try-data">
@AddTable( "mytable" ,
@    "Type,Sentence\n"+
@    "Filler,The cat that is chasing the mouse runs fast\n"+
@    "Test,The mouse that the cat is chasing runs fast"
@);
@
@Template( "mytable" , row => 
@    [
@        "DashedSentence", {s: row.Sentence},
$        "PennController", newTrial(
$            newText("question", "How natural did you find this sentence?")
@                .print()
@            ,
@            newScale("natural", 7)
@                .before( newText("left", "Completely unnatural") )
@                .after( newText("right", "Completely natural") )
@                .print()
@                .wait()
@        )
@    ]
@);
</code></pre>

+ Generates two-screen trials, the first screen using the native Ibex *DashedSentence* with the value from the *Sentence* column passed as its *s* parameter, the second screen using PennController to show a naturalness scale.		
