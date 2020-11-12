---
layout: default
title: Creating an experiment
parent: Basic Tutorial
nav_order: 2
---

## {{ page.title }}

{% capture instructions %}
Create a new experiment: 

1. [Create a PCIbex Farm account]({{site.baseurl}}#the-pcibex-farm){:target="_blank"}
2. Go to the [PCIbex Farm home page](https://expt.pcibex.net/){:target="_blank"}.
3. Click **Design experiments**.
4. Enter your login information and click **login**.
5. Click **Create a new experiment**.
6. In the "Name" field, enter "BasicTutorial".
7. Click **Create**.
8. Click **BasicTutorial** to open its experiment project page and begin editing.
{% endcapture %}
{% include instructions.html text=instructions%}

### Importing resource files

The **BasicTutorial** experiment uses the images [`1fishSquareTank.png`]({{site.baseurl}}/assets/tutorials/1fishSquareTank.png){:target="_blank"} and [`2fishRoundTank.png`]({{site.baseurl}}/assets/tutorials/2fishRoundTank.png){:target="_blank"}, the audio file [`2fishRoundTank.mp3`]({{site.baseurl}}/assets/tutorials/2fishRoundTank.mp3){:target="_blank"}, and the starter experiment script [`main.js`]({{site.baseurl}}/assets/tutorials/main.js){:target="_blank"}.

{% capture instructions %}
Import the resource files:

1. Click **Update from git repo »**, under **Experiment 'BasicTutorial'**.
2. In the “repo url” field, enter `https://github.com/angelica-pan/BasicTutorial`
3. Click **Sync**.
4. If the import was successful, the imported files will appear in the experiment project page's **Script** or **Resources** folders, and briefly flash red.

To learn more about importing files from GitHub, see [Syncing with a GitHub repository]({{site.baseurl}}/docs/how-to-guides/github/){:target="_blank"}.
{% endcapture %}
{% include instructions.html text=instructions%}

You can also manually upload the resource files to the PCIbex Farm. However, you can only upload one file at a time.

{% capture content %}
1. Download a local copy of [`1fishSquareTank.png`]({{site.baseurl}}/assets/tutorials/1fishSquareTank.png){:target="_blank"}, [`2fishRoundTank.png`]({{site.baseurl}}/assets/tutorials/2fishRoundTank.png){:target="_blank"}, [`2fishRoundTank.mp3`]({{site.baseurl}}/assets/tutorials/2fishRoundTank.mp3){:target="_blank"}, and [`main.js`]({{site.baseurl}}/assets/tutorials/main.js){:target="_blank"}.
2. Upload the multimedia files.
  + Click the *Upload* icon (a white cross inside a black circle) in the experiment project page's **Resources** folder.
  + Select the file that you wish to upload: `1fishSquareTank.png`, `2fishRoundTank.png`, or `2fishRoundTank.mp3` 
  + Click *Open*.
  + If the upload was successful, the uploaded file will appear in the **Resources** folder and briefly flash red.
  + Repeat until all three multimedia files have been uploaded.
3. Upload the experiment script.
  + Click the *Upload* icon (a white cross inside a black circle) in the experiment project page's **Script** folder.
  + Select `main.js`.
  + Click *Open*.
  + If the upload was successful, the uploaded file will appear in the **Script** folder and briefly flash red.
{% endcapture %}
{% include collapsible-block.html content=content summary="Click for more details" inner-border=true %}

### Editing an experiment

The **Script** folder contains the file `main.js`, the experiment script. Update your experiment by editing `main.js` in the script editor and saving your changes.

Run an experiment by clicking the link at the top of the experiment's page:
`https://expt.pcibex.net/ibexexps/USER_NAME/EXPERIMENT_NAME/experiment.html`

The script editor has the following features:

+ Two links at the top for easy access
  + [PennController docs](https://www.pcibex.net/documentation/){:target="_blank"}: Links to PCIbex documentation.
  + [ibex docs](https://github.com/addrummond/ibex/blob/master/docs/manual.md){:target="_blank"}: Links to the original Ibex documentation.
+ Autocomplete 
  1. Start typing within the script editor. 
  2. A modular window with suggested command names for autocompletion will pop up.
  3. Navigate the autocomplete suggestions with the **Up** and **Down** arrow keys, and press **Enter/Return** to select a suggestion.
+ Four buttons at the bottom
  + **Discard changes**: Close the script editor without saving any changes.
  + **Save changes**: Save changes without closing the script editor.
  + **Save and close**: Save changes and close the script editor.
  + **Save and test**: Save changes and open the updated experiment in a new tab or window.

{% capture instructions %}
Click **main.js** to open `main.js` in the script editor:

```javascript
// This is the BasicTutorial experiment.
// Type code below this line.
```
{% endcapture %}
{% include instructions.html text=instructions%}

### Creating a trial

Create a trial by using the [`PennController.newTrial("TRIAL_LABEL,...")`]({{site.baseurl}}/docs/global-commands/newtrial){:target="_blank"} command:

+ `"TRIAL_LABEL"` is the label of the trial, and an optional (but highly recommended) argument.
+ Any subsequent arguments are sequences of [elements](#adding-elements) and [commands](#adding-commands) that define what happens in the trial.

{% capture instructions %}
Create a trial labeled `"experimental-trial"`:

<pre><code class="language-diff-javascript diff-highlight"> 
*// This is the BasicTutorial experiment.
*// Type code below this line.
*
+// Experimental trial
+PennController.newTrial("experimental-trial")
</code></pre>

At this point, the `main.js` script is **incomplete**; we've created an empty trial that does not do or contain anything. If you run the experiment, it'll end immediately with the message "The results were successfully sent to the server. Thanks!". 
{% endcapture %}
{% include instructions.html text=instructions%}

All PennController commands begin with the prefix `PennController.`, in order to avoid naming conflicts with other JavaScript modules. However, adding this prefix for every command quickly becomes tiring.

The command [`PennController.ResetPrefix`]({{site.baseurl}}/docs/global-commands/resetprefix){:target="_blank"} resets the `PennController.` prefix to the string of your choice, and only needs to be called once. The `null` argument to `PennController.ResetPrefix` removes the prefix entirely. 

{% capture label %}
**We recommend starting every experiment with `PennController.ResetPrefix(null)` for readabilty and convenience.**

This tutorial assumes that the `PennController.` prefix has already been removed when referencing any command.
{% endcapture %}
{% include label-note.html label-body=label %}


{% capture instructions %}
Remove the `PennController.` prefix:

<pre><code class="language-diff-javascript diff-highlight"> 
*// This is the BasicTutorial experiment.
*// Type code below this line.
*
+// Remove command prefix
+PennController.ResetPrefix(null)
*
*// Experimental trial
!newTrial("experimental-trial")
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

### Using the debugger

PennController comes with a [built-in debugger]({{site.baseurl}}/docs/core-concepts/debugger){:target="_blank"} that helps detect typos, syntax errors, and other issues.

It appears as a small window in the bottom-right corner of the screen when you run an experiment:

![debugger]({{site.baseurl}}/assets/images/debugger.png)

 The debugger window has five tabs:

+ **Info**: Displays information about the current trial.
+ **Sequence**: Lists all trials, and allows you to skip to any particular trial.
+ **Tables**: Lists all tables.
+ **Errors**: Presents any error messages.
+ **Log**: Reports whenever a command is executed on an element, or whenever a resource is successfully preloaded.

These tabs might not make sense until you learn more about PennController experiments, but the important part to know is that **you should use the debugger as you build and test an experiment**. You'll inevitably face problems, and the debugger will make it easier to solve them.

When you're ready to publish your experiment and collect experimental data, turn off the debugger with the [`DebugOff`]({{site.baseurl}}/docs/global-commands/debugoff){:target="_blank"} command.

We recommend reading the [Debugger documentation]({{site.baseurl}}/docs/core-concepts/debugger){:target="_blank"} after you've completed this tutorial and the [**Advanced Tutorial**]({{site.baseurl}}/docs/advanced-tutorial){:target="_blank"}, and are more familiar with PennController experiments.

{% capture instructions %}
Call the [`DebugOff`]({{site.baseurl}}/docs/global-commands/debugoff){:target="_blank"} command, but comment it out. We'll uncomment the command only during the very last part of the tutorial:

<pre><code class="language-diff-javascript diff-highlight"> 
*// This is the BasicTutorial experiment.
*// Type code below this line.
*
*// Remove command prefix
*PennController.ResetPrefix(null)
*
+// Turn off debugger
+// DebugOff()
*
*// Experimental trial
*newTrial("experimental-trial")
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}
