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
  + [`standard.scaling`]({{site.baseurl}}/commands/standard-element-commands/standard-scaling){:target="_blank"}:
  Zooms an element in or out as needed to fit the passed argument(s).
  + [`canvas.color`]({{site.baseurl}}/elements/canvas/canvas-color){:target="_blank"}:
  Changes the background color of the `Canvas` element it is called on.
  + [`scale.checkbox`]({{site.baseurl}}/elements/scale/scale-checkbox){:target="_blank"}:
  Adds checkbox options to the **Scale** element it is called on.
  + [`timer.pause`]({{site.baseurl}}/elements/timer/timer-pause){:target="_blank"}:
  *To be filled in*
  + [`timer.resume`]({{site.baseurl}}/elements/timer/timer-resume){:target="_blank"}:
  *To be filled in*
  + [`timer.set`]({{site.baseurl}}/elements/timer/timer-set){:target="_blank"}:
  *To be filled in*
+ New test commands
  + [`eyetracker.test.score`]({{site.baseurl}}/elements/eyetracker/eyetracker-test-score){:target="_blank"}:
  Succeeds when the **EyeTracker** element it is called on calibrates with a score
  at least as high as the **EyeTracker** element passed as an argument.
  + [`mousetracker.test.over`]({{site.baseurl}}/elements/mousetracker/mousetracker-test-over){:target="_blank"}:
  Succeeds when a user's mouse hovers over the element passed as an argument.
+ New keyword [`self`]({{site.baseurl}}/commands/keywords#self): Used inside callback
and test commands

### Changed

+ Elements
  + Most elements are now displayed as
  [flex](https://www.w3schools.com/css/css3_flexbox.asp){:target="_blank"}
  by default, instead of as
  [(inline-)block](https://www.w3schools.com/css/css_inline-block.asp){:target="_blank"}.
  + [`Selector` element]({{site.baseurl}}/elements/selector){:target="_blank"}:
  Reports the order of its element in the “Comments” column of its lines in
  the results file.
  + [`MouseTracker` element]({{site.baseurl}}/elements/mousetracker){:target="_blank"}:
  Detects clicks.
+ Element commands
  + [`audio.stop`]({{site.baseurl}}/elements/audio/audio-stop){:target="_blank"}:
  Releases the command [`audio.wait`]({{site.baseurl}}/elements/audio/audio-wait){:target="_blank"}.
  + [`standard.left`]({{site.baseurl}}/commands/standard-element-commands/standard-left){:target="_blank"},
  [`standard.center`]({{site.baseurl}}/commands/standard-element-commands/standard-center){:target="_blank"}
  , and
  [`standard.right`]({{site.baseurl}}/commands/standard-element-commands/standard-center){:target="_blank"}:
  Aligns the whole element, instead of just the text.
  + [`standard.print`]({{site.baseurl}}/commands/standard-element-commands/standard-print){:target="_blank"}:
  Accepts an element as an argument.
+ Global commands
  + [`SendResults`]({{site.baseurl}}/commands/global-commands/sendresults){:target="_blank"}:
  Can be used multiple times during an experiment to send results in multiple steps.
  + [`InitiateRecorder`]({{site.baseurl}}/commands/global-commands/initiaterecorder){:target="_blank"}
  and
  [`UploadRecordings`]({{site.baseurl}}/commands/global-commands/uploadrecordings){:target="_blank"}:
  Can be used inside trials, similar to [`SendResults`]({{site.baseurl}}/commands/global-commands/sendresults){:target="_blank"}.

### Fixed

+ [`EyeTracker` element]({{site.baseurl}}/elements/eyetracker){:target="_blank"}:
No longer requires the special upload of `PennElement_eyetracker.js`.
+ [`fullscreen`]({{site.baseurl}}/commands/special-commands/fullscreen){:target="_blank"}:
No longer makes Safari crash.
