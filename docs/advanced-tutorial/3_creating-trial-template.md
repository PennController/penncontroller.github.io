---
layout: default
title: Creating a trial template
parent: Advanced Tutorial
nav_order: 3
---
## {{ page.title }}

The **AdvancedTutorial** experiment has four items and thus four trials. We could copy-and-paste the `"experimental-trial"` trial code multiple times and change variable names as necessary, but this method is not recommended for several reasons:

+ Prone to copy-and-paste errors, like forgetting to change a source file name.
+ Difficult to make changes to general trial structure, because each copy-and-pasted trial must be updated individually.
+ Greatly increases overall length of experiment script.

Instead, use the global command [`Template`]({{site.baseurl}}/docs/global-commands/template){:target="_blank"} to define a trial template. 

A trial template uses values from a table to "fill in" placeholders and create trials. Tables are CSV (comma separated value) files imported into an experiment page's **Resources** folder, or defined within an experiment script (see the global command [`AddTable`]({{site.baseurl}}/docs/global-commands/addtable){:target="_blank"}). 

The `Template` global command has the following syntax:
```javascript
PennController.ResetPrefix(null)

Template("TABLE_NAME", row => 
    newTrial("TRIAL_LABEL",
        newX("ELEMENT_1", row.COLUMN_NAME)
            .COMMAND_1()
    )
)
```

+ `"TABLE_NAME"` is the name of a table.
  + If no table is specified, PennController defaults to the table whose name comes first in alphanumeric order.  
  + If there are no tables, the `Template` is skipped during experiment script execution. If the debugger is on, it will display an error message.
+ `row` is an array that contains the values of a table row. 
  + PennController creates trials iteratively. In the first iteration, `row` contains the values of the first table row. In the second iteration, `row` contains the values of the second table row, and so on.
  + This tutorial uses `row` as the array name, but you can use the name of your choice for the array.
+ `COLUMN_NAME` is the name of a table column. 
  + `row.COLUMN_NAME` is a placeholder for the value in the specified column, for a given iteration/row.
  + Use `row["COLUMN_NAME"]` instead of `row.COLUMN_NAME` if the column name contains special characters like spaces, commas, periods, or dashes.

### Using a table

We imported various resource files in the [Setting up](#setting-up) section, including the `items.csv` table:

*Note: You may need to scroll to the right to see all the columns.*

| group | item | sentence                                           | inflection | audio               | duration | singular_image      | plural_image        |
|-------|------|----------------------------------------------------|------------|---------------------|----------|---------------------|---------------------|
| A     | 1    | The fish swim in a tank which is perfectly round   | plural     | 2fishRoundTank.mp3  | 2676     | 1fishSquareTank.png | 2fishRoundTank.png  |
| A     | 2    | The deer runs in a wood which is extremely dense   | singular   | 1deerDenseWood.mp3  | 2650     | 1deerDenseWood.png  | 2deerSparseWood.png |
| A     | 3    | The sheep roam in a pen which is strikingly blue   | plural     | 2sheepBluePen.mp3   | 2598     | 1sheepRedPen.png    | 2sheepBluePen.png   |
| A     | 4    | The moose walks in a park which is visibly new     | singular   | 1mooseNewPark.mp3   | 2546     | 1mooseNewPark.png   | 2mooseOldPark.png   |
| B     | 1    | The fish swims in a tank which is perfectly square | singular   | 1fishSquareTank.mp3 | 2833     | 1fishSquareTank.png | 2fishRoundTank.png  |
| B     | 2    | The deer run in a wood which is extremely sparse   | plural     | 2deerSparseWood.mp3 | 2650     | 1deerDenseWood.png  | 2deerSparseWood.png |
| B     | 3    | The sheep roams in a pen which is strikingly red   | singular   | 1sheepRedPen.mp3    | 2755     | 1sheepRedPen.png    | 2sheepBluePen.png   |
| B     | 4    | The moose walk in a park which is visibly old      | plural     | 2mooseOldPark.mp3   | 2441     | 1mooseNewPark.png   | 2mooseOldPark.png   |

PennController automatically detects if there's a column named `group` or `list` (case-insensitive) when reading in a table. If such a column exists, PennController uses its values to subset the table rows into groups. If no such column exists, all of the table rows form a single group. 

PennController's internal counter determines which group is run, and by default the counter increases by one at the end of an experiment. The **AdvancedTutorial** experiment has two groups, meaning that the `A` and `B` groups are run in alternating order.

Although the `items.csv` table has eight rows (excluding the header), a participant sees only four trials, generated from either the `A` group or `B` group.

{% capture instructions %}
Create a trial template using the `items.csv` table:

<pre><code class="language-diff-javascript diff-highlight"> 
*// code omitted in interest of space
*
*// Experimental trial
+Template("items.csv", row => 
!    newTrial("experimental-trial",
!        newAudio("audio", row.audio)
!            .play()
!        ,
!        newText("sentence", row.sentence)
!            .center()
!            .unfold(row.duration)
!        ,
!        newImage("plural", row.plural_image)
!            .size(200, 200)
!        ,
!        newImage("singular", row.singular_image)
!            .size(200, 200)
!        ,
!        newCanvas("side-by-side", 450,200)
!            .add(  0, 0, getImage("plural"))
!            .add(250, 0, getImage("singular"))
!            .center()
!            .print()
!            .log()
!        ,
!        newKey("keypress", "FJ")
!            .log()
!            .wait()
!        ,
!        getAudio("audio")
!            .wait("first)
!    )
+)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

In the [**Basic Tutorial**]({{site.baseurl}}/docs/basic-tutorial), we recommended placing the instructions in a [separate `"instructions"` trial]({{site.baseurl}}/docs/basic-tutorial/#adding-instructions). If we had placed the instructions within the `"experimental-trial"` trial, then after creating the trial template, the instructions would have been printed four times, once at the start of each trial. 

### Logging trial details

When we [examine the collected data](#examining-data), it will be important to know which group was run, which lines in the `results` file belong to which items, and which verbal inflection condition each item had.

Use the `log("COLUMN_NAME", VALUE)` method to add a column to an experiment's `results` file. The column is only added to rows that log information about the trial that the `log` method is called on.
+ `"COLUMN_NAME"` is the name of the column that will be added to the `results` file.
+ `VALUE` is the value that will be added to each row of the `results` file, in the column created by `"COLUMN_NAME"`.

The [`log` method]({{site.baseurl}}/docs/global-commands/newtrial#methods){:target="_blank"} and the [`log` command]({{site.baseurl}}/docs/basic-tutorial/#logging-data) are similar, but differ in important ways:
+ The `log` method adds columns, the `log` command adds rows.
+ The `log` method is called on a trial, the `log` command is called on an element.

{% capture instructions %}
Use the [`log` method]({{site.baseurl}}/docs/global-commands/newtrial#methods){:target="_blank"} on the `"experimental-item"` trial to record the group, item number, and verbal inflection condition.

<pre><code class="language-diff-javascript diff-highlight"> 
*// code omitted in interest of space
*
*// Experimental trial
*Template("items.csv", row => 
*    newTrial("experimental-trial",
*        newAudio("audio", row.audio)
*            .play()
*        ,
*        newText("sentence", row.sentence)
*            .center()
*            .unfold(row.duration)
*        ,
*        newImage("plural", row.plural_image)
*            .size(200, 200)
*        ,
*        newImage("singular", row.singular_image)
*            .size(200, 200)
*        ,
*        newCanvas("side-by-side", 450,200)
*            .add(  0, 0, getImage("plural"))
*            .add(250, 0, getImage("singular"))
*            .center()
*            .print()
*            .log()
*        ,
*        newKey("keypress", "FJ")
*            .log()
*            .wait()
*        ,
*        getAudio("audio")
*            .wait("first")
*    )
+    .log("group", row.group)
+    .log("item", row.item)
+    .log("condition", row.inflection)
*)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

If you run the experiment and open the `results` file, it should look like the following:

{% capture content %}
*Note: You may need to scroll to the right to see all the columns.*

<pre><code class="language-none" style="white-space:pre;">
# Columns below this comment are as follows:
# 1. Time results were received.
# 2. MD5 hash of participant's IP address.
# 3. Controller name.
# 4. Item number.
# 5. Element number.
# 6. Type.
# 7. Group.
# 8. PennElementType.
# 9. PennElementName.
# 10. Parameter.
# 11. Value.
# 12. EventTime.
# 13. Comments.
1602519682,SOME_MD5_HASH,PennController,0,0,instructions,NULL,PennController,0,_Trial_,Start,1602519650762,NULL
1602519682,SOME_MD5_HASH,PennController,0,0,instructions,NULL,PennController,0,_Trial_,End,1602519652353,NULL
# Columns below this comment are as follows:
# 1. Time results were received.
# 2. MD5 hash of participant's IP address.
# 3. Controller name.
# 4. Item number.
# 5. Element number.
# 6. Type.
# 7. Group.
# 8. PennElementType.
# 9. PennElementName.
# 10. Parameter.
# 11. Value.
# 12. EventTime.
# 13. group.
# 14. item.
# 15. condition.
# 16. Comments.
1602519682,SOME_MD5_HASH,PennController,1,0,experimental-trial,NULL,PennController,1,_Trial_,Start,1602519652358,B,1,singular,NULL
1602519682,SOME_MD5_HASH,PennController,1,0,experimental-trial,NULL,Key,keypress,PressedKey,J,1602519654681,B,1,singular,Wait success
1602519682,SOME_MD5_HASH,PennController,1,0,experimental-trial,NULL,PennController,1,_Trial_,End,1602519655240,B,1,singular,NULL
1602519682,SOME_MD5_HASH,PennController,2,0,experimental-trial,NULL,PennController,2,_Trial_,Start,1602519655245,B,2,plural,NULL
1602519682,SOME_MD5_HASH,PennController,2,0,experimental-trial,NULL,Key,keypress,PressedKey,F,1602519657560,B,2,plural,Wait success
1602519682,SOME_MD5_HASH,PennController,2,0,experimental-trial,NULL,PennController,2,_Trial_,End,1602519657956,B,2,plural,NULL
1602519682,SOME_MD5_HASH,PennController,3,0,experimental-trial,NULL,PennController,3,_Trial_,Start,1602519657961,B,3,singular,NULL
1602519682,SOME_MD5_HASH,PennController,3,0,experimental-trial,NULL,Key,keypress,PressedKey,J,1602519659832,B,3,singular,Wait success
1602519682,SOME_MD5_HASH,PennController,3,0,experimental-trial,NULL,PennController,3,_Trial_,End,1602519660742,B,3,singular,NULL
1602519682,SOME_MD5_HASH,PennController,4,0,experimental-trial,NULL,PennController,4,_Trial_,Start,1602519660744,B,4,plural,NULL
1602519682,SOME_MD5_HASH,PennController,4,0,experimental-trial,NULL,Key,keypress,PressedKey,F,1602519662437,B,4,plural,Wait success
1602519682,SOME_MD5_HASH,PennController,4,0,experimental-trial,NULL,PennController,4,_Trial_,End,1602519663248,B,4,plural,NULL
</code></pre>

The sections that log information about the `"instructions"` and `"experimental-trial"` trial objects contain a different number of columns:
+ The `"instructions"` trial section contains only the 13 default columns.
+ The `"experimental-trial"` trial section contains the default columns, as well as the `group`, `item`, and `condition` columns added by the `log` method.

{% endcapture %}
{% include collapsible-block.html content=content summary="click to expand" inner-border=true %}

