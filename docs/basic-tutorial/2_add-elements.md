---
layout: default
title: Add elements
parent: Basic Tutorial
---

## Add elements

**Elements** are the basic unit of a PennController experiment. 

Element types can represent visual content, interactive content, or some combination of the two:

+ `Text`: Represents text content (visual).
+ `Image`: Represents image content (visual)
+ `Key`: Represents keyboard keypresses (interactive).
+ `Button`: Represents clickable buttons (visual and interactive).

{% capture label %}
This tutorial uses the term "element" as shorthand for "instance of an element type". For example "an **Image** element"  or "an **Image**" is short for "an instance of the `Image` type". If "element type" is intended, the  term "element type" will be used.
{% endcapture %}
{% include note-label.html label-body=label  %}

{% capture label %}
For a list of all PennController element types, see the [Reference: Elements](./elements) page.
{% endcapture %}
{% include reference-label.html label-body=label  %}

Add two **Text** elements and an **Image** element:
```javascript
// Shorten command names (keep this line here)
PennController.ResetPrefix(null)

// Create a Trial named "first-trial"
newTrial("first-trial",
    // Create a Text element 
    newText("fish-description", "The fish swim in a tank which is perfectly round.")
    ,
    // Create an Image element
    newImage("fish-round", "2fishRoundTank.png")    
)
```


> + The **Text** element is named `"fish-description"`, and contains the string `The fish swim in a tank which is perfectly round.`
> + The **Image** element is named `"fish"`, and contains the image `2fishRoundTank.png`, within the **Resources** folder.

{% capture label %}
It is not strictly necessary to name an element. For example, `newImage("fish", "2fishRoundTank.png")` and `newImage("2fishRoundTank.png")` both contain the image `2fishRoundTank.png`.

However, it is recommended to name every element for general clarity. Furthermore, if you want to refer back to an existing element with the `getX` function, as in [Manipulate layout](#manipulate-layout), the element must have a name.
{% endcapture %}
{% include recommended-label.html label-body=label  %}

