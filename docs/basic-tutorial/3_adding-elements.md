---
layout: default
title: Adding elements
parent: Basic Tutorial
---

## {{ page.title }}

**Elements** are the basic unit of a PennController experiment. 

Element types can represent visual content, interactive content, or some combination of the two:

+ `Text`: Represents text content (visual).
+ `Image`: Represents image content (visual)
+ `Key`: Represents keyboard keypresses (interactive).
+ `Button`: Represents clickable buttons (visual and interactive).

{% capture label %}
This tutorial uses the term "element" as shorthand for "instance of an element type". For example "an **Image** element"  or "an **Image**" is short for "an instance of the `Image` type". If "element type" is intended, the  term "element type" will be used.
{% endcapture %}
{% include label-note.html label-body=label  %}

Elements are created by the `newX("ELEMENT_NAME",...)` function:

+  `X` is an element type.
+  `"ELEMENT_NAME"` is the name of the element, and an optional (but highly-recommended) argument.
+  Any subsequent arguments depend on the element type. To learn which arguments a specific element type requires, visit that element type's reference page under [Elements]({{site.baseurl}}/docs/elements){:target="_blank"}.

Existing elements can be referred back to by the `getX("ELEMENT_NAME")` function:

+ `X` is an element type.
+ `"ELEMENT_NAME"` is the name of the element, and is a required argument.

Instances of the `newX` or `getX` functions are **Trial** arguments, and must be separated by a comma.

Call each instance of the `newX` function, `getX` function, or comma, on an indented new line for readability:

```javascript
newTrial("TRIAL_LABEL",
    newX("ELEMENT1", ...)
    ,
    newX("ELEMENT2", ...)
    ,
    getX("ELEMENT1")
)
```
However, the following code will also work:

```javascript
newTrial("TRIAL_LABEL", newX("ELEMENT1", ...), newX("ELEMENT2", ...), getX("ELEMENT1"))
```

{% capture instructions %}
Add a **Text** element and an **Image** element:

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
!newTrial("first-trial",
+    newText("fish-description", "The fish swim in a tank which is perfectly round.")
+    ,
+    newImage("fish-round", "2fishRoundTank.png")    
+)
</code></pre>

+ The **Text** element is named `"fish-description"`, and contains the string `The fish swim in a tank which is perfectly round.`
+ The **Image** element is named `"fish"`, and contains the image `2fishRoundTank.png`, which is inside the **Resources** folder.
{% endcapture %}
{% include instructions.html text=instructions%}

