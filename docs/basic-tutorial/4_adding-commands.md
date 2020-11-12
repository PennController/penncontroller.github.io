---
layout: default
title: Adding commands
parent: Basic Tutorial
nav_order: 4
---

## {{ page.title }}

Elements contain content; element commands do things with that content. For example, once you create an element, you can use the element command [`print`]({{site.baseurl}}/docs/standard-element-commands/standard-print){:target="_blank"} to print it to the screen.

The command types:

+ [Element commands]({{site.baseurl}}/docs/core-concepts/commands#element-commands){:target="_blank"}: used within a trial and called on an element
  + [Action commands]({{site.baseurl}}/docs/core-concepts/commands#action-commands){:target="_blank"}: directly manipulates an element
  + [Test commands]({{site.baseurl}}/docs/core-concepts/commands#test-commands){:target="_blank"}: runs some test on an element
+ [Global commands]({{site.baseurl}}/docs/core-concepts/commands#global-commands){:target="_blank"}: used outside of a trial
+ [Special commands]({{site.baseurl}}/docs/core-concepts/commands#special-commands){:target="_blank"}: used within a trial, but not called on an element

{% capture label %}
This tutorial uses the term “command” as shorthand for “action command”. If a test, global or special command is intended, the term "test command", “global command”, or "special command" will be used.
{% endcapture %}
{% include label-note.html label-body=label %}

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

To learn about calling other types of commands, read the [Commands documentation page]({{site.baseurl}}/docs/core-concepts/commands){:target="_blank"}.

{% capture instructions %}
+ Call the [`play`]({{site.baseurl}}/docs/audio/audio-play){:target="_blank"} command on the `"fish-audio"` **Audio** to start audio playback.
+ Call the [`print`]({{site.baseurl}}/docs/standard-element-commands/standard-print){:target="_blank"} command on the `"fish-sentence"` **Text** and `"fish-plural"` **Image** to print them to the screen.

<pre><code class="language-diff-javascript diff-highlight"> 
*// This is the BasicTutorial experiment.
*// Type code below this line.
*
*// Remove command prefix
*PennController.ResetPrefix(null)
*
*// Turn off debugger
*// DebugOff()
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

You may be surprised by the results. When you run the experiment, you hear the audio file, but only see the message "The results were successfully sent to the server. Thanks!". 

PennController executes experiment scripts sequentially. According to the current script for the **BasicTutorial** experiment, the execution is as follows:

1. Remove the command prefix for all commands.
2. Start the `"experimental-trial"` trial.
3. Create the `"fish-audio`" **Audio** and play it.
4. Create the `"fish-sentence"` **Text** and print it.
5. Create the `"fish-plural"` **Image** and print it.
6. End the `"experimental-trial"` trial.
7. (*Built-in*): Send experiment results to the server, the PCIbex Farm. An experiment's results are logged in its project page's **Results** folder. 
  + PennController automatically sends results after all other trials have ended. To control when results are sent, see the global command [`SendResults`]({{site.baseurl}}/docs/global-commands/sendresults){:target="_blank"}.
  + PennController automatically logs when a trial starts and ends. To log other information, see [Logging data](#logging-data).
  
As the `"fish-audio"` **Audio** is playing, all of the other commands are executed. When there are no more commands to execute, the trial ends. When there are no more trials to start, the experiment sends its results and ends. And all of this occurred within a few milliseconds!
