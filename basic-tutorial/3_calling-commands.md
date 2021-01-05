---
layout: bottom-navbar-child
title: 3. Calling commands
parent: Basic Tutorial
nav_order: 3
numbered_headings: true
blurb: How to manipulate elements with commands.
---

Elements contain content that can be manipulated with commands.
{: .h1-blurb }

---

## Types of commands

There are three main types of commands:

+ [Element commands](){:target="_blank"}: Used within a trial and called on an element
+ [Global commands](){:target="_blank"}: Used outside of a trial
+ [Special commands](){:target="_blank"}: Used within a trial, but not called on an element

Element commands can be further categorized as an action command or test command:
+ Element commands
  + [Action command](){:target="_blank"}: Directly manipulates an element
  + [Test command](){:target="_blank"}: Runs a test on an element, and used to execute different code blocks depending on the success or failure of the test (the PennController equivalent of a conditional statement).

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

{% capture label %}
**This tutorial uses the term “command” as shorthand for “action command”.** If a test, global or special command is intended, the term "test command", “global command”, or "special command" will be used.
{% endcapture %}
{% include label-note.html label-body=label %}

---

## Commands

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### Command syntax

To call a command, the command:

+ Must be surrounded with `.` and `()`, for example `.print()`. The surrounding `.` and `()` are dropped when referring to a command in prose outside of a code block, for example "the `print` command".
+ Must be called on an element, in other words on an instance of the `newX` or `getX` functions. Multiple commands can be called on a single element; commands are evaluated in the order in which they are called.

Call each command on an indented new line for maximum readability:

```javascript
PennController.ResetPrefix(null)

newTrial("TRIAL_LABEL",
    newX("ELEMENT_1", ...)
        .COMMAND_1()
        .COMMAND_2()
        .COMMAND_3()
    ,
    newX("ELEMENT_2", ...)
        .COMMAND_4()
)
```

However, it is also valid to call multiple commands on a single line:

```javascript
PennController.ResetPrefix(null)

newTrial("TRIAL_LABEL",
  newX("ELEMENT_1", ...).COMMAND_1().COMMAND_2().COMMAND_3()
  ,
  newX("ELEMENT_2", ...).COMMAND_4()
)
```

To learn about calling other types of commands, read the [Commands documentation page]({{site.baseurl}}/core-concepts/3_commands){:target="_blank"}.

### Calling a command

{% capture instructions %}
+ Call the [`play`]({{site.baseurl}}/elements/audio/audio-play){:target="_blank"} command on the `"fish-audio"` **Audio** to start audio playback.
+ Call the [`print`]({{site.baseurl}}/commands/standard-element-commands/standard-print){:target="_blank"} command on the `"fish-sentence"` **Text** and `"fish-plural"` **Image** to print them to the screen.

<pre><code class="language-diff-javascript diff-highlight"> 
*// Type code below this line.
*
*// Remove command prefix
*PennController.ResetPrefix(null)
*
*// Experimental trial
*newTrial("experimental-trial",
*    newAudio("fish-audio", "2fishRoundTank.mp3")
+        .play()
*    ,
*    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
+        .print()
*    ,
*    newImage("fish-plural", "2fishRoundTank.png")    
+        .print()
*)
</code></pre>

Click **Save and test** in the script editor to run the experiment. 
{% endcapture %}
{% include instructions.html text=instructions%}

### Evaluating an experiment script

You may be surprised by the results. When you run the experiment, you hear the audio file, but only see the message "The results were successfully sent to the server. Thanks!". 

PennController executes experiment scripts sequentially. According to the current experiment script, the execution is as follows:

1. Remove the command prefix for all commands.
2. Start the `"experimental-trial"` trial.
3. Create the `"fish-audio`" **Audio** and play it.
4. Create the `"fish-sentence"` **Text** and print it.
5. Create the `"fish-plural"` **Image** and print it.
6. End the `"experimental-trial"` trial.
7. (*Built-in*): Send experiment results to the server, the PCIbex Farm. An experiment's results are logged in its project page's **Results** folder.
  + PennController automatically sends results after all other trials have ended. To control when results are sent, see the global command [`SendResults`]({{site.baseurl}}/commands/global-commands/sendresults){:target="_blank"}.
  + PennController automatically logs when a trial starts and ends. To log other information, see [Logging data](#logging-data).
  
As the `"fish-audio"` **Audio** is playing, all of the other commands are executed. When there are no more commands to execute, the trial ends. When there are no more trials to start, the experiment sends its results and ends. And all of this occurred within a few milliseconds!
