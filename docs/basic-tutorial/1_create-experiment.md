---
layout: default
title: Create an experiment
parent: Basic Tutorial
---

## {{ page.title }}

1. [Create a PCIbex Farm account](#creating-account).
2. Go to the [PCIbex Farm home page](https://expt.pcibex.net/).
3. Click **Design experiments**.
4. Enter your login information and click **login**.
5. Click **Create a new experiment**.
6. In the "Name" field, enter "BasicTutorial".
7. Click **Create**.

Click on the **BasicTutorial** experiment to begin editing.

### Load resource files

Option 1: Upload directly

+ *To be filled in*

Option 2: Upload through GitHub

+ *To be filled in*

### Edit an experiment

The **Script** folder contains the file `main.js`, the experiment code. Update your experiment by editing `main.js` in the script editor and saving your changes.

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

Click **main.js** to open `main.js` in the script editor. 

By default, new experiments are initialized with a demo experiment.  If you uploaded the resource files directly,  the original `main.js` file  should start with the following lines:
```javascript
// This is a simple demo script, feel free to edit or delete it
// Find a tutorial and the list of availalbe elements at:
// https://www.pcibex.net/documentation/

PennController.ResetPrefix(null) // Shorten command names (keep this line here)
```

If you uploaded the resource files through GitHub,  the newly uploaded `main.js` should contain only the following lines:
```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null) 
```

{% capture label %}
If you uploaded the resource files directly, delete all lines in `main.js` that follow `PennController.ResetPrefix(null) // Shorten command names (keep this line here)` before continuing the tutorial.

If you uploaded the resource files through GitHub, you can continue the tutorial directly.
{% endcapture %}
{% include note-label.html label-body=label  %}

### Create a trial

PennController trials are created with the command `PennController.newTrial`:

```javascript
// Create a Trial named "first-trial"
PennController.newTrial("first-trial")
```

All PennController commands begin with the prefix `PennController.`, in order to avoid naming conflicts with other JavaScript modules. However, adding this prefix for every command quickly becomes tiring.

The tutorial uses the command [`PennController.ResetPrefix`](./commands/global-commands/resetprefix/), which resets the `PennController.` prefix to the string of your choice, to remove the prefix entirely:
```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null) 

// Create a Trial named "first-trial"
newTrial("first-trial")
```

{% capture label %}
It is recommended to start every experiment with `PennController.ResetPrefix(null)`  for readability and convenience. 
{% endcapture %}
{% include recommended-label.html label-body=label  %}
