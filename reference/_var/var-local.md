---
title: var.local
command_type: "action"
syntax: .local()
description: "Makes the Var element accessible only from the script of the current PennController instance (default setting). If a Var element with the same named was made global before (using `.global()`---see above) then the Var element reverts to being local (*while keeping its current value*), meaning that any further Var element with the same name will *no longer* share the value of the preceding same-named Var elements."
notes: true
---

+ Local Var elements you define in the Header or in the Footer are local to each PennController trial: changing their value in one trial will *not* affect their value in subsequent trials.

+ The example below is complex, because you normally would not need to use the `local` settings command. We are considering a situation where we want to make the Var element global *only temporarily*.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
@
@PennController.Header(
@    newVar("StartTime", 0)
@        .test.is( 0 )       // Won't be 0 if set as global
@        .success(           // 0 means local: set time
@            getVar("StartTime")
@                .set( v=>Date.now() )
@        )
@);
@
@PennController.Footer(
@    newVar("TimeDifference")
@        .set( getVar("StartTime") )
@        .set( v=>Date.now()-v )
@    ,
@    newText("elapsed")
@        .text( getVar("TimeDifference") )
@        .before( newText("labelElapsed", "Time elapsed (in ms):&nbsp;") )
@        .print()
@    ,
@    newButton("validate", "Continue")
@        .print()
@        .wait()
@);
@
@
@PennController( "label" ,
@    getVar("StartTime")
@        .global()  // Make global on 1st trial
@    ,
@    newButton("getTimeDiff", "How many ms since display?")
@        .print()
@        .wait()
@);
@
@PennController( "label" ,
@    getVar("StartTime")
$        .local()  // Make local again on 2nd trial
@    ,
@    newButton("getTimeDiff", "How many ms since PREVIOUS display?")
@        .print()
@        .wait()
@);
@
@PennController( "label" , // Var is local: 0 => set time (header)
@    newButton("getTimeDiff", "How many ms since NEW display?")
@        .print()
@        .wait()
@);
</code></pre>

+ The *Header* creates a new Var element named *StartTime* initially set to 0, if no Var element named *StartTime* was previously made global. When the first of the three *label* trials is run, there is no global *StartTime* yet, and the test from the Header is successful: *StartTime* is set to the current timestamp. The script for the first *label* trial is then executed: *StartTime* is made global, and a button is added to the page. When the button is clicked, the *Footer* creates a new Var element named *TimeDifference* which is first set to the value of *StartTime* and then set to the current timestamp subtracted of *StartTime*. The result is displayed in a new Text element and a button to be clicked for proceeding is added to the page.

+ When the second *label* trial is run, the *StartTime* element is global, so its value remains unchanged from the previous trial: the Header practically has no effect. Then the script of the second trial is executed and *StartTime* is made local again (keeping its current value for the remaining of the trial though). At the end of the trial, since *StartTime* still has the value set on the first trial, the reported time difference corresponds to how many milliseconds elapsed since the display of the first trial.

+ When the third *label* trial is run, the Header creates a *new* Var element named *StartTime*, initially set to 0: indeed, trial #2 made *StartTime* local again, and so when the `newVar` command from the Header is executed on trial #3, it 'sees' no existing Var element named *StartTime*. The test is therefore successful and *StartTime* is set to the current timestamp. The rest of the trial proceeds as in trial #1.		
