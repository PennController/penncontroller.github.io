---
title: 8. Creating a trial template
nav_order: 1
start_heading: 8
blurb: How to use tables of experimental items.
previous_page: Advanced Tutorial
---

Trial templates are an efficient way of creating experimental trials.
{: .h1-blurb }

---

## The AdvancedTutorial experiment

In the [**Basic Tutorial**]({{site.baseurl}}/basic-tutorial), we created a
simple picture matching experiment with a single trial. In the
**Advanced Tutorial**, we'll (sort of) add a research question:

> What is the time course of interpreting English agreement morphology,
> in particular the third person singular inflectional morpheme *-s*?

Ultimately, this question is beyond the scope of this tutorial, but we can use
it as a starting point.

We'll use nouns that have identical singular and plural forms to create sentences
that disambiguate only at the verb, such as "*The fish swims...*" vs
"*The fish swim...*". Participants will hear an initially ambiguous sentence, and
must choose as quickly as possible between an image with one animal and an image
with two animals.

### Experimental design

We'll use a **within-item, within-participant** design with
**2 conditions**:

+ 2 conditions: singular verb inflection and plural verb inflection
+ Within-item: across participants, each item occurs in both conditions
+ Within-participant: every participant sees items from both conditions

### Experimental items

In this example experiment we'll use 4 experimental items and no fillers. The
within-item, within-participant design results in 2 lists of items:

| group | item | sentence                                         | inflection |
|-------|------|--------------------------------------------------|------------|
| A     | 1    | The fish swim in a tank which is perfectly round | plural     |
| A     | 2    | The deer runs in a wood which is extremely dense | singular   |
| A     | 3    | The sheep roam in a pen which is strikingly blue | plural     |
| A     | 4    | The moose walks in a park which is visibly new   | singular   |

| group | item | sentence                                           | inflection |
|-------|------|----------------------------------------------------|------------|
| B     | 1    | The fish swims in a tank which is perfectly square | singular   |
| B     | 2    | The deer run in a wood which is extremely sparse   | plural     |
| B     | 3    | The sheep roams in a pen which is strikingly red   | singular   |
| B     | 4    | The moose walk in a park which is visibly old      | plural     |

<div class="flex-row-wrap mb-4">
  <div class="centered-eighth">
    <img src="{{site.baseurl}}/assets/tutorials/1fishSquareTank.png" alt="1fishSquareTank">
  </div>
  <div class="centered-eighth">
    <img src="{{site.baseurl}}/assets/tutorials/2fishRoundTank.png" alt="2fishRoundTank">
  </div>
  <div class="centered-eighth">
    <img src="{{site.baseurl}}/assets/tutorials/1deerDenseWood.png" alt="1deerDenseWood">
  </div>
  <div class="centered-eighth">
    <img src="{{site.baseurl}}/assets/tutorials/2deerSparseWood.png" alt="2deerSparseWood">
  </div>
  <div class="centered-eighth">
    <img src="{{site.baseurl}}/assets/tutorials/1sheepRedPen.png" alt="1sheepRedPen">
  </div>
  <div class="centered-eighth">
    <img src="{{site.baseurl}}/assets/tutorials/2sheepBluePen.png" alt="2sheepBluePen">
  </div>
  <div class="centered-eighth">
    <img src="{{site.baseurl}}/assets/tutorials/1mooseNewPark.png" alt="1mooseNewPark">
  </div>
  <div class="centered-eighth">
    <img src="{{site.baseurl}}/assets/tutorials/2mooseOldPark.png" alt="2mooseOldPark">
  </div>
</div>

---

## Trial templates

Each iteration of the **AdvancedTutorial** experiment has four items and thus
four experimental trials.

We could copy-and-paste the `"experimental-trial"` trial code multiple times
and change variable names as necessary, but this method is not recommended
for several reasons:

+ Prone to copy-and-paste errors, like forgetting to change a source file name.
+ Difficult to make changes to general trial structure, because each
copy-and-pasted trial must be updated individually.
+ Greatly increases overall length of experiment script.

Instead, we'll use the global command
[`Template`]({{site.baseurl}}/global-commands/template)
to define a trial template.

A trial template is a template for creating trials: it's a trial that's partially
complete, with some values (represented by variables) to be added in "later".
During script evaluation, PennController fills in the variables with values from
a specified table.

Tables are CSV (comma separated value) files that are either imported into an
experiment page's **Resources** folder, or defined within an experiment script.

### Using a table

We'll use the `items.csv` table, which was included during the
[set up]({{site.baseurl}}/basic-tutorial/1_first-step#setting-up-the-basictutorial-experiment)
of the **BasicTutorial** experiment.

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

If a table contains a column named `group` or `row`, PennController will automatically
alternate which group of items is run! In this case, there are two groups, so every
odd-numbered participant will only see the 4 items from the `A` group, and every
even-numbered participant will only see the 4 items from the `B` group (or vice versa).

### Creating a trial template

A trial template is basically a regular trial surrounded by `Template()`:

<pre><code class="language-diff-javascript diff-highlight">
+Template(<var>TABLE_NAME</var>, <var>row</var> =>
@    newTrial("TRIAL_LABEL",
!        newX("ELEMENT_1", row.<var>COLUMN_NAME</var>)
@            .COMMAND_1()
@    )
+)
</code></pre>

+ <code><var>TABLE_NAME</var></code> is the name of a table.
+ <code><var>row</var></code> is an array variable.
  + In the first iteration of an experiment, `row` contains the values of the
  table's first row. In the second iteration, `row` contains the values of the
  table's second row, and so on.

Within the trial, turn values into variables by replacing the specified value
with <code>row.<var>COLUMN_NAME</var></code>, where <code><var>COLUMN_NAME</var></code>
is the name of a column in the specified table.

{% capture instructions %}
1. Comment out the `DebugOff` command to re-enable the debugger.
2. Turn the `"experimental-trial"` trial into a trial template.

<pre><code class="language-diff-javascript diff-highlight">
// Type code below this line.

// Remove command prefix
PennController.ResetPrefix(null)

// Turn off debugger
!// DebugOff()
@//
@// Instructions
@// code omitted in interest of space
@
@// Experimental trial
+Template("items.csv", row =>
@    newTrial("experimental-trial",
!        newAudio("audio", row.audio)
@            .play()
@        ,
!        newText("sentence", row.sentence)
@            .center()
!            .unfold(row.duration)
@        ,
!        newImage("plural", row.plural_image)
@            .size(200, 200)
@        ,
!        newImage("singular", row.singular_image)
@            .size(200, 200)
@        ,
@        newCanvas("side-by-side", 450,200)
@            .add(  0, 0, getImage("plural"))
@            .add(250, 0, getImage("singular"))
@            .center()
@            .print()
@            .log()
@        ,
@        newKey("keypress", "FJ")
@            .log()
@            .wait()
@        ,
@        getAudio("audio")
@            .wait("first")
@    )
+)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

---

## Logging trial details

When we examine the results in
[12. Examining data]({{site.baseurl}}/advanced-tutorial/12_examining-data),
it'll be critical to know which group was run for which iteration, which lines
in the results file belong to which items, and which verbal inflection condition
each item had.

We'll use the `log` method to add columns to an experiment's results file. The `log`
method is conceptually very similar to the `log` command, but differs in scope
and result:

+ The `log` command is called on an element, and logs information as a row in
the results file.
+ The `log` method is called on a trial, and logs informationas a column in the
results file.

The <code>log(<var>NAME</var>, <var>VALUE</var>)</code> method has two parameters:

+ <code><var>NAME</var></code>: the name of the column added to the results file
+ <code><var>VALUE</var></code>: the value added to each row of the results file,
in the column indicated by <code><var>NAME</var></code>

{% capture instructions %}
Use the `log` method to log information about

1. The group
2. The item number
3. The verbal inflection condition

<pre><code class="language-diff-javascript diff-highlight">
@// code omitted in interest of space
@
@// Experimental trial
@Template("items.csv", row =>
@    newTrial("experimental-trial",
@        newAudio("audio", row.audio)
@            .play()
@        ,
@        newText("sentence", row.sentence)
@            .center()
@            .unfold(row.duration)
@        ,
@        newImage("plural", row.plural_image)
@            .size(200, 200)
@        ,
@        newImage("singular", row.singular_image)
@            .size(200, 200)
@        ,
@        newCanvas("side-by-side", 450,200)
@            .add(  0, 0, getImage("plural"))
@            .add(250, 0, getImage("singular"))
@            .center()
@            .print()
@            .log()
@        ,
@        newKey("keypress", "FJ")
@            .log()
@            .wait()
@        ,
@        getAudio("audio")
@            .wait("first")
@    )
+    .log("group", row.group)
+    .log("item", row.item)
+    .log("condition", row.inflection)
@)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

If you run the experiment and open the `results` file, it should look like the following:

{% capture content %}
The sections that log information about the `"instructions"` and `"experimental-trial"`
trials have a different number of columns:

+ The `"instructions"` trial section has the 13 default columns.
+ The `"experimental-trial"` trial section has the default columns, as well as the
`group`, `item`, and `condition` columns.

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
{% endcapture %}
{% include collapsible-block.html content=content summary="click to expand" inner-border=true %}
