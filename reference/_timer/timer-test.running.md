---
title: timer.test.running
command_type: "test"
syntax: .test.running()
description: "Tests whether the timer is currently running."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@
@newTooltip("not running", "The timer is not running")
@,
@newText("on", "[on]")
@    .before( newText("off", "[off]") )
@    .print()
@,
@newSelector("switch")
@    .add( getText("on") , getText("off") )
@,
@newTimer("quick", 500)
@    .callback( getSelector("switch").select(getText("off")) )
@,
@getSelector("switch")
@    .callback(
@        getSelector("switch").test.selected( getText("on") )
@            .success( getTimer("quick").start() )
@    )
@,
@newButton("target", "Click here within 500ms of start")
@    .print()
@    .wait(
$        getTimer("quick")
$            .test.running()
$            .failure( getTooltip("not running").print("target") )
@    )
</code></pre>

+ Shows *off* and *on* on a single line above a button reading *Click here within 500ms of start*. When *on* is clicked, the 500ms timer starts. If the button is clicked within 500ms, then the `running` test is successful and the click is validated. If the *target* button is clicked before the timer has started (i.e. before *on* was clicked) or after the timer has ended, the `running` test fails and the `wait` command does not release the execution of the script: the click is not validated and a new attempt at a *on-target* click sequence within 500ms is necessary.		
