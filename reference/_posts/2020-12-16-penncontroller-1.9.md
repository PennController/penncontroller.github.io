---
title: PennController 1.9
tags: [versions]
---

[PennController 1.9](https://github.com/PennController/penncontroller/tree/master/releases/1.9){:target="_blank"}
is now available!

Newly created experiments on the PCIbex Farm come with it, and you can sync your
existing projects with the [master branch](https://github.com/PennController/Sync){:target="_blank"}
to update your version of PennController.

## Major changes from 1.8

### Added

+ New action commands
  + [`standard.scaling`]({{site.baseurl}}/standard-element-commands/standard-scaling):
  Zooms an element in or out as needed to fit the passed argument(s).
  + [`canvas.color`]({{site.baseurl}}/canvas/canvas-color):
  Changes the background color of the `Canvas` element it is called on.
  + [`scale.checkbox`]({{site.baseurl}}/scale/scale-checkbox):
  Adds checkbox options to the **Scale** element it is called on.
  + [`timer.pause`]({{site.baseurl}}/timer/timer-pause):
  *To be filled in*
  + [`timer.resume`]({{site.baseurl}}/timer/timer-resume):
  *To be filled in*
  + [`timer.set`]({{site.baseurl}}/timer/timer-set):
  *To be filled in*
+ New test commands
  + [`eyetracker.test.score`]({{site.baseurl}}/eyetracker/eyetracker-test-score):
  Succeeds when the **EyeTracker** element it is called on calibrates with a score
  at least as high as the **EyeTracker** element passed as an argument.
  + [`mousetracker.test.over`]({{site.baseurl}}/mousetracker/mousetracker-test-over):
  Succeeds when a user's mouse hovers over the element passed as an argument.
+ New keyword [`self`]({{site.baseurl}}/commands/keywords#self): Used inside callback
and test commands

### Changed

+ Elements
  + Most elements are now displayed as
  [flex](https://www.w3schools.com/css/css3_flexbox.asp){:target="_blank"}
  by default, instead of as
  [(inline-)block](https://www.w3schools.com/css/css_inline-block.asp){:target="_blank"}.
  + [`Selector` element]({{site.baseurl}}/selector):
  Reports the order of its element in the “Comments” column of its lines in
  the results file.
  + [`MouseTracker` element]({{site.baseurl}}/mousetracker):
  Detects clicks.
+ Element commands
  + [`audio.stop`]({{site.baseurl}}/audio/audio-stop):
  Releases the command [`audio.wait`]({{site.baseurl}}/audio/audio-wait).
  + [`standard.left`]({{site.baseurl}}/standard-element-commands/standard-left),
  [`standard.center`]({{site.baseurl}}/standard-element-commands/standard-center)
  , and
  [`standard.right`]({{site.baseurl}}/standard-element-commands/standard-center):
  Aligns the whole element, instead of just the text.
  + [`standard.print`]({{site.baseurl}}/standard-element-commands/standard-print):
  Accepts an element as an argument.
+ Global commands
  + [`SendResults`]({{site.baseurl}}/global-commands/sendresults):
  Can be used multiple times during an experiment to send results in multiple steps.
  + [`InitiateRecorder`]({{site.baseurl}}/global-commands/initiaterecorder)
  and
  [`UploadRecordings`]({{site.baseurl}}/global-commands/uploadrecordings):
  Can be used inside trials, similar to [`SendResults`]({{site.baseurl}}/global-commands/sendresults).

### Fixed

+ [`EyeTracker` element]({{site.baseurl}}/eyetracker):
No longer requires the special upload of `PennElement_eyetracker.js`.
+ [`fullscreen`]({{site.baseurl}}/special-commands/fullscreen):
No longer makes Safari crash.
