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

Elements are created with the `newX("ELEMENT_NAME", ...)` function, where `X` is an element type. The first argument is a string, and the name of the newly-created element. Any subsequent arguments depend on the element type. 

{% capture label %}
To learn which arguments a specific element type requires, visit that element type's reference page under [Elements](./elements).
{% endcapture %}
{% include reference-label.html label-body=label  %}

Elements that already exist can be referred back to with the `getX("ELEMENT_NAME")` function, where `X` is an element type and `"ELEMENT_NAME"` is the name of the element.

Elements and any [commands](#add-commands) that are called on them are separated by a comma.


Add a **Text** element and an **Image** element:

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
> + The **Image** element is named `"fish"`, and contains the image `2fishRoundTank.png`, which is inside the **Resources** folder.

{% capture label %}
It is not strictly necessary to name an element. For example, `newImage("fish", "2fishRoundTank.png")` and `newImage("2fishRoundTank.png")` both contain the image `2fishRoundTank.png`.

However, it is recommended to name every element for general clarity. Furthermore, if you want to refer back to an existing element with the `getX` function, the element must have a name.
{% endcapture %}
{% include recommended-label.html label-body=label  %}

