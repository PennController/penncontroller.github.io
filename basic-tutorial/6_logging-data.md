---

title: 6. Logging data
nav_order: 6
blurb: How to collect and examine experimental data.
---

 how to collect and examine experimental data
  + Reading a PennController results file.
  + Comparing timestamps to calculate response time.

---

## Some h2

By default, PennController logs only when a trial starts and when it ends. Use the [`log`]({{site.baseurl}}/commands/standard-element-commands/standard-log){:target="_blank"} command to collect any other information.

The `log` command adds lines to the `results` file in the experiment project page's **Results** folder. The information that is added depends on the element type that the `log` command is called on. To learn what information is added by calling `log` on a specific element type, visit that element type’s reference page under [Elements]({{site.baseurl}}/elements){:target="_blank"}.

{% capture instructions %}
+ Uncomment the [`DebugOff`]({{site.baseurl}}/commands/global-commands/debugoff){:target="_blank"} command, since we are now ready to collect data.
+ Call the [`log`]({{site.baseurl}}/elements/canvas/canvas-log){:target="_blank"} command on the `"side-by_side"` `Canvas` to log when the images are printed to the screen.
+ Call the [`log`]({{site.baseurl}}/elements/key/key-log){:target="_blank"} command on the `"keypress"` `Key` to log information about the participant's keypress.

<pre><code class="language-diff-javascript diff-highlight"> 
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
@
@// Turn off debugger
!DebugOff()
@
@// Instructions
@// code omitted in interest of space
@
@// Experimental trial
@newTrial("experimental-trial",
@    newAudio("fish-audio", "2fishRoundTank.mp3")
@        .play()
@    ,
@    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
@        .center()
@        .unfold(2676)
@    ,
@    newImage("fish-plural", "2fishRoundTank.png")    
@        .size(200, 200)
@    ,
@    newImage("fish-singular", "1fishSquareTank.png")
@        .size(200, 200)
@    ,   
@    newCanvas("side-by-side", 450,200)
@        .add(  0, 0, getImage("fish-plural"))
@        .add(250, 0, getImage("fish-singular"))
@        .center()
@        .print()
+        .log()
@    ,
@    newKey("keypress", "FJ")
+        .log()
@        .wait()
@    ,
@    getAudio("fish-audio")
@        .wait("first")
@)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

### Collecting data

{% capture instructions %}
Run the experiment to log data and look at the logged data:

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

### Examining experimental results

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
1603390913,SOME_MD5_HASH,PennController,0,0,instructions,NULL,PennController,0,_Trial_,Start,1603390891064,NULL
1603390913,SOME_MD5_HASH,PennController,0,0,instructions,NULL,PennController,0,_Trial_,End,1603390892111,NULL
1603390913,SOME_MD5_HASH,PennController,1,0,experimental-trial,NULL,PennController,1,_Trial_,Start,1603390892115,NULL
1603390913,SOME_MD5_HASH,PennController,1,0,experimental-trial,NULL,Canvas,side-by-side,Print,NA,1603390892122,NULL
1603390913,SOME_MD5_HASH,PennController,1,0,experimental-trial,NULL,Key,keypress,PressedKey,F,1603390893835,Wait success
1603390913,SOME_MD5_HASH,PennController,1,0,experimental-trial,NULL,PennController,1,_Trial_,End,1603390894815,NULL
</code></pre>

Rows that begin with the pound symbol `#` are either:

+ Comments that either provide logging meta-information; or
+ Column names for the comma-separated values. 

Rows that do not begin with the pound symbol are logged information.

Relevant information contained in the five rows at the bottom:

1. `"instructions"` trial: started at the timestamp `1603390891064`.
2. `"instructions"` trial: ended at the timestamp `1603390892111`.
3. `"experimental-trial"` trial: started at the timetamp `1603390892115`.
4. `"side-by-side"` `Canvas` was printed at the timestamp `1603390892122`.
5. `"keypress"` `Key`: the participant pressed the `F` key at the timestamp `1603390893835`.
6. `"experimental-trial"` trial: ended at the timestamp `1603390894815`.

The timestamps are Unix timestamps in milliseconds, in other words the number of milliseconds since 00:00:00 UTC on January 1, 1970.

---

## Calculating response times

You can compare timestamps to determine response times or event duration. For example, subtract the canvas timestamp from the keypress timestamp to determine how long it took for the participant to press a valid key: `1603390893835`-`1603390892122`=`1713` means that the participant took 2753ms to press the `F` key.

We recommend using the canvas and keypress timestamps to calculate response time, instead of using the trial start and keypress timestamp. We'll [add a one-second delay trial delay]({{site.baseurl}}/advanced-tutorial#adding-a-trial-delay){:target="_blank"} in the **Advanced Tutorial**, meaning that using the trial start timestamp would artificially inflate the response time by at least 1000ms.
