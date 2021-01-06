---
layout: post
title:  PennController 1.5
tags: [versions]
---

[PennController 1.5](https://github.com/PennController/penncontroller/tree/master/releases/1.5){:target="_blank"} is now available!

Newly created experiments on the PCIbex Farm come with it, and you can sync your existing projects with the [master branch](https://github.com/PennController/Sync){:target="_blank"} to update your version of PennController.

**New features**:
+ It is now possible to load distant CSV files using PennController.AddTable, e.g.: PennController.AddTable("https://bit.ly/2xzWunf")
+ Added commands .settings.callback and .settings.once to the DropDown element.

**Bugs fixed**:
+ Running a native Ibex VBox no longer makes the experiment crash (bug introduced in 1.2)
+ Naming a new element with an existing ID no longer makes the debug error window crash
+ Fixed standard test command .printed (bug introduced in 1.4)
+ Fixed the format of the results lines added by the DropDown element