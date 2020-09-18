---
layout: default
title: Enhancing aesthetics
parent: Basic Tutorial
---

## {{ page.title }}

PennController has a variety of commands that manipulate aesthetic aspects of element with multimedia content. 

For example:
+ [`center`]({{site.baseurl}}/docs/action-commands/standard-center){:target="_blank"}: centers a printed element on its horizontal axis.
+ [`unfold`]({{site.baseurl}}/docs/action-commands/text-unfold){:target="_blank"}: "unfolds" a **Text** element in a specified number of milliseconds, instead of printing it to the screen immediately.
+ [`size`]({{site.baseurl}}/docs/action-commands/standard-size){:target="_blank"}: resizes a printed element to a specified width by height in pixels.

{% capture instructions %}
+ Add a new **Image** element.
+ Center the `"fish-description"` **Text** element.
+ Unfold the `"fish-description"` **Text** element in 2600ms, so that it unfolds as the `"fish-audio"` **Audio** element is playing. THe `2fishRoundTank.mp3` file is actually 2676ms long, but it is good to have a small buffer between the end of unfolding and the end of audio playback.
+ Resize the two **Image** elements to 200x200px.

*If you are copy and pasting this code, delete any lines highlighted with a red background.*
<pre><code class="language-diff-javascript diff-highlight"> 
*// This is the BasicTutorial experiment.
*// Type code below this line.
*// Remove command prefix
*PennController.ResetPrefix(null)
*
*// Turn off debugger
*// DebugOff()
*
*// Experimental trial
*newTrial("experimental-trial",
*    newAudio("fish-audio", "2fishRoundTank.mp3")
*        .play()
*    ,
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
+        .center()
+        .unfold(2600)
-        .print()
*    ,
*    newImage("fish-round", "2fishRoundTank.png")    
+        .size(200, 200)
*        .print()
+    ,
+    newImage("fish-square", "1fishSquareTank.png")
+        .size(200, 200)
+        .print()
*    ,
*    newKey("keypress", "FJ")
*         .wait()
*    ,
*    getAudio("fish-audio")
*        .wait("first")
*)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

### Manipulating layout

By default, every printed element is printed on a new line. For other layouts:

+ [Pass coordinates to the `print` command]({{site.baseurl}}/docs/action-commands/standard-print) to control where the element is printed on the screen; or
+ Create a [**Canvas**]({{site.baseurl}}/docs/elements/canvas){:target="_blank"}, which defines a transparent surface onto which elements can be placed at specific coordinates.

{% capture instructions %}
+ Create a 450x200 px **Canvas** .
+ Place the `"fish-round"` and `"fish-square"` **Image** elements next to each other with a 50px gap.

*If you are copy and pasting this code, delete any lines highlighted with a red background.*
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
*        .play()
*    ,
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
*        .center()
*        .unfold(2600)
*    ,
*    newImage("fish-round", "2fishRoundTank.png")    
*        .size(200, 200)
-        .print()
*    ,
*    newImage("fish-square", "1fishSquareTank.png")
*        .size(200, 200)
-        .print()
+    ,   
+    newCanvas("side-by-side", 450,200)
+        .add(  0, 0, getImage("fish-round"))
+        .add(250, 0, getImage("fish-square"))
+        .center()
+        .print()
*    ,
*    newKey("keypress", "FJ")
*         .wait()
*    ,
*    getAudio("fish-audio")
*        .wait("first")
*)
</code></pre>

+ `"fish-round"` is added to the (x=0, y=0) coordinate of the `"side-by-side"` **Canvas**.
+ `"fish-square"` is added to the (x=250, y=0) coordinate of the `"side-by-side"`  **Canvas**.
+ If you call `print` on a **Canvas** element, do not call `print` on the elements that have been added to the **Canvas**.
{% endcapture %}
{% include instructions.html text=instructions%}

