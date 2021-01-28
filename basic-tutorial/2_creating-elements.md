---
title: 2. Creating elements
nav_order: 2
blurb: How to use elements, the basic unit of a PennController experiment.
---

Elements are the basic unit of a PennController trial. They contain multimedia content, interactive content, or some combination of the two.
{: .h1-blurb }

---

## Element types

As of PennController 1.8, there are 21 element types, including: 

+ [`Text`]({{site.baseurl}}/elements/text): Text content (multimedia).
+ [`Image`]({{site.baseurl}}/elements/image): Image content (multimedia).
+ [`Key`]({{site.baseurl}}/elements/key): Keyboard keypresses (interactive).
+ [`Button`]({{site.baseurl}}/elements/button): Clickable buttons (multimedia and interactive).
+ [`Audio`]({{site.baseurl}}/elements/audio): Audio content that can interact with the experiment script (multimedia and interactive).

You can see a list of all element types and their descriptions on the [Elements]({{site.baseurl}}/elements) page.

{% capture label %}
We distinguish between the terms "element type" and "element":
+ Element type: *to be filled in*
+ Element: An instance of an element type

We use `code font` when referring to element types, and use **bold font** when referring to elements. 

For example, "a `Text` element" or "a `Text`" means "an instance of the `Text` element type".
{% endcapture %}
{% include label-technical.html label-body=label %}

---

## Elements

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### Creating an element

Create an element by calling a <code>newX("<var>ELEMENT_NAME</var>",...)</code> function, where:

+ `X` is an element type.
+ <code>"<var>ELEMENT_NAME</var>"</code> is the name of the element.
+ `...` refers to subsequent parameters that depend on the element type. To see what arguments a specific element type requires, visit that element type's reference page under [Elements]({{site.baseurl}}/elements).

Naming an element is technically optional, but **we recommend giving every element a name**,  Naming your elements will make it easier to debug an experiment, and only named elements can be accessed by a `getX()` function.

{% capture instructions %}

+ Create an [`Audio`]({{site.baseurl}}/elements/audio) named `"fish-audio"` that contains the audio file `2fishRoundTank.mp3`.
+ Create a [`Text`]({{site.baseurl}}/elements/text) named `"fish-sentence"` that contains the string `"The fish swim in a tank which is perfectly round."`
+ Create an [`Image`]({{site.baseurl}}/elements/image) named `"fish-plural"` that contains the image `2fishRoundTank.png`.

<pre><code class="language-diff-javascript diff-highlight"> 
@// Type code below this line.
@
@// Remove command prefix
@*PennController.ResetPrefix(null)
@
@// Turn off debugger
@// DebugOff()
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

At this point, we've created a trial with several elements, but not yet done anything with the elements. If you run the experiment, it'll end immediately with the message "The results were successfully sent to the server. Thanks!".

### Referring back to an element

Refer back to an element by calling a <code>getX("<var>ELEMENT_NAME</var>")</code> function, where:

+ `X` is an element type.
+ <code>"<var>ELEMENT_NAME</var>"</code> is the name of the element.

We won't use a `getX()` function until **4. Pausing experiment execution**, but here's a preview of what that'll look like:

```javascript
PennController.ResetPrefix(null)

newTrial("experimental-trial",
    newAudio("fish-audio", "2fishRoundTank.mp3")
    ,
    // ...
    ,
    getAudio("fish-audio")
)
```

### Element syntax

+ Call a `newX()` or `getX()` function within the opening and closing parentheses of a `newTrial` command. 
+ Use a comma to separate instances of a `newX()` or `getX()` function.
+ (*Recommended*): Call each instance of a `newX()` function, `getX()` function, or comma, on an indented new line.

All line breaks, tabs, and spaces are optional and purely for human readability; PennController does not care about whitespace.

For example, the two code blocks below are functionally equivalent:

+ ```javascript
    PennController.ResetPrefix(null)

    newTrial("TRIAL_LABEL",
        newX("ELEMENT_1", ...)
        ,
        newX("ELEMENT_2", ...)
        ,
        getX("ELEMENT_1")
    )
    ```
+   ```javascript
    PennController.ResetPrefix(null)
    newTrial("TRIAL_LABEL",newX("ELEMENT_1", ...),newX("ELEMENT_2", ...),getX("ELEMENT_1"))
    ```
