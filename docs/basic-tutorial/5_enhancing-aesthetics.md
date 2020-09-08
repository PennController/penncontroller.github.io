---
layout: default
title: Enhancing aesthetics
parent: Basic Tutorial
---

## {{ page.title }}

PennController has a variety of commands that manipulate aesthetic aspects of element with visual content. 

For example, the [`center`]({{site.baseurl}}/docs/action-commands/standard-center){:target="_blank"} command centers an element on the horizontal axis, and the [`size`]({{site.baseurl}}/docs/action-commands/standard-size){:target="_blank"} command resizes an element to a specified width by height in pixels dimension.

{% capture instructions %}
Add a new **Image** element, center the `"fish-description"` **Text** element, and resize the two **Image** elements to 200x200px:

<pre><code class="language-diff-javascript diff-highlight"> 
*// This is the BasicTutorial experiment.
*// Type code below this line.
*// Remove command prefix
*PennController.ResetPrefix(null)
*
*// Turn off debugger
*// DebugOff()
*
*newTrial("first-trial",
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
+         .center()
*         .print()
*    ,
*    newImage("fish-round", "2fishRoundTank.png")    
+         .size(200, 200)
*         .print()
+    ,
+    newImage("fish-square", "1fishSquareTank.png")
+         .size(200, 200)
+         .print()
*    ,
*    newKey("keypress", "FJ")
*         .wait()
*)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

### Manipulating layout

By default, every printed element is printed on a new line. For any other layout, use a [**Canvas**]({{site.baseurl}}/docs/elements/canvas){:target="_blank"}, which creates a transparent surface that can be used to place elements at specific coordinates.

{% capture instructions %}
Define a 450x200 px **Canvas** and print the `"fish-round"` and `"fish-square"` **Image** elements next to each other with a 50px gap:

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
*newTrial("first-trial",
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
*         .center()
*         .print()
*    ,
*    newImage("fish-round", "2fishRoundTank.png")    
*         .size(200, 200)
!         // .print()
*    ,
*    newImage("fish-square", "1fishSquareTank.png")
*         .size(200, 200)
!         // .print()
+    ,   
+   	newCanvas("side-by-side", 450,200)
+        .add(  0, 0, getImage("fish-round"))
+        .add(250, 0, getImage("fish-square"))
+        .center()
+        .print()
*    ,
*    newKey("keypress", "FJ")
*         .wait()
*)
</code></pre>

+ `"fish-round"` is added to the (x=0, y=0) coordinate of the `"side-by-side"` **Canvas**.
+ `"fish-square"` is added to the (x=250, y=0) coordinate of the `"side-by-side"`  **Canvas**.
+ If you call `print` on a **Canvas** element, do not call `print` directly on the elements that have been added to the **Canvas**.
{% endcapture %}
{% include instructions.html text=instructions%}

### Adding instructions

As the writers of the **BasicTutorial** experiment, we know that the `"first-trial"` **Trial** waits for the participant to press the `F` or `J` key before the experiment continues. However, a naive participant has no way of knowing this. 

{% capture instructions %}
Add a **Text** element with centered and italicized instructions:

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
*newTrial("first-trial",   
+    newText("instructions", "Press the F key if the image on the left matches the sentence. Press the K key if the image on the right matches the sentence.")
+        .center()
+        .italic()
+        .print()
+    ,
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
*)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}