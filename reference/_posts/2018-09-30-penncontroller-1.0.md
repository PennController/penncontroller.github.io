---
layout: post
title:  PennController 1.0
tags: [update]
---

[PennController 1.0](https://github.com/PennController/penncontroller/tree/master/releases/1.0){:target="_blank"} is now available! This is the first public release of a non-beta version.


Changelog

Fixes
+ Revised the optional definition of shuffleSequence (now runs in passed order if undefined)
+ PennController now adds items to the items variable without having to be embedded
+ Standard settings commands .after, .before, .center, .left and .right now update even after action .print
+ Settings command .labels for Scale is now deprecated, use .labelsPosition instead

New features
+ Added duration for sliders (as comments)
+ Added options “left” and “right” to the settings command .labelsPosition for Scale elements
+ Added Setting commands .checkboxWarning, .inputWarning and .radioWarning to Html elements
+ Added .settings.log as a default for printing (canvas, image and text)
+ Added getScale(id).settings.label(index, value) to (re)set the label of the index‘th optionpress
