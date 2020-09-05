---
layout: default
title: Creating an experiment
parent: Basic Tutorial
---

## {{ page.title }}

1. [Create a PCIbex Farm account]({{site.baseurl}}#the-pcibex-farm)
2. Go to the [PCIbex Farm home page](https://expt.pcibex.net/).
3. Click **Design experiments**.
4. Enter your login information and click **login**.
5. Click **Create a new experiment**.
6. In the "Name" field, enter "BasicTutorial".
7. Click **Create**.

Click on **BasicTutorial** to open your experiment and begin editing.

### Importing resource files

The **BasicTutorial** experiment uses the images `1fishSquareTank.png` and `2fishRoundTank.png`:

<div class="d-flex">
    <div style="text-align:center;">
        <img src="{{site.baseurl}}/assets/images/1fishSquareTank.png" alt="1fishSquareTank" width="75%" height="auto">
        <code>1fishSquareTank.png</code>
    </div>
    <div style="text-align:center;">
        <img src="{{site.baseurl}}/assets/images/2fishRoundTank.png" alt="2fishRoundTank" width="75%" height="auto">
        <code>2fishRoundTank.png</code>
    </div>
</div>


Import these images and a starter experiment script:

1. Under **Experiment 'BasicTutorial'**, click **Update from git repo »**.
2. In the “repo url” field, enter `https://github.com/angelica-pan/BasicTutorial`
3. Click **Sync**.
4. If the import was successful, the imported files will appear in the **Script** or **Resources** folder, and briefly flash red.

### Editing an experiment

The **Script** folder contains the file `main.js`, the experiment script. Update your experiment by editing `main.js` in the script editor and saving your changes.

Run an experiment by clicking the link at the top of the experiment's page:
`https://expt.pcibex.net/ibexexps/USER_NAME/EXPERIMENT_NAME/experiment.html`

The script editor has the following features:

+ Two links at the top for easy access
  + [PennController docs](https://www.pcibex.net/documentation/): Links to PCIbex documentation.
  + [ibex docs](https://github.com/addrummond/ibex/blob/master/docs/manual.md): Links to the original Ibex documentation.
+ Autocomplete 
  1. Start typing within the script editor. 
  2. A modular window with suggested command names for autocompletion will pop up.
  3. Navigate the autocomplete suggestions with the **Up** and **Down** arrow keys, and press **Enter/Return** to select a suggestion.
+ Four buttons at the bottom
  + **Discard changes**: Close the script editor without saving any changes.
  + **Save changes**: Save changes without closing the script editor.
  + **Save and close**: Save changes and close the script editor.
  + **Save and test**: Save changes and open the updated experiment in a new tab or window.

Click **main.js** to open `main.js` in the script editor:

```javascript
// This is the BasicTutorial experiment.
// Type code below this line.
```
### Creating a trial

PennController trials are created with the command `PennController.newTrial`:

```javascript
PennController.newTrial("first-trial")
```

All PennController commands begin with the prefix `PennController.`, in order to avoid naming conflicts with other JavaScript modules. However, adding this prefix for every command quickly becomes tiring.

The command [`PennController.ResetPrefix`](./commands/global-commands/resetprefix/) resets the `PennController.` prefix to the string of your choice, and only needs to be called once. The `null` argument to `PennController.ResetPrefix` removes the prefix entirely:
```javascript
// This is the BasicTutorial experiment.
// Type code below this line.

// Remove command prefix
PennController.ResetPrefix(null)

newTrial("first-trial")
```

{% capture label %}
Start every experiment with `PennController.ResetPrefix(null)`  for readability and convenience. 
{% endcapture %}
{% include label-recommended.html label-body=label  %}

### Turning off the debugger

PennController comes with a [built-in debugger]({{site.baseurl}}/docs/core-concepts/debugger) that helps detect typos and syntax errors. 

It appears as a small window in the bottom-right corner of the screen when you run an experiment:

![debugger]({{site.baseurl}}/assets/images/debugger.png)

*To be filled in*