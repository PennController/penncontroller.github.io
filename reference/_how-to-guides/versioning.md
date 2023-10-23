---
title: Versioning
---

Each time a new PennController version is released, it is associated with a new version number. This page describes how to check the PennController version that your experiment is running, and how to upgrade or downgrade if needed.

# Checking the version of PennController

There are two ways to check which version of PennController your project is using:

1. If you open your experiment and the debugger pop-in window is visible, you can see a version number in the title of that window (e.g. "Debug (PennController 2.0)")

2. You can also open the file PennController.js from your project's Modules folder (named `js_includes` outside the PCIbex Farm) and look for a version number in the comments in the first few lines of the file (e.g. `*  - Version 2.0`)

# Upgrading or downgrading

You can find the various released versions of PennController on [the official GitHub repository for PennController](https://github.com/PennController/penncontroller/tree/master/releases).

If you want to upgrade or downgrade your version of PennController, first note down the version of PennController that your project is currently using (see the previous section) so you can revert back to it later if needed

Identify which you release you want to use in the list and open the corresponding folder. In each version folder should live a file named `PennController.js`. Simply download that .js file and upload it to your project's Modules (`js_includes`) folder to overwrite the file of the same name that currently lives there. Once the upload is complete, you have successfully upgraded/downgraded your version of PennController!

If you need to revert back to the version of PennController that you were previously using, simply follow the same steps using the PennController.js file from the subfolder of the previous version
