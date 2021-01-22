---
title:  PennController 1.6
tags: [version]
---

[PennController 1.6](https://github.com/PennController/penncontroller/tree/master/releases/1.6){:target="_blank"} is now available!

Newly created experiments on the PCIbex Farm come with it, and you can sync your existing projects with the [master branch](https://github.com/PennController/Sync){:target="_blank"} to update your version of PennController.

**Major changes from 1.5**:

+ key.wait logs properly again
+ timer.stop now validates timer.wait
+ Better recognition of anonymous Canvases
+ Better cross-browser support of audio/video.settings.disable and preloading
+ Calling commands on PennController.Template() instead of embedded PennController() (e.g. .log) now outputs errors in the Debug helper window
+ Tooltips can now be created anonymously (you are no longer required to pass a name string to newTooltip)
+ tooltip.print can now take coordinates to be placed on the document (and not attached to another element)
+ Added the "loop" and "once" optional parameters to audio.play
+ Added the optional opacity parameter to audio/video.settings.disable
+ Added the command scale.unselect