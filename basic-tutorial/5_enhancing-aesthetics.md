---
title: 5. Adding experiment details
nav_order: 5
blurb: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
---

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
{: .h1-blurb }

---

## Displaying multimedia content

PennController has a variety of commands that manipulate the display of multimedia content.

For example:
+ [`center`]({{site.baseurl}}/commands/standard-element-commands/standard-center){:target="_blank"}: Centers a printed element on its horizontal axis.
+ [`unfold`]({{site.baseurl}}/elements/text/text-unfold){:target="_blank"}: "Unfolds" a `Text` element in a specified number of milliseconds, instead of printing it to the screen immediately.
+ [`size`]({{site.baseurl}}/commands/standard-element-commands/standard-size){:target="_blank"}: Resizes a printed element to a specified width by height in pixels.

### Enhancing aesthetics

{% capture instructions %}
1. Center the `"fish-sentence"` `Text`, and unfold it in 2676ms (the duration of `2fishRoundTank.mp3`).
2. Create an `Image` named `"fish-singular"` that contains the image `1fishSquareTank.png`.
3. Resize the `"fish-plural"` and `"fish-singular"` `Image` elements to 200x200 px.

*If you are copy and pasting this code, delete any lines highlighted with a red background.*
<pre><code class="language-diff-javascript diff-highlight"> 
@// Type code below this line.
@//
@// Remove command prefix
@PennController.ResetPrefix(null)
@
@// Experimental trial
@newTrial("experimental-trial",
@    newAudio("fish-audio", "2fishRoundTank.mp3")
@        .play()
@    ,
@    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
+        .center()
+        .unfold(2676)
-        .print()
@    ,
@    newImage("fish-plural", "2fishRoundTank.png")    
+        .size(200, 200)
@        .print()
+    ,
+    newImage("fish-singular", "1fishSquareTank.png")
+        .size(200, 200)
+        .print()
@    ,
@    newKey("keypress", "FJ")
@         .wait()
@    ,
@    getAudio("fish-audio")
@        .wait("first")
@)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

### Manipulating layout

By default, every printed element is printed on a new line. For other layouts:

+ [Pass coordinates to the `print` command]({{site.baseurl}}/commands/standard-element-commands/standard-print#optional-arguments){:target="_blank"} to control where the element is printed on the screen; or
+ Create a [`Canvas`]({{site.baseurl}}/elements/canvas){:target="_blank"}, which defines a transparent surface onto which elements can be placed at specific coordinates.

{% capture instructions %}
+ Create a centered `Canvas` named `"side-by-side"` that is 450x200 px (width x height).
  1. Call the [`add`]({{site.baseurl}}/elements/canvas/canvas-add){:target="_blank"} command to add the `"fish-plural"` and `"fish-singular"` `Image` elements at the `(x=0, y=0)` and `(x=250, y=0)` coordinates, respectively.
  2. Print the `Canvas`. You do not need to call the `print` command on the `"fish-plural"` and `"fish-singular"` `Image` elements.

*If you are copy and pasting this code, delete any lines highlighted with a red background.*
<pre><code class="language-diff-javascript diff-highlight"> 
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
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
-        .print()
@    ,
@    newImage("fish-singular", "1fishSquareTank.png")
@        .size(200, 200)
-        .print()
+    ,   
+    newCanvas("side-by-side", 450,200)
+        .add(  0, 0, getImage("fish-plural"))
+        .add(250, 0, getImage("fish-singular"))
+        .center()
+        .print()
@    ,
@    newKey("keypress", "FJ")
@         .wait()
@    ,
@    getAudio("fish-audio")
@        .wait("first")
@)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

---

## Including instructions

Every experiment should have instructions.

### Using HTML tags

You can use HTML tags to style text inside a `Text` element.

For example, `<p></p>`, `<b></b>`, and `<br>` are HTML tags that [define a paragraph](https://www.w3schools.com/tags/tag_p.asp){:target="_blank"}, [define bolded text](https://www.w3schools.com/tags/tag_b.asp){:target="_blank"}, and [define a line break](https://www.w3schools.com/tags/tag_br.asp){:target="_blank"}, respectively.

+ With HTML tags:
  <img class="mt-2 dotted-grey-dk-000" src="{{site.baseurl}}/assets/tutorials/with-html.png">
+ Without HTML tags:
  <img class="mt-2 dotted-grey-dk-000" src="{{site.baseurl}}/assets/tutorials/without-html.png">

{% capture instructions%}
1. Create a trial labeled `"instructions"` with centered `Text` instructions. 
2. Create a centered [`Button`]({{site.baseurl}}/elements/button){:target="_blank"} named `"wait"` that pauses experiment script execution until the participant clicks it.

<pre><code class="language-diff-javascript diff-highlight"> 
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
@
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
@
@// Experimental trial
@// code omitted in interest of space
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

### Setting default commands

All of the `Text` elements in the `"instructions"` trial are centered and printed to the screen. Instead of calling the `center` and `print` commands on every `Text` element, you can call the `center` and `print` commands once on the default `Text` element type object.

Every element type has a corresponding default object, for example `defaultText`. An element type's default object is accessed by calling `defaultX`, where `X` is an element type.

Any commands that are called on an element type's default object are called on all subsequent instances of that element type **within the same trial**. Instances of that element type in other trials are not affected.

{% capture instructions%}
Call the [`center`]({{site.baseurl}}/commands/standard-element-commands/standard-center){:target="_blank"} and [`print`]({{site.baseurl}}/commands/standard-element-commands/standard-print){:target="_blank"} commands on the `defaultText` object in the `"instructions"` trial:

*If you are copy and pasting this code, delete any lines highlighted with a red background.*
<pre><code class="language-diff-javascript diff-highlight"> 
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
@
@// Instructions
@newTrial("instructions",
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
@    ,
@    newButton("wait", "Click to start the experiment")
@        .center()
@        .print()
@        .wait()
@)
@
@// Experimental trial
@// code omitted in interest of space
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}
