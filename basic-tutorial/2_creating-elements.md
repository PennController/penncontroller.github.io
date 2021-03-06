---
title: 2. Creating elements
nav_order: 2
blurb: How to use elements, the basic unit of a PennController trial.
---

Elements contain multimedia content, interactive content, or some combination
of the two.
{: .h1-blurb }

---

## Element types

As of PennController 1.9, PennController has 21 types of
[elements]({{site.baseurl}}/elements), including:

+ [`Text`]({{site.baseurl}}/text):
Text content (multimedia).
+ [`Image`]({{site.baseurl}}/image):
Image content (multimedia).
+ [`Key`]({{site.baseurl}}/key):
Keyboard keypresses (interactive).
+ [`Button`]({{site.baseurl}}/button):
A clickable button (multimedia and interactive).
+ [`Audio`]({{site.baseurl}}/audio):
Audio content that can interact with the experiment script (multimedia and
interactive).

We'll use these five elements in the **BasicTutorial** experiment.

---

## Creating an element

Create an element by calling a <code>newX(<var>ELEMENT_NAME</var>, ...)</code>
function, where:

+ `X` is a type of element
+ <code><var>ELEMENT_NAME</var></code> is the name of the element
+ `...` are additional parameters that depend on the element type. For example,
if you create an Audio or Image element you'll also need to specify the name
of its source file.

{% capture label %}
Naming an element is technically optional, but <strong>we recommend giving
every element a name</strong>.  Naming your elements will make it easier to
debug an experiment, and only named elements can be accessed by a
[`getX()` function](#referring-back-to-an-element).
{% endcapture %}
{% include label-note.html label-body=label %}

{% capture instructions %}
1. Create an [Audio]({{site.baseurl}}/audio) element named `"fish-audio"`
that contains the audio file `2fishRoundTank.mp3`.
2. Create a [Text]({{site.baseurl}}/text) element named `"fish-sentence"`
that contains the string `"The fish swim in a tank which is perfectly round."`
3. Create an [Image]({{site.baseurl}}/image) element named `"fish-plural"`
that contains the image `2fishRoundTank.png`.

In PennController, all line breaks, tabs, and spaces are optional and purely
for human readability, because PennController does not care about whitespace.

However, you **must** add a comma in between elements. You must also add a
comma in between a trial label and the following element.

<pre><code class="language-diff-javascript diff-highlight">
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
@
@// Experimental trial
!newTrial("experimental-trial",
+    newAudio("fish-audio", "2fishRoundTank.mp3")
+    ,
+    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
+    ,
+    newImage("fish-plural", "2fishRoundTank.png")
+)
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

We've added some elements, but the trial still doesn't "do" anything because it
doesn't have any commands. We'll add some commands soon!

## Referring back to an element

Once you create an element, you can refer back to it by calling a
<code>getX(<var>ELEMENT_NAME</var>)</code> function, where:

+ `X` is an element type
+ <code><var>ELEMENT_NAME</var></code> is the name of the element

We won't use a `getX()` function until
[**4. Pausing experiment execution**]({{site.baseurl}}/basic-tutorial/4_pausing-execution)
but here's a preview:

```javascript
PennController.ResetPrefix(null)

newTrial("experimental-trial",
    newAudio("fish-audio", "2fishRoundTank.mp3")
    ,
    // Do some things
    ,
    getAudio("fish-audio")
)
```
