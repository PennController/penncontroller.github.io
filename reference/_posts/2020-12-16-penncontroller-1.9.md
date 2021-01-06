---
layout: post
title: PennController 1.9
author: Jeremy
tags: [versions]
---

[PennController 1.9](https://github.com/PennController/penncontroller/tree/master/releases/1.9){:target="_blank"} is now available!

Newly created experiments on the PCIbex Farm come with it, and you can sync your existing projects with the [master branch](https://github.com/PennController/Sync){:target="_blank"} to update your version of PennController.

## Major changes from 1.8

General:

+ Most elements are now displayed as [flex](https://www.w3schools.com/css/css3_flexbox.asp){:target="_blank"} rather than [(inline-)block](https://www.w3schools.com/css/css_inline-block.asp){:target="_blank"} by default.
+ It is now possible to send your results in multiple steps during your experiment by using [`SendResults`]({{site.baseurl}}/commands/global-commands/sendresults){:target="_blank"} multiple times): the results file will treat each request as if it were coming from a new participant, but it will only contain results for the trials that were not saved so far

New commands

+ Added a [`self` keyword]({{site.baseurl}}/commands/keywords#self) that can be used inside callback and test commands.
+ Added a new standard command [`scaling`]({{site.baseurl}}/commands/standard-element-commands/standard-scaling){:target="_blank"} that zooms an element in/out to fit the argument(s), which can be: a ratio (with 1 for 100%), a unit dimension (eg. “10vw”), or the page/screen (pass `"page"`)
+ The `canvas.color` command now changes the background color of the [`Canvas` element]({{site.baseurl}}/elements/canvas){:target="_blank"}.
+ Added the command [`scale.checkbox`]({{site.baseurl}}/elements/scale/scale-checkbox){:target="_blank"}, which presents checkbox options, to the [`Scale` element]({{site.baseurl}}/elements/scale){:target="_blank"}.
+ Added the [`timer.pause`]({{site.baseurl}}/elements/timer/timer-pause){:target="_blank"}, [`timer.resume`]({{site.baseurl}}/elements/timer/timer-resume){:target="_blank"} and [`timer.set`]({{site.baseurl}}/elements/timer/timer-set){:target="_blank"} commands to the [`Timer` element]({{site.baseurl}}/elements/timer){:target="_blank"}.
+ Added the MouseTracker test command `mousetracker.test.over` which succeeds when the mouse is over the element passed as an argument
+ Added the EyeTracker test command `eyetracker.test.score` which succeeds when the tracker was calibrated with a score at least as high as the one passed as an argument (you can also pass a function that takes the score as its argument)

Modified commands

+ The [`left`]({{site.baseurl}}/commands/standard-element-commands/standard-left){:target="_blank"}, [`center`]({{site.baseurl}}/commands/standard-element-commands/standard-center){:target="_blank"} and [`right`]({{site.baseurl}}/commands/standard-element-commands/standard-center){:target="_blank"} commands now align the whole element, instead of just the text.
+ The [`print`]({{site.baseurl}}/commands/standard-element-commands/standard-print){:target="_blank"} command now accepts an element as its single argument and will append to it the current element.
+ The [`fullscreen`]({{site.baseurl}}/commands/special-commands/fullscreen){:target="_blank"} command no longer makes Safari crash.
+ The [`audio.stop`]({{site.baseurl}}/elements/audio/audio-stop){:target="_blank"} command now releases the command [`audio.wait`]({{site.baseurl}}/elements/audio/audio-wait){:target="_blank"}.
+ The [`InitiateRecorder`]({{site.baseurl}}/commands/global-commands/initiaterecorder){:target="_blank"} and [`UploadRecordings`]({{site.baseurl}}/commands/global-commands/uploadrecordings){:target="_blank"} commands are now usable inside trials, just like [`SendResults`]({{site.baseurl}}/commands/global-commands/sendresults){:target="_blank"}.

Modified elements
+ The [`EyeTracker` element]({{site.baseurl}}/elements/eyetracker){:target="_blank"} has been reworked and should now work out of the box, no longer requiring uploading `PennElement_eyetracker.js` to your projects.
+ The [`Selector` element]({{site.baseurl}}/elements/selector){:target="_blank"} now reports the order of its element in the “Comments” column of its lines in the results file (useful after a call to [`selector.shuffle`]({{site.baseurl}}/elements/selector/selector-shuffle){:target="_blank"}).
+ The [`MouseTracker` element]({{site.baseurl}}/elements/mousetracker){:target="_blank"} can now detect clicks:
  + Pass `"click"` as the first argument of [`mousetracker.callback`]({{site.baseurl}}/elements/mousetracker/mousetracker-callback){:target="_blank"} to run commands on clicks.
  + Pass `"click"` to [`mousetracker.log`]({{site.baseurl}}/elements/mousetracker/mousetracker-log){:target="_blank"} to report clicks (with the cursor coordinates) in the results file.
