---
layout: default
title: Logging data
parent: Basic Tutorial
---

## {{ page.title }}

By default, PennController logs only when a trial starts and when it ends. You must use the [`log`]({{site.baseurl}}/docs/action-commands/standard-log){:target="_blank"} command to collect any other information. 

The `log` command adds lines to the `results` file in the **Results** folder. The information that is added depends on the element type that the `log` command is called on. To learn what information is added by calling `log` on a specific element type, visit that element type’s reference page under [Elements]({{site.baseurl}}/docs/elements){:target="_blank"}.

{% capture instructions %}
+ Log information from the `"keypress"` **Key** element.
+ Uncomment the `DebugOff` command, since we are now ready to collect data:

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
*newTrial("instructions",
*    defaultText
*        .center()
*        .print()
*    ,
*    newText("instructions-1", "Welcome!")
*    ,
*    newText("instructions-2", "&lt;p&gt;In this experiment, you will match a sentence with an image. You will hear and read a sentence, and see two images.&lt;/p&gt;")
*    ,
*    newText("instructions-3", "Press the &lt;b&gt;F&lt;/b&gt; key if the sentence matches the image on the left.")
*    ,
*    newText("instructions-4", "Press the &lt;b&gt;J&lt;/b&gt; key if the sentence matches the image on the right.")
*    ,
*    newText("instructions-5", "&lt;p&gt;Press the Spacebar when you are ready to start the experiment.&lt;/p&gt;")
*    ,
*    newKey("wait", " ")
*        .wait()
*)
*
*newTrial("experimental-trial",
*    newAudio("fish-audio", "2fishRoundTank.mp3")
*        .play()
*    ,
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
*        .center()
*        .print()
*    ,
*    newImage("fish-round", "2fishRoundTank.png")    
*        .size(200, 200)
*    ,
*    newImage("fish-square", "1fishSquareTank.png")
*        .size(200, 200)
*    ,   
*    newCanvas("side-by-side", 450,200)
*        .add(  0, 0, getImage("fish-round"))
*        .add(250, 0, getImage("fish-square"))
*        .center()
*        .print()
*    ,
*    newKey("keypress", "FJ")
*        .wait()
+        .log()
*    ,
*    getAudio("fish-audio")
*        .wait("first")
*)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

### Examining results

{% capture instructions %}
+ Run the experiment to log data.
+ Look at the logged data.

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

<pre><code class="language-none" style="white-space:pre;">
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
1600313870,SOME_MD5_HASH,PennController,0,0,instructions,NULL,PennController,0,_Trial_,Start,1600313848315,NULL
1600313870,SOME_MD5_HASH,PennController,0,0,instructions,NULL,PennController,0,_Trial_,End,1600313849734,NULL
1600313870,SOME_MD5_HASH,PennController,1,0,experimental-trial,NULL,PennController,1,_Trial_,Start,1600313849737,NULL
1600313870,SOME_MD5_HASH,PennController,1,0,experimental-trial,NULL,Key,keypress,PressedKey,F,1600313851242,Wait success
1600313870,SOME_MD5_HASH,PennController,1,0,experimental-trial,NULL,PennController,1,Trial_,End,1600313852445,NULL
</code></pre>

Rows that begin with the pound symbol `#` are either:

+ Comments that either provide logging meta-information; or
+ Column names for the comma-separated values. 

Rows that do not begin with the pound symbol are logged information.

Relevant information contained in the five rows at the bottom:

1. `"instructions"` **Trial**: started at the timestamp `1598318337952`.
2. `"instructions"` **Trial**: ended at the timestamp `1600313849734`.
3. `"experimental-trial"` **Trial**: started at the timetamp `1600313849737`.
4. `"keypress"` **Key**: the participant pressed the `F` key at the timestamp `1600313851242`.
5. `"experimental-trial"` **Trial**: ended at the timestamp `1600313852445`.

The timestamps are Unix timestamps in milliseconds, in other words the number of milliseconds since 00:00:00 UTC on January 1, 1970.

You can compare timestamps to determine response times or event duration. For example, subtract the trial start timestamp from the keypress timestamp to determine how long it took for the participant to press a valid key: `1600313851242`-`1600313849737`=`1505` means that the participant took 1505ms to press the `F` key.
