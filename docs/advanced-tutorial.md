---
layout: default
title: Advanced Tutorial
nav_order: 4
---

# {{ page.title }}

*To be filled in*

---

## Overview

In the [Basic Tutorial]({{site.baseurl}}/docs/basic-tutorial), you learned how to create an experiment that displays a sentence and two images, and prompts the participant to press a key to indicate the image that sentence describes.

In this tutorial, you'll learn how to...

This tutorial is divided into several sections:

+ section 1
+ section 2

Each section ends with a <span class="text-delta"><a href="#">Back to top</a></span> link, and you can hover to the left of a section title for a shortcut link to that section.

Follow the tutorial by completing the tasks in the <span class="label label-purple">Try it!</span> instructions:
{% capture instructions %}
Code blocks inside an instruction indicate `main.js`, the [experiment script](#editing-an-experiment).

```javascript
// Sample code
test
```
{% endcapture %}
{% include instructions.html text=instructions%}

---

## Setting up

The **AdvancedTutorial** experiment builds off of the **BasicTutorial** experiment. 

You can follow this tutorial by continuing from your copy of the **BasicTutorial** experiment, or by creating a new experiment.

**Setup option 1**: Continuing from the **BasicTutorial** experiment

{% capture instructions %}
Import resource files:

1. Navigate to the **BasicTutorial** experiment project page in the PCIbex Farm.
2. Under **Experiment ‘BasicTutorial’**, click **Update from git repo »**.
3. In the "repo url" field, enter...
4. Click **Sync**.
5. If the import was successful, the imported files will appear in the **Resources** folder of the experiment project page, and briefly flash red.
6. (*Optional*) Navigate to the PCIbex Farm [**my account**](https://expt.pcibex.net/myaccount) page and click the **rename** link under **BasicTutorial**. Rename the experiment to **AdvancedTutorial**.

{% endcapture %}
{% include instructions.html text=instructions %}

**Setup option 2**: Creating a new experiment

{% capture instructions %}
Create a new experiment and import resource files:

1. Navigate to the PCIbex Farm [**my account**](https://expt.pcibex.net/myaccount) page.
2. Click **Create a new experiment**.
3. In the "Name" field, enter "AdvancedTutorial".
4. Click **Create**.
5. Click **AdvancedTutorial** to open its experiment project page.
6. Under **Experiment 'AdvancedTutorial'**, click **Update from git repo »**.
7. In the "repo url" field, enter...
8. Click **Sync**.
9. If the import was successful, the imported files will appear in the **Resources** folder of the experiment project page, and briefly flash red.

{% endcapture %}
{% include instructions.html text=instructions %}



---

## Upgrading a trial




