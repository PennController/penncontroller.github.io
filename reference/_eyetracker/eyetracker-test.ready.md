---
title: eyetracker.test.ready
command_type: "test"
syntax: .test.ready()
description: "Tests whether the participant has granted webGazer access to their webcam, as required by the EyeTracker."
notes: true
---

+ Use this early in your experiment, and most usefully in the `wait` command of a Button to proceed only after access has been granted.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newButton("Start")
@    .print()
$    .wait( newEyeTracker().test.ready()
$        .failure( newText("Please grant access to your webcam").print() )
@    )
</code></pre>

+ Adds a button onto the page and wait for the participant to click it. The presence of the EyeTracker element inside `wait` also triggers the webcam-access request. The test will only be successful after access has been granted: only then will a click on the button be validated.

+ If the participant clicks the button before granting access to the webcam, they will see a message inviting them to do so.

	
