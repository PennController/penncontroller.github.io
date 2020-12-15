---
layout: default
title: Elements
parent: Core Concepts
nav_order: 2
---

# {{ page.title }}

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
{: .h1-blurb }

---

## Element types

Elements are the basic unit of a PennController trial. They contain multimedia content, interactive content, or some combination of the two.

As of PennController 1.8, there are 21 element types, including: 

+ [`Text`]({{site.baseurl}}/docs/elements/text){:target="_blank"}: Contains text contain (multimedia)
+ [`Timer`]({{site.baseurl}}/docs/elements/timer){:target="_blank"}: Creates a timer (interactive)
+ [`Button`]({{site.baseurl}}/docs/elements/button){:target="_blank"}: Creates a clickable button (multimedia and interactive)

You can see a list of all element types and their descriptions on the [Elements]({{site.baseurl}}/docs/elements){:target="_blank"} page.

We use `code font` to refer to element types, and **bold font** to refer to elements (instances of an element type). For example, "a **Text** element" or "a **Text**" means "an instance of the `Text` element type".

---

## Creating an element

Elements are created by a function of the form `newX()`, where `X` is an element type. Each element type has its own element-creating function. For example, `newText()` creates **Text** elements, `newTimer()` creates **Timer** elements, `newButton()` creates **Button** elements, and so on. 

We use the term "the `newX()` functions" to collectively refer to the 21 different element-creating functions, and the term "a `newX()` function" to refer to any function of the form `newX()`.

The `newX()` functions are used as following:
+ The first parameter is a string and the element's name; or
    ```js
    newTrial("TRIAL_LABEL", 
        newX("ELEMENT_NAME", ...)
    )
    ```
+ The element has no name
    ```js
    newTrial("TRIAL_LABEL", 
        newX(...)
    )
    ```

Naming an element is optional, but **we recommend giving every element a name**. Naming your elements will make it easier to debug an experiment script, and only named elements can be referred back to by a `getX()` function.

The other parameters depend on the element type.

For example:
+ `newText("text", "SOME_TEXT_HERE")`: Creates a **Text** named `"text"` that contains the string `"SOME_TEXT_HERE"`.
+ `newTimer("timer", 1000)`: Creates a **Timer** named `"timer"` that is 1000ms long.

*Note*: When a `newX()` function that takes up to two strings is passed only one string, the given string does *not* become the element name: 
+ `newText("apple", "orange")`: creates a **Text** element named `"apple"` that contains the text `"orange"`.
+ `newText("apple")`: creates an unnamed **Text** element that contains the text `"apple"`.

---

## Referring back to an element

Elements that have already been created can be referred back to by a function of the form `getX()`, where `X` is an element type. Like the `newX()` functions, we use the term "the `getX()` functions" to collectively refer to the 21 different element-referring functions, and the term "a `getX()` function" to refer to any function of the form `getX()`.

The `getX()` functions only take one parameter, the name of the element being referred back to:
```js
newTrial("TRIAL_LABEL", 
    newX("RANDOM_ELEMENT", ...)
    ,
    newX("ANOTHER_ELEMENT", ...)
    ,
    getX("RANDOM_ELEMENT")
)
```


