---
layout: default
title: Logging data
parent: Basic Tutorial
---

## {{ page.title }}

By default, PennController logs only when a trial starts and when it ends. You must use the `log` command to collect any other information. 

The [`log`]({{site.baseurl}}/docs/action-commands/standard-log){:target="_blank"} command adds lines to the `results` file in the **Results** folder. The information that is added depends on the element type that the `log` command is called on. To learn what information is added by calling `log` on a specific element type, visit that element type’s reference page under [Elements]({{site.baseurl}}/docs/elements){:target="_blank"}.

{% capture instructions %}
Log information from the `"keypress"` **Key** element and uncomment the `DebugOff` command, since we are now ready to collect data:

<pre><code class="language-diff-javascript diff-highlight"> 
*// This is the BasicTutorial experiment.
*// Type code below this line.
*
*// Remove command prefix
*PennController.ResetPrefix(null)
*
*// Turn off debugger
!DebugOff()
*
*newTrial("first-trial",
*    newText("instructions", "Press the F key if the image on the left matches the sentence. Presss the K key if the image on the right matches the sentence.")
*        .center()
*        .italic()
*        .print()
*    ,
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
*        .center()
*        .print()
*    ,
*    newImage("fish-round", "2fishRoundTank.png")    
*        .size(200, 200)
*        // .print()
*    ,
*    newImage("fish-square", "1fishSquareTank.png")
*        .size(200, 200)
*        // .print()
*    , 
*   	newCanvas("side-by-side", 450,200)
*        .add(  0, 0, getImage("fish-round"))
*        .add(250, 0, getImage("fish-square"))
*        .center()
*        .print()
*    ,
*    newKey("keypress", "FJ")
*         .wait()
+         .log()
)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

### Examining results

{% capture instructions %}
Run the experiment to log data, and then look at the logged data:

1. Save and close the `main.js` file.
2. In the **Results** folder, delete any existing files.
3. Click the link at the top of the experiment project page to run the experiment.
4. Complete the experiment.
5. Click the **Results** folder refresh icon.
6. Open the `results` file:
   + Click on *results* to open the `results` file as a pop-up window in the experiment project page; or
   + Click on the eye icon under *results* to open the `results` file in a new tab; or
   + Right-click on the eye icon, click *Save Link As...*, enter `"results.csv"` in the "Save As:" field, and click **Save** to save the `results` file as a comma-separated value (CSV) file.
{% endcapture %}
{% include instructions.html text=instructions%}

The `results` file should look like the following:

```html
#
# Results on...
# USER...
# Design number...
#
# Columns below this comment are as follows:
# 1. Time results were received.
# 2. MD5 hash of participant's IP address.
# 3. Controller name.
# 4. Item number.
# 5. Element number.
# 6. Type.
# 7. Group.
# 8. PennElementType.
# 9. PennElementName.
# 10. Parameter.
# 11. Value.
# 12. EventTime.
# 13. Comments.
1598318358,<SOME_MD5_HASH>,PennController,0,0,first-trial,NULL,PennController,0,_Trial_,Start,1598318337952,NULL
1598318358,<SOME_MD5_HASH>,PennController,0,0,first-trial,NULL,Key,keypress,PressedKey,F,1598318340287,Wait success
1598318358,<SOME_MD5_HASH>,PennController,0,0,first-trial,NULL,PennController,0,_Trial_,End,1598318340291,NULL
```

Rows that begin with the pound symbol `#` are either:

+ Comments that either provide logging meta-information; or
+ Column names for the comma-separated values. 

The three rows of interest are at the bottom, and do not begin with a pound symbol:

+ The first row logs the start of the `"first-trial"` **Trial**. 
  + `<...>,_Trial_,Start,1598318337952,<...>`
  +  The trial started at the timestamp `1598318337952`
+ The second row logs data from the `"keypress"` **Key**.
  + `<...>,Key,keypress,PressedKey,F,1598318340287,<...>`
  + The participant pressed the `F` key at the timestamp `1598318340287`
+ The third row logs the end of the `"first-trial"` **Trial**.
  + `<...>,_Trial_,End,1598318340291,<...>`
  + The trial ended at the timestamp `1598318340291`

The timestamps can be used to calculate response times. For example, subtract the trial start timestamp from the keypress timestamp: `1598318340287-1598318337952=2335`; the participant took 2335 ms to press the key.

### Wrapping up

Congratulations! You’ve created an experiment that:

+ Contains multiple elements
+ Controls element aesthetics
+ Interacts with the participant through a keypress
+ Logs experiment data

We hope that you feel like you now have a basic understand of PennController.

Next steps:

+ If you'd like to learn more about elements, commands, or trials, see the [Core concepts]({{site.baseurl}}/docs/core-concepts){:target="_blank"} page. 
+ If you'd like to learn ways to increase the complexity of your experiment, see the [Advanced tutorial]({{site.baseurl}}/docs/advanced-tutorial){:target="_blank"}.

