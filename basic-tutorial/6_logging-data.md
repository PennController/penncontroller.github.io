---
title: 6. Logging data
nav_order: 6
blurb: How to collect and examine results.
---

In this section, we'll collect and examine actual experimental results.
{: .h1-blurb }

---

## Collecting information from elements

When you run an experiment, by default PennController logs only when each trial
starts and ends. You must call the
[`log`]({{site.baseurl}}/standard-element-commands/standard-log)
command on each element that you're interested in in order to collect information
about it.

{% capture instructions %}
1. Call the [`log`]({{site.baseurl}}/canvas/canvas-log) command on the
`"side-by-side"` Canvas to log when it's printed to the screen.
2. Call the [`log`]({{site.baseurl}}/key/key-log) command on the
`"keypress"` Key to log information about the participant's keypress.

<pre><code class="language-diff-javascript diff-highlight">
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
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

---

## Running the experiment

We're finally ready to run the experiment and collect some data!

{% capture instructions %}
1. Click **...** to the right of **Results** to open a modal window.
<!-- 1. Click the **Unpublished** toggle in the **Actions** panel to change the -->
<!-- experiment from unpublished to published. -->
2. Make sure the dropdown list says _**UN**published_, check the box to the left of "Delete anyway"
and click **Delete all results** to start with a clean slate.
<!-- 2. Click **Share** and copy the link in the **Data-collection link** field. -->
3. Click **Open in new tab** and take a full run of the experiment.
<!-- 3. Paste the experiment link into a new tab to run the experiment. -->
4. Click **Results** to open the results file.
{% endcapture %}
{% include instructions.html text=instructions%}

### Examining experimental results

The results file should look like this:

<pre><code class="language-none" style="white-space:pre;">
# Published experiment
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

We're interested in the five rows at the bottom, which tell us that:

1. The `"instructions"` trial started at the timestamp `1603390891064`.
2. The `"instructions"` trial ended at the timestamp `1603390892111`.
3. The `"experimental-trial"` trial started at the timetamp `1603390892115`.
4. The `"side-by-side"` `Canvas` was printed at the timestamp `1603390892122`.
5. The `"keypress"` `Key` had a value of `F` at the timestamp `1603390893835`.
6. The `"experimental-trial"` trial ended at the timestamp `1603390894815`.

The timestamps are Unix timestamps in milliseconds, the number of milliseconds
since 00:00:00 UTC on January 1, 1970.

---

## Calculating response times

In general, we aren't interested in the value of a single timestamp, but rather
in the difference between timestamps. This difference can help us determine
response times or event durations.

For example, we can subtract the Canvas timestamp from the Key timestamp to
determine how long it took for the participant to press a valid key. In this
experiment, the participant took 1713ms to press the `F` key
(`1603390893835`-`1603390892122`=`1713`).

This experiment only has a single trial and run, so it's hard to analyse the
results. In the
[**Advanced Tutorial**]({{site.baseurl}}/advanced-tutorial),
we'll add more trials and runs, and perform more interesting analyses.

## Collecting actual data

Once you have examined and successfully analyzed the data from your test runs,
you will no longer edit your project. At this point (and not sooner)
you are ready to publish your experiment:

{% capture instructions %}
1. Add the [`DebugOff`]({{site.baseurl}}/global-commands/debugoff) command
to turn off the debugger, since we're now done writing the experiment script.  
2. Click the **Unpublished** toggle in the **Actions** panel to change the
experiment from unpublished to published.
3. Click **Share** and copy the link in the **Data-collection link** field.
4. Paste the experiment link into a new tab to take one final test-run
to make sure publishing your experiment did not introduce new issues
(it should not)
5. Click **Results** to open the data-collection results file and analyze it one more time

<pre><code class="language-diff-javascript diff-highlight">
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
@
+// Turn off debugger
+DebugOff()
@
@// code omitted in interest of space
</code></pre>

{% endcapture %}
{% include instructions.html text=instructions%}
