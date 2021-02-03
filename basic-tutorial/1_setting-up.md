---
title: 1. Setting up
nav_order: 1
blurb: How to use PennController and the PCIbex Farm.
previous_page: Basic Tutorial
---

## The PCIbex Farm

The easiest way to use PennController is by using the free
[PCIbex Farm](https://farm.pcibex.net/){:target="_blank"} server. The PCIbex Farm
builds and hosts PennController experiments for you, meaning that you can focus
on writing your experiment scripts.

For more information, see
[Core Concepts > PCIbex Farm]({{site.baseurl}}/core-concepts/4_pcibex-farm).

### Creating a PCIbex Farm account

{% capture instructions %}

1. Go to the PCIbex Farm [account creation page](https://farm.pcibex.net).
2. In the "New user" box, enter the following information:
   + In the "Username" field, enter the username that you want for your account.
   + In the "Password" field, enter the password that you want for your account.
   + In the "Verify password field", re-enter the password that you used in the
   "Password" field.
   + In the "Email" field, enter an email that you want to link your
   acccount to. PCIbex Farm does not share your email, and only sends emails for
   password retrieval purposes.
3. Click **Create account**.
{% endcapture %}
{% include instructions.html text=instructions%}

### Starting the experiment

{% capture instructions %}
Go to the [PCIbex Farm code editor](https://farm.pcibex.net/experiments/new?from=aplwij){:target="_blank"}.
{% endcapture %}
{% include instructions.html text=instructions%}

### Editing an experiment

The **Script** folder contains the file `main.js`, the experiment script. Update
your experiment by editing `main.js` in the script editor and saving your changes.

Run an experiment by clicking "Open in new tab".

The script editor has the following features:

+ Two buttons at the bottom
  + **Refresh**: Save changes and see changes without closing the script editor.
  + **Open in new tab**: Preview experiment in the new tab.
+ Six buttons on the right side
  + **Publish**: To publish the experiment
  + **Share**: To share the experiment with others
  + **Download**: To save your project locally
  + **Git Sync**: To import already existing experiment
  + **Settings**: Customize the settings such as if your project can be cloned, or add a description to your project.
  
---

## Creating a trial

Create a trial by calling the
[<code>PennController.newTrial("<var>TRIAL_LABEL</var>,...")</code>]({{site.baseurl}}/global-commands/newtrial)
command, where:

+ <code>"<var>TRIAL_LABEL</var>"</code> is the label/name of the trial (optional,
but highly recommended)
+ `...` refers to sequences of elements and commands that define what happens
in the trial

{% capture instructions %}

1. Click **main.js** to open `main.js` in the script editor
2. Create a trial labeled `"experimental-trial"`:

<pre><code class="language-diff-javascript diff-highlight"> 
@// Type code below this line.
@
+// Experimental trial
+PennController.newTrial("experimental-trial")
</code></pre>

At this point, we've created an empty trial that does not do or contain anything.
If you run the experiment, it'll end immediately with the message
"The results were successfully sent to the server. Thanks!".
{% endcapture %}
{% include instructions.html text=instructions%}

### Removing the `PennController.` prefix

All PennController commands begin with the prefix `PennController.`, in order to
avoid naming conflicts with other JavaScript modules. The command
[`PennController.ResetPrefix(null)`]({{site.baseurl}}/global-commands/resetprefix)
removes the prefix for all subsequent commands. You can also pass a string
instead of `null` as an argument, which will reset the `PennController.` prefix
to the aforementioned string for all subsequent commands. 

**We recommend calling `PennController.ResetPrefix(null)` at the start of every**
**experiment script for readability and convenience.**

{% capture instructions %}
Remove the `PennController.` prefix:

<pre><code class="language-diff-javascript diff-highlight">
@// Type code below this line.
@
+// Remove command prefix
+PennController.ResetPrefix(null)
@
@// Experimental trial
!newTrial("experimental-trial")
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

{% capture label %}
From this point on, this tutorial assumes that the `PennController.` prefix
has been removed. For example, in prose we'll say "the `newTrial` command"
instead of "the `PennController.newTrial` command". 

The exception is the `PennController.ResetPrefix` command, which must have
the `PennController.` prefix when it's first called.
{% endcapture %}
{% include label-note.html label-body=label %}

---

## Using the debugger

PennController comes with a
[built-in debugger]({{site.baseurl}}/core-concepts/debugger)
that helps detect typos, syntax errors, and other issues.

It appears as a small window in the bottom-right corner of the screen when you
run an experiment:

![debugger]({{site.baseurl}}/assets/images/debugger.png)

 The debugger window has five tabs:

+ **Info**: Displays information about the current trial.
+ **Sequence**: Lists all trials, and allows you to skip to any particular trial.
+ **Tables**: Lists all tables.
+ **Errors**: Presents any error messages.
+ **Log**: Reports whenever a command is executed on an element, or whenever a
resource is successfully preloaded.

These tabs might not make sense until you learn more about PennController experiments,
but the important part to know is that **you should use the debugger as you build and test an experiment**.
You'll inevitably face problems, and the debugger will make it easier to solve them.

Turn off the debugger with the
[`DebugOff`]({{site.baseurl}}/commands/global-commands/debugoff)
command when you're ready to publish your experiment and collect experimental data.

We recommend reading the
[Debugger documentation]({{site.baseurl}}/core-concepts/4_pcibex-farm#debugger)
after you've completed this tutorial and the
[**Advanced Tutorial**]({{site.baseurl}}/advanced-tutorial),
and are more familiar with PennController experiments.
