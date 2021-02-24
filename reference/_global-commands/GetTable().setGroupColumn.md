---
title: GetTable().setGroupColumn
syntax: GetTable().setGroupColumn()
description: "Tells which column in the table assigns each row to a given group of participants, i.e. which subset of rows PennController will keep for each group of participants listed in the column."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
@SetCounter();
@
@AddTable( "test_table" , 
@    "Spelling,Text\n"+
@    "Normal,Hello\n"+
@    "Reversed,olleH\n"+
@    "Normal,World\n"+
@    "Reversed,dlroW"
@);
@
@Template( 
@    GetTable( "test_table" ) 
$            .setGroupColumn( "Spelling" )
@    ,
@    row => newTrial( "button trial" ,
@        newButton("the button", row.Text )
@            .print()
@            .wait()
@    )
@    .log( "Group" , row.Spelling )
@    .log( "Text"  , row.Text     )
@);
</code></pre>

+ Creates a 2x4 table called *test_table* with column names *Spelling* and *Text* (manual creation for purpose of illustration---you would normally upload a CSV file to *chunk_includes*). Uses the column *Spelling* from this table to identify which rows go with which groups of participants.

+ Every other time the experiment is run, participants will see trials generated either from the two rows where *Spelling* is *Normal* or from the two rows where *Spelling* is *Reversed*.

+ The very first line runs a trial incrementing Ibex's internal counter at the beginning of the experiment, which determines which group is run, so you can cycle through the rows if you re-run the experiment.		
