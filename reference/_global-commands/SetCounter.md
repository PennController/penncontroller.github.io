---
title: SetCounter
syntax: SetCounter()
description: "Creates an item that will set Ibex's internal counter when it is run."
alternates:
  - name: " \"label\" "
  - name: " number "
  - name: " \"label\" , number "
  - name: " \"inc\" , number "
  - name: " \"label\" , \"inc\", number "
notes: true
---

+ Ibex has an internal counter which keeps track of how many people participated in your experiment in order to automatically handle group designs. By default, the counter is incremented at the end of the experiment, which has the undesirable effect of assigning the same group to all the participants who click your link before anyone has completed your experiment. You can choose to run [js]SetCounter("inc", 1)[/js] at the very beginning of your experiment instead.

+ You can pass a label as the first argument, which you can then use in [yadawiki link="PennController.Sequence" show="[js]Sequence[/js]"]: this way you can make it the first item to run and therefore increment the counter at each click---provided you passed `"inc"` too. Note that, in the absence of `"inc"`, if you pass a number then the counter will be *set* to that value.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@AddTable( "myTable" , 
@  "Group,Button\n"+
@  "A,Hello\n"+
@  "B,World"
@);
@
@Sequence("counter", "trial");
@
@SetCounter("counter", "inc", 1);
$
@Template( "myTable" , row => 
@  newTrial( "trial" ,
@    newButton( "greetings" , row.Button )
@        .print()
@        .wait()
@  )
@);
</code></pre>

+ Increments the counter as soon as the experiment starts running. Since we use a table defining two groups (*A* and *B*) the button will read *Hello* or *World* every other time the experiment is run (try running it multiple times *without clicking the button*).		
