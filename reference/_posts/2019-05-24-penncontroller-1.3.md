---
title:  PennController 1.3
tags: [versions]
---

[PennController 1.3](https://github.com/PennController/penncontroller/tree/master/releases/1.5){:target="_blank"} is now available!

Newly created experiments on the PCIbex Farm come with it, and you can sync your existing projects with the [master branch](https://github.com/PennController/Sync){:target="_blank"} to update your version of PennController.

**Major changes from 1.2**:

+ Added the action command .unfold for Text elements
+ Added the option to pass coordinates (and a Canvas) to the command .print (limited support of element types—see the documentation page)
+ Timer elements now use the requestAnimationFrame javascript function instead of the setTimeout javascript function
+ Mispelled commands called on element are now caught by the debugger
+ Disabled elements now uniformly receive class PennController-disabled
+ A warning message now appears whenever you leave the page before the results are sent

https://www.pcibex.net/2019/05/24/penncontroller-1-3/