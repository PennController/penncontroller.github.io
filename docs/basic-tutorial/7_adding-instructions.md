---
layout: default
title: Adding instructions
parent: Basic Tutorial
---

## {{ page.title }}

As the writers of the **BasicTutorial** experiment, we know that the participant must press the `F` or `J` key to select an image. However, a naive participant will need instructions.

{% capture instructions%}
+ Create an `"instructions"` **Trial** with centered text. 
+ Add a **Key** element to pause experiment execution until the participant presses the Spacebar:

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
+    newText("instructions-2", "&lt;p&gt;In this experiment, you will match a sentence with an image. You will hear and read a sentence, and see two images.&lt;/p&gt;")
+        .center()
+        .print()
+    ,
+    newText("instructions-3", "Press the &lt;b&gt;F&lt;/b&gt; key if the sentence matches the image on the left.")
+       .center()
+       .print()
+    ,
+    newText("instructions-4", "Press the &lt;b&gt;J&lt;/b&gt; key if the sentence matches the image on the right.")
+        .center()
+        .print()
+    ,
+    newText("instructions-5", "&lt;p&gt;Press the Spacebar when you are ready to start the experiment.&lt;/p&gt;")
+        .center()
+        .print()
+    ,
+    newKey("wait", " ")
+        .wait()
+)
*
*// Experimental trial
*newTrial("experimental-trial ",
*    newAudio("fish-audio", "2fishRoundTank.mp3")
*        .play()
*    ,
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
*        .center()
*        .unfold(2600)
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
*         .wait()
*    ,
*    getAudio("fish-audio")
*        .wait("first")
*)
</code></pre>

The `<p></p>` and `<b></b>` are HTML tags that [define a paragraph](https://www.w3schools.com/tags/tag_p.asp){:target="_blank"} and [define bolded text](https://www.w3schools.com/tags/tag_b.asp){:target="_blank"}, respectively.

+ With `<p>` and `<b>` tags:
  <img src="{{site.baseurl}}/assets/tutorials/with-html.png" width="100%" height="auto" class="mt-2" style="border: 1px dotted gray;">
+ Without `<p>` and `<b>` tags:
  <img src="{{site.baseurl}}/assets/tutorials/without-html.png" width="100%" height="auto" class="mt-2" style="border: 1px dotted gray;">
{% endcapture %}
{% include instructions.html text=instructions %}

### Setting default commands

All of the **Text** elements in the `"instructions"` **Trial** are centered and printed to the screen. Instead of calling the `center` and `print` commands on every **Text** element, you can call the `center` and `print` commands once on the default **Text** object.

Every element type has a corresponding default object, for example `defaultText`. An element type's default object is accessed by calling `defaultX`, where `X` is an element type.

Any commands that are called on an element type's default object are called on all subsequent instances of that element type **within the same trial**. Instances of that element type in other trials are not affected.

{% capture instructions%}
Call the `center` and `print` commands on the `defaultText` object in the `"instructions"` **Trial**:

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
*    newText("instructions-1", "Welcome!")
-        .center()
-        .print()
*    ,
*    newText("instructions-2", "&lt;p&gt;In this experiment, you will match a sentence with an image. You will hear and read a sentence, and see two images.&lt;/p&gt;")
-        .center()
-        .print()
*    ,
*    newText("instructions-3", "Press the &lt;b&gt;F&lt;/b&gt; key if the sentence matches the image on the left.")
-        .center()
-        .print()
*    ,
*    newText("instructions-4", "Press the &lt;b&gt;J&lt;/b&gt; key if the sentence matches the image on the right.")
-        .center()
-        .print()
*    ,
*    newText("instructions-5", "&lt;p&gt;Press the Spacebar when you are ready to start the experiment.&lt;/p&gt;")
-        .center()
-        .print()
*    ,
*    newKey("wait", " ")
*        .wait()
*)
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
*    ,
*    getAudio("fish-audio")
*        .wait("first")
*)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

### Adding instructions to the same trial (optional) 

We recommend creating a separate `"instructions"` **Trial** in preparation for the [**Advanced Tutorial**]({{site.baseurl}}/docs/advanced-tutorial){:target="_blank"}, but you can also add instructions to the `"experimental-trial"` **Trial**.

<details markdown="block">
<summary class="text-delta collapsible-block">Click to expand/collapse code block</summary>

*Note: Even though the `print` command has been called on all **Text** elements via the `defaultText` object, the `"fish-description"` **Text** element will still unfold instead of being printed immediately.*

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
+    newText("instructions-2", "&lt;p&gt;In this experiment, you will match a sentence with an image. You will hear and read a sentence, and see two images.&lt;/p&gt;")
+    ,
+    newText("instructions-3", "Press the &lt;b&gt;F&lt;/b&gt; key if the sentence matches the image on the left.")
+    ,
+    newText("instructions-4", "Press the &lt;b&gt;J&lt;/b&gt; key if the sentence matches the image on the right.")
+    ,
+    newText("instructions-5", "&lt;p&gt;Press the Spacebar when you are ready to start the experiment.&lt;/p&gt;")
+    ,
+    newKey("wait", " ")
+        .wait()
+    ,
*    newAudio("fish-audio", "2fishRoundTank.mp3")
*        .play()
*    ,
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
-        .center()
-        .unfold(2600)
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
*    ,
*    getAudio("fish-audio")
*        .wait("first")
*)
</code></pre>
</details>

All of the printed elements are printed on the same screen, which may be undesirable:

<img src="{{site.baseurl}}/assets/tutorials/no-clear.png" width="100%" height="auto" class="mt-2" style="border: 1px dotted gray;">

Use the special command [`clear`]({{site.baseurl}}/docs/special-commands/clear){:target="_blank"} to remove all currently printed elements from the screen. 

<details markdown="block">
<summary class="text-delta collapsible-block">Click to expand/collapse code block</summary>

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
+    ,
+    clear()
*    ,
*    newAudio("fish-audio", "2fishRoundTank.mp3")
*        .play()
*    ,
*    newText("fish-description", "The fish swim in a tank which is perfectly round.")
*        .unfold(2600)
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
*    ,
*    getAudio("fish-audio")
*        .wait("first")
*)
</code></pre>
</details>

