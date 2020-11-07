---
layout: default
title: Enhancing aesthetics
parent: Basic Tutorial
nav_order: 6
---

## {{ page.title }}

PennController has a variety of commands that manipulate aesthetic aspects of element with multimedia content. 

For example:
+ [`center`]({{site.baseurl}}/docs/standard-element-commands/standard-center){:target="_blank"}: Centers a printed element on its horizontal axis.
+ [`unfold`]({{site.baseurl}}/docs/text/text-unfold){:target="_blank"}: "Unfolds" a **Text** element in a specified number of milliseconds, instead of printing it to the screen immediately.
+ [`size`]({{site.baseurl}}/docs/standard-element-commands/standard-size){:target="_blank"}: Resizes a printed element to a specified width by height in pixels.

{% capture instructions %}
+ Center the `"fish-sentence"` **Text**, and unfold it in 2676ms (the duration of `2fishRoundTank.mp3`).
+ Create an **Image** named `"fish-singular"` that contains the image `1fishSquareTank.png`.
+ Resize the `"fish-plural"` and `"fish-singular"` **Image** elements to 200x200 px.

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
*    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
+        .center()
+        .unfold(2676)
-        .print()
*    ,
*    newImage("fish-plural", "2fishRoundTank.png")    
+        .size(200, 200)
*        .print()
+    ,
+    newImage("fish-singular", "1fishSquareTank.png")
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

+ [Pass coordinates to the `print` command]({{site.baseurl}}/docs/standard-element-commands/standard-print#optional-arguments){:target="_blank"} to control where the element is printed on the screen; or
+ Create a [**Canvas**]({{site.baseurl}}/docs/elements/canvas){:target="_blank"}, which defines a transparent surface onto which elements can be placed at specific coordinates.

{% capture instructions %}
+ Create a centered **Canvas** named `"side-by-side"` that is 450x200 px (width x height).
  1. Call the [`add`]({{site.baseurl}}/docs/canvas/canvas-add){:target="_blank"} command to add the `"fish-plural"` and `"fish-singular"` **Image** elements at the `(x=0, y=0)` and `(x=250, y=0)` coordinates, respectively.
  2. Print the **Canvas**. You do not need to call the `print` command on the `"fish-plural"` and `"fish-singular"` **Image** elements.

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
*    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
*        .center()
*        .unfold(2676)
*    ,
*    newImage("fish-plural", "2fishRoundTank.png")    
*        .size(200, 200)
-        .print()
*    ,
*    newImage("fish-singular", "1fishSquareTank.png")
*        .size(200, 200)
-        .print()
+    ,   
+    newCanvas("side-by-side", 450,200)
+        .add(  0, 0, getImage("fish-plural"))
+        .add(250, 0, getImage("fish-singular"))
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
{% endcapture %}
{% include instructions.html text=instructions%}

