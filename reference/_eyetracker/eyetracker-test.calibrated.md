---
title: eyetracker.test.calibrated
command_type: "test"
syntax: .test.calibrated()
description: "Tests whether the EyeTracker went through a calibration procedure (regardless of whether it was successful)."
notes: true
---

+ You probably won't make use of this, unless you don't want to calibrate the tracker before your trials nor on every trial, but still need to calibrate it at least on the first trial, and your trials are presented in a random order. So yeah, you most likely won't have to use this.

+ See `test.ready` if you want to test whether the participant has granted webGazer access to their webcam, as required by the EyeTracker.

<!--more-->
