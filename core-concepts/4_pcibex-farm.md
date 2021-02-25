---
title: 4. PCIbex Farm
nav_order: 4
---

[PCIbex Farm](https://farm.pcibex.net/) allows you to build and share your experiment easily with public.
{: .h1-blurb }

---


The easiest way to use PCIbex, or PennController, is to use the
[PCIbex Farm](https://farm.pcibex.net/){:target="_blank"} server,
which provides free hosting for PennController experiments. The PCIbex Farm
hosts and builds PennController experiments automatically, meaning that you
don't have to worry about set up, and can focus on writing your experiment scripts.

You can also set up your own server by following the instructions in the
[Using an external server]({{site.baseurl}}/docs/how-to-guides/setting-up-server)
how-to guide.

Each PCIbex Farm account has a **64MB storage quota**, meaning that the total size
of all files across all experiments cannot exceed 64MB. If you exceed this limit,
you will not be able to upload new files or save any changes.

To restore your account:

+ Delete files until total file size is under 64MB.
+ Send an email to [support@pcibex.net](mailto:support@pcibex.net) to be taken off
the exceed-quota list.

---

## Creating a PCIbex Farm account

1. Go to the PCIbex Farm [account creation page](https://farm.pcibex.net).
2. In the "New user" box, enter the following information:
   + In the "Username" field, enter the username that you want for your account.
   + In the "Password" field, enter the password that you want for your account.
   + In the "Verify password field", re-enter the password that you used in the
   "Password" field.
   +In the "Email" field, enter the email that you want to link
   your acccount to. PCIbex Farm does not share your email, and only sends emails
   for password retrieval purposes.
3. Click **Create account**.

---

## Using PCIbex Farm

### Script editor

Use the already givent templates or create the new code in the codespace.
Every experiment is automatically saved and in order to preview it you can click either <b>Refresh</b> to see it right in the same tab or the button <b>Open in new tab</b> to see it in the new tab.

Use resources tab to add a new csv table or html file, scripts tab to add a new javascript file, aesthetics to add the design to your experiment by adding css files. PennController is located in the modules tab.

### Actions

Actions are located on the right side of your script editor and they have following functions:

+ **Results**: To preview your results file
+ **Share**: To share either demonstration link or data-collection link to other users and participants
+ **Download**: To download project to your device
+ **Git sync**: To import existing git repository to your project
+ **Settings**: To add a description to your experiment and to change whether the project can be cloned or not



### Debugger

Debug window will show all the potential errors in your code/development. 

It is **strongly** recommended that you keep the Debug window *on* until you actually start collecting data from external participants and are no longer editing your project; you should keep it on even for you last test-runs. The debugger can provide you with helpful error and log messages which will save you a valuable amount of time and efforts in troubleshooting your experiments.

Once you are ready to collect data and are no longer editing your project, turn the debugger off by using the command [`DebugOff`]({{site.baseurl}}/global-commands/debugoff).

#### Tabs

+ **Info**: Displays information about the current trial (label, index, etc.)
+ **Sequence**: Lists all trials, and allows you to skip to any particular trial using the *Reach* button
+ **Tables**: Lists all tables. Double-click a table to open a preview tab
+ **Errors**: Presents any error messages. The error messages will help you identify what to fix in your script
+ **Logs**: Reports whenever a command is executed on an element, or whenever a resource is successfully preloaded. It also includes a _Next command_ button in case the current command crashed, and a _Next trial_ button in case the current trial crashed
