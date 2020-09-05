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

Elements are created with the `newX("ELEMENT_NAME", ...)` function, where `X` is an element type and `"ELEMENT_NAME"` is the name of the newly-created element. Any subsequent arguments depend on the element type. 

To learn which arguments a specific element type requires, visit that element type's reference page under [Elements](./elements).

Elements that have been created can be referred back to with the `getX("ELEMENT_NAME")` function, where `X` is an element type and `"ELEMENT_NAME"` is the name of the element.

Instances of the `newX` or `getX` functions are separated by a comma.


Add a **Text** element and an **Image** element:

```javascript
// This is the BasicTutorial experiment.
// Type code below this line.

// Remove command prefix
PennController.ResetPrefix(null)

newTrial("first-trial",
    newText("fish-description", "The fish swim in a tank which is perfectly round.")
    ,
    newImage("fish-round", "2fishRoundTank.png")    
)
```


> + The **Text** element is named `"fish-description"`, and contains the string `The fish swim in a tank which is perfectly round.`
> + The **Image** element is named `"fish"`, and contains the image `2fishRoundTank.png`, which is inside the **Resources** folder.

{% capture label %}
Name every element for maximum clarity. 

However, it is not strictly necessary to name an element. For example, `newImage("fish", "2fishRoundTank.png")` and `newImage("2fishRoundTank.png")` both contain the image `2fishRoundTank.png`.
{% endcapture %}
{% include label-recommended.html label-body=label  %}

