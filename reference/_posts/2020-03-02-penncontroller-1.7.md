---
title:  PennController 1.7
tags: [versions]
---

[PennController 1.7](https://github.com/PennController/penncontroller/tree/master/releases/1.7){:target="_blank"}
is now available!

Newly created experiments on the PCIbex Farm come with it, and you can sync your
existing projects with the
[master branch](https://github.com/PennController/Sync){:target="_blank"}
to update your version of PennController.

## Major changes from 1.6**

+ The `.settings` prefix is now optional (for example, you can now use `newSelector().log` in place of `newSelector().settings.log`).
+ [`ResetPrefix(null)`]({{site.baseurl}}/global-commands/resetprefix) now drops all `PennController.` prefixes (for example,`PennController.Template` becomes just `Template`)
+ The `PennController` global command is now known as [`newTrial`].
+ Anonymous elements are now named after their content (e.g. newImage("logo.png") can now be retrieved using getImage("logo.png"))
+ Added special commands [`fullscreen`]({{site.baseurl}}/special-commands/fullscreen) and [`exitFullscreen`]({{site.baseurl}}/special-commands/exitfullscreen).
+ SendResults() can now also be used directly inside Sequence, or as an in-trial command
+ Fixed various bugs within the [`Var` element]({{site.baseurl}}/var).
+ Added the element type Controller, to inject native-Ibex controllers in your trials, e.g. newController("DashedSentence", {s: "Hello world"}) (this is a new functionality which has not been thoroughly tested, please make sure to run some tests before using it)
