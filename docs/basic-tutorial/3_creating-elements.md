---
layout: default
title: Creating elements
parent: Basic Tutorial
nav_order: 3
---

## {{ page.title }}

**Elements** are the basic unit of a PennController experiment. They contain multimedia content, interactive content, or some combination of the two.

As of PennController 1.8, there are 21 element types, including: 

+ [`Text`]({{site.baseurl}}/docs/elements/text){:target="_blank"}: Text content (multimedia).
+ [`Image`]({{site.baseurl}}/docs/elements/image){:target="_blank"}: Image content (multimedia).
+ [`Key`]({{site.baseurl}}/docs/elements/key){:target="_blank"}: Keyboard keypresses (interactive).
+ [`Button`]({{site.baseurl}}/docs/elements/button){:target="_blank"}: Clickable buttons (multimedia and interactive).
+ [`Audio`]({{site.baseurl}}/docs/elements/audio){:target="_blank"}: Audio content that can interact with the experiment script (multimedia and interactive).

{% capture label %}
This tutorial uses the term "element" as shorthand for "instance of an element type". For example "an **Image** element" or "an **Image**" is short for "an instance of the `Image` type". If "element type" is intended, the term "element type" will be used.
{% endcapture %}
{% include label-note.html label-body=label  %}

Elements are created by the `newX("ELEMENT_NAME",...)` function:

+ `X` is an element type.
+ `"ELEMENT_NAME"` is the name of the element, and an optional (but highly-recommended) argument.
+ Any subsequent arguments depend on the element type. To learn which arguments a specific element type requires, visit that element type's reference page under [Elements]({{site.baseurl}}/docs/elements){:target="_blank"}.

Existing elements can be referred back to by the `getX("ELEMENT_NAME")` function:

+ `X` is an element type.
+ `"ELEMENT_NAME"` is the name of the element, and is a required argument.

Use the `newX` and `getX` functions within the opening and closing parentheses of a `newTrial` command. Instances of the `newX` or `getX` functions must be separated by a comma.

Call each instance of the `newX` function, `getX` function, or comma, on an indented new line for readability:
```javascript
PennController.ResetPrefix(null)

newTrial("TRIAL_LABEL",
    newX("ELEMENT_1", ...)
    ,
    newX("ELEMENT_2", ...)
    ,
    getX("ELEMENT_1")
)
```

However, the following code is also valid:
```javascript
PennController.ResetPrefix(null)

newTrial("TRIAL_LABEL", newX("ELEMENT_1", ...), newX("ELEMENT_2", ...), getX("ELEMENT_1"))
```

{% capture instructions %}
+ Create an [**Audio** element]({{site.baseurl}}/docs/elements/audio){:target="_blank"} named `"fish-audio"` that contains the audio file `2fishRoundTank.mp3`.
+ Create a [**Text** element]({{site.baseurl}}/docs/elements/text){:target="_blank"} named `"fish-sentence"` that contains the string `The fish swim in a tank which is perfectly round.`
+ Create an [**Image** element]({{site.baseurl}}/docs/elements/image){:target="_blank"} named `"fish-plural"` that contains the image `2fishRoundTank.png`.

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
!newTrial("experimental-trial",
+    newAudio("fish-audio", "2fishRoundTank.mp3")
+    ,
+    newText("fish-sentence", "The fish swim in a tank which is perfectly round.")
+    ,
+    newImage("fish-plural", "2fishRoundTank.png")    
+)
</code></pre>

{% capture label %}
At this point, the `main.js` script is **incomplete**; we've created a trial with several elements, but not yet done anything with the elements. If you run the experiment, it'll end immediately with the message "The results were successfully sent to the server. Thanks!". 
{% endcapture%}
{% include label-note.html label-body=label %}

{% endcapture %}
{% include instructions.html text=instructions%}

