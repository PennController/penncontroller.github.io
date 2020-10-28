---
layout: default
title: Experiment
parent: Core Concepts
---

# Creating an experiment {#creating-experiment}

After [creating an account on the PCIbex Farm](#creating-account), you can start creating experiments:

1. Go to the [PCIbex Farm home page](https://expt.pcibex.net/).
2. Click **Design experiments**.
3. Enter your login information and click **login**.
4. Click **Create a new experiment**.
5. In the "Name" field, enter the name of your experiment.
6. Click **Create**.

You have now created a new experiment. Experiments are listed in the **Experiments** section on the [PCIbex "my account" page](https://expt.pcibex.net/myaccount). You can manage or edit an experiment by clicking its name. 

## Managing an experiment

Each experiment is managed on a page with the following sections:

+ **URL**: `https://expt.pcibex.net/ibexexps/USERNAME/EXPERIMENT_NAME/experiment.html`.
  + Launch the experiment by clicking the URL.
+ **Experiment 'EXPERIMENT_NAME'**:
  + Edit your experiment.
  + This section has the folders:
    + **Script**: Contains `main.js`, the code for an experiment.
    + **Resources**: Contains any experiment stimuli, like PNG or WAV files.
    + **Results**: 
    + **Aesthetics**:
    + **Controllers**: Contains code for the [native Ibex controllers](https://github.com/addrummond/ibex/blob/master/docs/manual.md#controllers), which can be added to an experiment using the [Controller element](https://www.pcibex.net/wiki/controller-element/).
    + **Counter**: 
+ **Access**
  + Set a password to protect your experiment.
+ **Archive**
  + Download a ZIP archive of your experiment files.

## Editing an experiment

> To be filled in

### Script editor

The **Script** folder contains the file `main.js`, the code for your experiment. You can update your experiment by editing `main.js` in the script editor and saving your changes.

Click **main.js** to open `main.js` in the script editor. By default, new experiments are initialized with a demo experiment. The `main.js` file of a newly-created experiment should start with the following lines:

```javascript
// This is a simple demo script, feel free to edit or delete it
// Find a tutorial and the list of availalbe elements at:
// https://www.pcibex.net/documentation/

PennController.ResetPrefix(null) // Shorten command names (keep this line here)
```

The script editor has the following features:

+ Two links at the top for easy access
  + [**PennController docs**](https://www.pcibex.net/documentation/): Links to PCIbex documentation.
  + [**ibex docs**](https://github.com/addrummond/ibex/blob/master/docs/manual.md): Links to the original Ibex documentation.
+ Autocomplete 
  1. Start typing within the script editor. 
  2. A modular window with suggested command names for autocompletion will pop up.
  3. Navigate the autocomplete suggestions with the **Up** and **Down** arrow keys, and press **Enter/Return** to select a suggestion.
+ Four buttons at the bottom
  + **Discard changes**: Close the script editor without saving any changes.
  + **Save changes**: Save changes without closing the script editor.
  + **Save and close**: Save changes and close the script editor.
  + **Save and test**: Save changes and open the updated experiment in a new tab or window.

### Uploading files directly

You can upload files directly to the PCIbex Farm. For example, as an alternative to the script editor, you can edit `main.js` in an external text editor and upload it to the PCIbex Farm.

> To be filled in...


