---
title: 5. Adding experiment details
nav_order: 5
blurb: How to add more details to an experiment.
---

In this section, we'll manipulate how multimedia elements are displayed.
{: .h1-blurb }

---

## Displaying multimedia content

We'll use these commands to manipulate printed content:

+ [`center`]({{site.baseurl}}/standard-element-commands/standard-center):
Centers an element on its horizontal axis.
+ [`unfold`]({{site.baseurl}}/text/text-unfold):
"Unfolds" and slowly prints a Text element in a specified number of milliseconds.
+ [`size`]({{site.baseurl}}/standard-element-commands/standard-size):
Resizes an element's content to a specified width by height in pixels.

### Enhancing aesthetics

{% capture instructions %}
1. [Center]({{site.baseurl}}/standard-element-commands/standard-center)
the `"fish-sentence"` Text, and [unfold]({{site.baseurl}}/text/text-unfold)
it in 2676ms, the duration of `2fishRoundTank.mp3`.
2. Remove the `print` command on the `"fish-sentence"` Text.
3. Create an Image named `"fish-singular"` that contains the image `1fishSquareTank.png`.
4. [Resize]({{site.baseurl}}/standard-element-commands/standard-size)
the `"fish-plural"` and `"fish-singular"` Images to 200x200 px.

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

By default, PennController prints every element on a new line. If you want to
print elements side-by-side, you can:

+ Create a [`Canvas`]({{site.baseurl}}/canvas), which defines a transparent
surface onto which elements can be placed at specific coordinates; or
+ [Pass coordinates to the `print` command]({{site.baseurl}}/standard-element-commands/standard-print#optional-arguments)
to control where the element is printed on the screen.

{% capture instructions %}
1. Create a centered Canvas element named `"side-by-side"` that is
450x200 px (width x height).
2. [Add]({{site.baseurl}}/canvas/canvas-add) the `"fish-plural"` and
`"fish-singular"` Images to the `"side-by-side"` Canvas at the `(x=0, y=0)`
and `(x=250, y=0)` coordinates, respectively.
3. Print the `"side-by-side"` Canvas.
4. Remove the `print` command on the `"fish-plural"` and `"fish-singular"` Images;
since you're printing a Canvas that contains these Images, you don't need to print
the Images separately.

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

## Adding instructions

Every experiment should have instructions! We'll tell the participants that they
should press the `F` key to select the image on the left, and press the `J` key
to select the image on the right.

### Using HTML tags

You can use HTML tags inside a Text element. For example, `<p></p>`,
`<b></b>`, and `<br>` are HTML tags that
[define a paragraph](https://www.w3schools.com/tags/tag_p.asp){:target="_blank"},
[define bolded text](https://www.w3schools.com/tags/tag_b.asp){:target="_blank"},
and [define a line break](https://www.w3schools.com/tags/tag_br.asp){:target="_blank"},
respectively.

{% capture instructions%}
1. Create a trial labeled `"instructions"`.
2. Create, center, and print Text elements that provide experiment instructions.
3. Create, center, and print a [Button]({{site.baseurl}}/button) element named
`"wait"`.
4. Call the `wait` command on the `"wait"` Button to pause experiment script
execution until the participant clicks it.

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

Here's how the instructions would look with and without the HTML tags:

+ With HTML tags:
  <img class="mt-2 dotted-grey-dk-000" src="{{site.baseurl}}/assets/tutorials/with-html.png">
+ Without HTML tags:
  <img class="mt-2 dotted-grey-dk-000" src="{{site.baseurl}}/assets/tutorials/without-html.png">

### Setting default commands

If we want all Text elements inside the `"instructions"` trial to be centered
and printed, we can call the `center` and `print` commands on each Text element,
or call those commands once on the default Text object.

Every type of element has a default object. Any commands that are called on an
element type's default object are called on all subsequent instances of that
element type **within the same trial**. Instances of that element type in other
trials are not affected.

{% capture instructions%}
1. Call the
[`center`]({{site.baseurl}}/standard-element-commands/standard-center)
and [`print`]({{site.baseurl}}/standard-element-commands/standard-print)
commands on the `defaultText` object in the `"instructions"` trial.
2. Remove the `center` and `print` commands from the individual Text elements.

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
