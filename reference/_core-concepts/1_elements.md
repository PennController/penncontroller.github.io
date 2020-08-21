---
layout: default
title: Elements
parent: Core concepts
nav_order: 1
---

# Elements {#elements}

**Elements** are the basic unit of a PennController experiment; experiments are trial sequences of elements and commands. For example, you can create an **Image** element and then use a command to print to the screen.

To be technical, you create an *instance* of the `Image` type, and then use a command to print that instance to the screen. 

{% capture label %}
This tutorial  uses the term "element" as shorthand for "instance of an element type". For example "an **Image** element" is short for "an instance of the `Image` type". If "element type" is intended, the  term "element type" will be used.
{% endcapture %}
{% include note-label.html label-body=label %}

Element types can represent visual content, interactive content, or some combination of the two:

+ `Text`: Represents text content (visual).
+ `Image`: Represents image content (visual)
+ `Key`: Represents keyboard keypresses (interactive).
+ `Button`: Represents clickable buttons (visual and interactive).

For a list of all PennController element types, see the Elements page.

## Creating an element

Elements are objects returned by the function `newX(id, ...)`, where:

+ `X` is the element type.
+ `id` is the name of the element, and must be passed as a string.
+ `...` is any other arguments required by the element type.

Once an element is created, it can be referred back to by the function `getX(id)`, where:

+ `X` is the element type.
+ `id` is the name of the element, and must be passed as a string.

Calls of the `newX()`or `getX()` functions are separated with a comma.

---

**Important!** It is not strictly necessary to name an element. However, it is highly recommended to name every element for general clarity and readability. Furthermore, if you want to refer back to an element with the `getX()` function, the element must have a name.

---

**Example 1**

```javascript
// Example 1

newText("example-text", "This is an example sentence.")
,
newImage("example-image", "image.png")
,
getText("example-text")
```

**Example 1** does the following:

1. Creates a **Text** element with the name `example-text` and the content `This is an example sentence.`.
2. Creates an **Image** element with the name `example-image`  and the source file  `image.png` (this file is hosted on...)
3. Refers back to the **Text** element `example-text`.
