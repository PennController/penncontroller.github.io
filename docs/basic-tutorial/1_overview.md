---
layout: default
title: Overview
parent: Basic Tutorial
---

## {{ page.title }}

In this tutorial, you'll learn how to create an experiment that displays a sentence and two images, and prompts the participant to press a key to indicate the image that sentence describes.

Check out the **BasicTutorial** experiment [**here**](https://expt.pcibex.net/ibexexps/angelicapan/ImageSelection1/experiment.html).

This tutorial is divided into several sections:

+ [Creating an experiment](#creating-an-experiment) teaches you how to use the PCIbex Farm to create and run PennController experiments.
+ [Adding elements](#adding-elements) shows you how to use elements, the basic unit of a PennController experiment.
+ [Adding commands](#adding-commands) demonstrates how commands are used to manipulate elements and experiment evaluation.
+ [Enhancing aesthetics](#enhancing-aesthetics) provides examples of controlling visual content.
+ [Logging data](#logging-data) shows you how to collect and examine experimental data.

Each section ends with a <span class="text-delta"><a href="#">Back to top</a></span> link, and you can hover to the left of a section title for a shortcut link to that section.

Follow the tutorial by completing the tasks in the <span class="label label-purple">instructions</span> blocks:
{% capture instructions %}
Code blocks inside an instruction indicate `main.js`, the [experiment script](#editing-an-experiment).

```javascript
// This is a code block
```
{% endcapture %}
{% include instructions.html text=instructions%}
