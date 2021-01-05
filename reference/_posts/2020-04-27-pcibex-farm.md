---
layout: post
title: Ibex Farm performance - slowdowns, workarounds, future plans
author: Jeremy
tags: [general]
---

The PCIbex Farm has experienced sporadic slowdowns these past few days, most notably impacting the Save functionality of the integrated script editor. If you are still experiencing editing issues, you have a couple of options:

+ **Edit your scripts externally** with a text editor (I use Visual Studio Code, but any text editor will do as long as you save your file as raw text) and then upload them back to your project
If you develop your experiment using a git service (eg. GitLab or GitHub) you can sync your project instead of manually uploading your files
+ **Move your project to [the original Ibex Farm](https://spellout.net/ibexfarm/){:target="_blank"}**: since April 26, 2020, Alex Drummond (the creator of IBEX) has secured the domain of the original Ibex Farm. This means that all of PennController’s features will work there as well, including audio recording. Note however that the original Ibex Farm does not host media resources, so you will have to host them independently. You can still use CSV files by uploading them to the chunk_includes folder.
To install PennController on a project on the Ibex Farm, simply follow the instructions on [the Manual Installation page](https://www.pcibex.net/wiki/installation/){:target="_blank"} of the documentation.

I am actively working on a **new version of the PCIbex Farm**. Among a list of new features, I am hopeful that it will help address the slowdown issues effectively. One of the highlights of this new version is that it will let you directly monitor and handle your storage space, and it will implement a system of sharing files across experiments in an effort to save storage space. I welcome any suggestions on the [dedicated thread of the Request forums](https://www.pcibex.net/forums/topic/new-pcibex-farm/){:target="_blank"}.

Jeremy