---
layout: default
title: Adding elements
parent: Basic Tutorial
---

## {{ page.title }}

**Elements** are the basic unit of a PennController experiment. 

Element types can represent multimedia content, interactive content, or some combination of the two:

+ [`Text`]({{site.baseurl}}/docs/elements/text){:target="_blank"}: Represents text content (multimedia).
+ [`Image`]({{site.baseurl}}/docs/elements/image){:target="_blank"}: Represents image content (multimedia).
+ [`Key`]({{site.baseurl}}/docs/elements/key){:target="_blank"}: Represents keyboard keypresses (interactive).
+ [`Button`]({{site.baseurl}}/docs/elements/button){:target="_blank"}: Represents clickable buttons (multimedia and interactive).
+ [`Audio`]({{site.baseurl}}/docs/elements/audio){:target="_blank"}: Represent audio content that can interact with the experiment script (multimedia and interactive).

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
    newX("ELEMENT1", ...)
    ,
    newX("ELEMENT2", ...)
    ,
    getX("ELEMENT1")
)
```

However, the following code is also valid:
```javascript
PennController.ResetPrefix(null)

newTrial("TRIAL_LABEL", newX("ELEMENT1", ...), newX("ELEMENT2", ...), getX("ELEMENT1"))
```

{% capture instructions %}
Add an **Audio** element, **Text** element and an **Image** element:

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
!newTrial("experimental-trial",
+    newAudio("fish-audio", "2fishRoundTank.mp3")
+    ,
+    newText("fish-description", "The fish swim in a tank which is perfectly round.")
+    ,
+    newImage("fish-round", "2fishRoundTank.png")    
+)
</code></pre>

+ The **Audio** element is named `"fish-audio"`, and contains the audio file `2fishRoundTank.mp3`, which is inside the **Resources** folder.
+ The **Text** element is named `"fish-description"`, and contains the string `The fish swim in a tank which is perfectly round.`
+ The **Image** element is named `"fish-round"`, and contains the image `2fishRoundTank.png`, which is inside the **Resources** folder.

{% capture label %}
At this point, the `main.js` script is **incomplete**; we have created a trial with several elements, but not yet done anything with the elements. If you run the experiment, it will end immediately with the message "The results were successfully sent to the server. Thanks!". 
{% endcapture%}
{% include label-note.html label-body=label %}

{% endcapture %}
{% include instructions.html text=instructions%}

