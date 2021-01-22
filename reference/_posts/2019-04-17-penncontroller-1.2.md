---
title:  PennController 1.2
tags: [versions]
---

[PennController 1.2](https://github.com/PennController/penncontroller/tree/master/releases/1.5){:target="_blank"} is now available!

Newly created experiments on the PCIbex Farm come with it, and you can sync your existing projects with the [master branch](https://github.com/PennController/Sync){:target="_blank"} to update your version of PennController.

We skipped the announcement of PennController 1.1, so here’s a non-exhaustive list of changes:

+ Added .or and .and to Test commands (1.1)
+ Added action command .refresh as standard to reprint the element where it is (1.1)
+ Added .settings.callback to Button and Key elements (1.1)
+ Added .settings.keys to Scale elements (1.1)
+ Added .stop action command for Timer elements (1.1)
+ Added .select action command for Scale elements (1.1)
+ Added .settings.cssContainer as a default for every element type (1.1)
+ Added “right | center | bottom at” options for the x and y argument of canvas.settings.add (1.1)
+ Added PennController.SetCounter, PennController.SendResults and PennController.Sequence in an effort to make the definition of Ibex’s internal items variable entirely optional (1.1)
+ Added “playback” option to voicerecorder.wait (1.1)
+ Added the global command PennController.Debug (1.2)
+ Added action command .click for Button elements (1.2)
+ Added the DropDown element (1.2)
+ Added the Palette element (beta, 1.2)
+ Added the Eyetracker element (beta, 1.2)
+ Added the Group element (beta, 1.2)

https://www.pcibex.net/2019/04/17/penncontroller-1-2/