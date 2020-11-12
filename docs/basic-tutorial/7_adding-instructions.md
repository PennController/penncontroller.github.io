---
layout: default
title: Adding instructions
parent: Basic Tutorial
nav_order: 7
---

## {{ page.title }}

As the writers of the **BasicTutorial** experiment, we know that the participant must press the `F` or `J` key to select an image. However, a naive participant will need instructions.

{% capture instructions%}
+ Create a trial labeled `"instructions"` with centered **Text** instructions. 
+ Create a centered [**Button**]({{site.baseurl}}/docs/elements/button){:target="_blank"} named `"wait"` that pauses experiment script execution until the participant clicks it.

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
+// Instructions
+newTrial("instructions",
+    newText("instructions-1", "Welcome!")
+        .center()
+        .print()
+    ,
+    newText("instructions-2", "&lt;p&gt;In this experiment, you will hear and read a sentence, and see two images.&lt;/p&gt;")
+        .center()
+        .print()
+    ,
+    newText("instructions-3", "&lt;b&gt;Select the image that better matches the sentence:&lt;/b&gt;")
+        .center()
+        .print()
+    ,
+    newText("instructions-4", "&lt;p&gt;Press the &lt;b&gt;F&lt;/b&gt; key to select the image on the left.&lt;br&gt;Press the &lt;b&gt;J&lt;/b&gt; key to select the image on the right.&lt;/p&gt;")
+        .center()
+        .print()
+    ,
+    newButton("wait", "Click to start the experiment")
+        .center()
+        .print()
+        .wait()
+)
*
*// Experimental trial
*// code omitted in interest of space
</code></pre>

The `<p></p>`, `<b></b>`, and `<br>` are HTML tags that [define a paragraph](https://www.w3schools.com/tags/tag_p.asp){:target="_blank"}, [define bolded text](https://www.w3schools.com/tags/tag_b.asp){:target="_blank"}, and [define a line break](https://www.w3schools.com/tags/tag_br.asp){:target="_blank"}, respectively.

+ With HTML tags:
  <img class="mt-2 dotted-grey-dk-000" src="{{site.baseurl}}/assets/tutorials/with-html.png">
+ Without HTML tags:
  <img class="mt-2 dotted-grey-dk-000" src="{{site.baseurl}}/assets/tutorials/without-html.png">
{% endcapture %}
{% include instructions.html text=instructions %}

### Setting default commands

All of the **Text** elements in the `"instructions"` trial are centered and printed to the screen. Instead of calling the `center` and `print` commands on every **Text** element, you can call the `center` and `print` commands once on the default `Text` element type object.

Every element type has a corresponding default object, for example `defaultText`. An element type's default object is accessed by calling `defaultX`, where `X` is an element type.

Any commands that are called on an element type's default object are called on all subsequent instances of that element type **within the same trial**. Instances of that element type in other trials are not affected.

{% capture instructions%}
Call the [`center`]({{site.baseurl}}/docs/standard-element-commands/standard-center){:target="_blank"} and [`print`]({{site.baseurl}}/docs/standard-element-commands/standard-print){:target="_blank"} commands on the `defaultText` object in the `"instructions"` trial:

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
*// Instructions
*newTrial("instructions",
+    defaultText
+        .center()
+        .print()
+    ,
+    newText("instructions-1", "Welcome!")
-        .center()
-        .print()
+    ,
+    newText("instructions-2", "&lt;p&gt;In this experiment, you will hear and read a sentence, and see two images.&lt;/p&gt;")
-        .center()
-        .print()
+    ,
+    newText("instructions-3", "&lt;b&gt;Select the image that better matches the sentence:&lt;/b&gt;")
-        .center()
-        .print()
+    ,
+    newText("instructions-4", "&lt;p&gt;Press the &lt;b&gt;F&lt;/b&gt; key to select the image on the left.&lt;br&gt;Press the &lt;b&gt;J&lt;/b&gt; key to select the image on the right.&lt;/p&gt;")
-        .center()
-        .print()
*    ,
*    newButton("wait", "Click to start the experiment")
*        .center()
*        .print()
*        .wait()
*)
*
*// Experimental trial
*// code omitted in interest of space
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

### Adding instructions to the same trial (optional) 

We recommend creating a separate `"instructions"` trial in preparation for the [**Advanced Tutorial**]({{site.baseurl}}/docs/advanced-tutorial){:target="_blank"}, but you can also add instructions to the `"experimental-trial"` trial.

{% capture content %}

Add instructions to the `"experimental-trial"` trial:

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
+    defaultText
+        .center()
+        .print()
+    ,
+    newText("instructions-1", "Welcome!")
+    ,
+    newText("instructions-2", "&lt;p&gt;In this experiment, you will hear and read a sentence, and see two images.&lt;/p&gt;")
+    ,
+    newText("instructions-3", "&lt;b&gt;Select the image that better matches the sentence:&lt;/b&gt;")
+    ,
+    newText("instructions-4", "&lt;p&gt;Press the &lt;b&gt;F&lt;/b&gt; key to select the image on the left.&lt;br&gt;Press the &lt;b&gt;J&lt;/b&gt; key to select the image on the right.&lt;/p&gt;")
+    ,
+    newButton("wait", "Click to start the experiment")
+        .center()
+        .print()
+        .wait()
+    ,
*    newAudio("fish-audio", "2fishRoundTank.mp3")
*        .play()
*    ,
*    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
-        .center()
*        .unfold(2676)
*    ,
*    newImage("fish-plural", "2fishRoundTank.png")    
*        .size(200, 200)
*    ,
*    newImage("fish-singular", "1fishSquareTank.png")
*        .size(200, 200)
*    ,   
*    newCanvas("side-by-side", 450,200)
*        .add(  0, 0, getImage("fish-plural"))
*        .add(250, 0, getImage("fish-singular"))
*        .center()
*        .print()
*    ,
*    newKey("keypress", "FJ")
*        .wait()
*    ,
*    getAudio("fish-audio")
*        .wait("first")
*)
</code></pre>

All of the printed elements will be printed on the same screen, which may be undesirable:

<img src="{{site.baseurl}}/assets/tutorials/no-clear.png" width="100%" height="auto" class="mt-2" style="border: 1px dotted gray;">

Use the special command [`clear`]({{site.baseurl}}/docs/special-commands/clear){:target="_blank"} to remove all currently printed elements from the screen. 

Special commands are not called on an element. They are called within the opening and closing parentheses of a `newTrial` command and separated from other objects by a comma, similar to the `newX` and `getX` functions.

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
*    defaultText
*        .center()
*        .print()
*    ,
*    newText("instructions-1", "Welcome!")
*    ,
*    newText("instructions-2", "&lt;p&gt;In this experiment, you will hear and read a sentence, and see two images.&lt;/p&gt;")
*    ,
*    newText("instructions-3", "&lt;b&gt;Select the image that better matches the sentence:&lt;/b&gt;")
*    ,
*    newText("instructions-4", "&lt;p&gt;Press the &lt;b&gt;F&lt;/b&gt; key to select the image on the left.&lt;br&gt;Press the &lt;b&gt;J&lt;/b&gt; key to select the image on the right.&lt;/p&gt;")
*    ,
*    newButton("wait", "Click to start the experiment")
*        .center()
*        .print()
*        .wait()
+    ,
+    clear()
*    ,
*    newAudio("fish-audio", "2fishRoundTank.mp3")
*        .play()
*    ,
*// code omitted in interest of space   
*)
</code></pre>
{% endcapture %}
{% include collapsible-block.html content=content summary="Click for more details" inner-border=true %}
