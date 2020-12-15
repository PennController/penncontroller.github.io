---
layout: tutorial-child
title: 1. Setting up
parent: Advanced Tutorial
nav_order: 1
numbered_headings: true
blurb: Lorem ipsum dolor sit amet, consectetur adipiscing elit.
---

The **AdvancedTutorial** experiment continues directly from the [**BasicTutorial** experiment]({{site.baseurl}}/docs/basic-tutorial/#overview){:target="_blank"}. 
{: .h1-blurb }

---

{% capture instructions %}
Modify the **BasicTutorial** experiment by importing new resource files, updating `main.js`, and renaming the experiment:

1. Navigate to the **BasicTutorial** experiment project page.
2. Under **Experiment ‘BasicTutorial’**, click **Update from git repo »**.
3. In the "repo url" field, enter `https://github.com/angelica-pan/AdvancedTutorial`.
4. Click **Sync**. If the import was successful, the imported files will appear in the experiment project page's **Resources** folders, and briefly flash red.
5. Click `main.js` to open the script editor. 
  + Change the first line from `// This is the BasicTutorial experiment.` to `// This is the AdvancedTutorial experiment.` 
  + Comment out the `DebugOff` command, from `DebugOff()` to `// DebugOff()`.
6. Click **Save and close** to save changes.
7. Navigate to the PCIbex Farm [**my account**](https://expt.pcibex.net/myaccount) page and click the **rename** link under **BasicTutorial**. Rename the experiment to "AdvancedTutorial". 

To learn more about importing files from GitHub, see [Syncing with a GitHub repository]({{site.baseurl}}/docs/how-to-guides/github/){:target="_blank"}.

{% endcapture %}
{% include instructions.html text=instructions %}

You can also create a new experiment, if you'd like to keep the the **BasicTutorial** and **AdvancedTutorial** experiments separate.

{% capture content %}
Create a new experiment and import resource files:

1. Navigate to the PCIbex Farm [**my account**](https://expt.pcibex.net/myaccount) page.
2. Click **Create a new experiment**.
3. In the "Name" field, enter "AdvancedTutorial".
4. Click **Create**.
5. Click **AdvancedTutorial** to open its experiment project page.
6. Under **Experiment 'AdvancedTutorial'**, click **Update from git repo »**.
7. In the "repo url" field, enter `https://github.com/angelica-pan/AdvancedTutorial`.
8. Click **Sync**. If the import was successful, the imported files will appear in the **Resources** folder of the experiment project page, and briefly flash red.
9. Click `main.js` to open the script editor.
10. Copy and paste the code block below, and click **Save and close** to save changes.

```javascript
// This is the AdvancedTutorial experiment.
// Type code below this line.

// Remove command prefix
PennController.ResetPrefix(null)

// Turn off debugger
// DebugOff()

// Instructions
newTrial("instructions",
    defaultText
        .center()
        .print()
    ,
    newText("instructions-1", "Welcome!")
    ,
    newText("instructions-2", "<p>In this experiment, you will hear and read a sentence, and see two images.</p>")
    ,
    newText("instructions-3", "<b>Select the image that better matches the sentence:</b>")
    ,
    newText("instructions-4", "<p>Press the <b>F</b> key to select the image on the left.<br>Press the <b>J</b> key to select the image on the right.</p>")
    ,
    newButton("wait", "Click to start the experiment")
        .center()
        .print()
        .wait()
)

// Experimental trial
newTrial("experimental-trial",
    newAudio("fish-audio", "2fishRoundTank.mp3")
        .play()
    ,
    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
        .center()
        .unfold(2676)
    ,
    newImage("fish-plural", "2fishRoundTank.png")
        .size(200, 200)
    ,
    newImage("fish-singular", "1fishSquareTank.png")
        .size(200, 200)
    ,
   	newCanvas("side-by-side", 450,200)
        .add(  0, 0, getImage("fish-plural"))
        .add(250, 0, getImage("fish-singular"))
        .center()
        .print()
        .log()
    ,
    newKey("keypress", "FJ")
        .log()
        .wait()
    ,
    getAudio("fish-audio")
        .wait("first")
)
```
{% endcapture %}
{% include collapsible-block.html content=content summary="Click for more details" inner-border=true %}

## Refining the experimental design

The **AdvancedTutorial** experiment uses the **BasicTutorial** picture matching design and adds a research question:

> What is the time course of interpreting English agreement morphology, in particular the third person singular inflectional morpheme *-s*?

There are two conditions (singular verb inflection and plural verb inflection) and four experimental items, for a total of eight sentences and eight images:

*Note: You may need to scroll to the right to see all the columns.*

| item | singular verb inflection (with *-s*)             | plural verb inflection (without *-s*)            |
|------|--------------------------------------------------|----------------------------------------------------|
| 1    | The fish swim in a tank which is perfectly round | The fish swims in a tank which is perfectly square |
| 2    | The deer runs in a wood which is extremely dense | The deer run in a wood which is extremely sparse       |
| 3    | The sheep roams in a pen which is strikingly red | The sheep roam in a pen which is strikingly blue        |
| 4    | The moose walks in a park which is visibly new   | The moose walk in a park which is visibly old      |

<div class="flex-row-wrap mb-4">
  <div class="centered-eighth"><img src="{{site.baseurl}}/assets/tutorials/1fishSquareTank.png" alt="1fishSquareTank"></div>
  <div class="centered-eighth"><img src="{{site.baseurl}}/assets/tutorials/2fishRoundTank.png" alt="2fishRoundTank"></div>
  <div class="centered-eighth"><img src="{{site.baseurl}}/assets/tutorials/1deerDenseWood.png" alt="1deerDenseWood"></div>
  <div class="centered-eighth"><img src="{{site.baseurl}}/assets/tutorials/2deerSparseWood.png" alt="2deerSparseWood"></div>
  <div class="centered-eighth"><img src="{{site.baseurl}}/assets/tutorials/1sheepRedPen.png" alt="1sheepRedPen"></div>
  <div class="centered-eighth"><img src="{{site.baseurl}}/assets/tutorials/2sheepBluePen.png" alt="2sheepBluePen"></div>
  <div class="centered-eighth"><img src="{{site.baseurl}}/assets/tutorials/1mooseNewPark.png" alt="1mooseNewPark"></div>
  <div class="centered-eighth"><img src="{{site.baseurl}}/assets/tutorials/2mooseOldPark.png" alt="2mooseOldPark"></div>
</div>

We'll use two experimental item lists, or groups, for a within-item (across participants, each item occurs in all conditions) and within-participant design (each participant sees all conditions):

| group | item | sentence                                         | inflection |
|-------|------|--------------------------------------------------|------------|
| A     | 1    | The fish swim in a tank which is perfectly round | plural     |
| A     | 2    | The deer runs in a wood which is extremely dense | singular   |
| A     | 3    | The sheep roam in a pen which is strikingly blue | plural     |
| A     | 4    | The moose walks in a park which is visibly new   | singular   |

| group | item | sentence                                           | inflection |
|-------|------|----------------------------------------------------|------------|
| B     | 1    | The fish swims in a tank which is perfectly square | singular   |
| B     | 2    | The deer run in a wood which is extremely sparse   | plural     |
| B     | 3    | The sheep roams in a pen which is strikingly red   | singular   |
| B     | 4    | The moose walk in a park which is visibly old      | plural     |
