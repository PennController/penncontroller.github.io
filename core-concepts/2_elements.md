---
title: 2. Elements
nav_order: 2
---

Elements are the basic unit of a PennController trial. They contain multimedia content,
interactive content, or some combination of the two.
{: .h1-blurb }

---

## Element types

As of PennController 1.9, there are 21 element types, including:

+ [`Text`]({{site.baseurl}}/elements/text){:target="_blank"}:
Text content (multimedia)
+ [`Timer`]({{site.baseurl}}/elements/timer){:target="_blank"}:
A timer (interactive)
+ [`Button`]({{site.baseurl}}/elements/button){:target="_blank"}:
A clickable button (multimedia and interactive)

Read the [Elements]({{site.baseurl}}/elements){:target="_blank"} page
for a list of all the element types and their descriptions.

{% capture label %}
We use `code font` when referring to element types, and use **bold font**
when referring to elements. For example, "a **Text** element" or "a **Text**"
means "an instance of the `Text` element type".

+ Element type: An abstract template for creating elements
(in object-oriented terms, a *class*).
+ Element: An instance of an element type
(in object-oriented terms, an *object*).

{% endcapture %}
{% include label-note.html label-body=label %}

---

## Elements

### Creating an element

Elements are created by a `newX()` function, where `X` is an element type.

There are actually 21 different element-creating functions, collectively referred to
as "the `newX()` functions." Each element type has its own `newX()` function.
For example, `newText()` creates **Text** elements, `newTimer()`
creates **Timer** elements,`newButton()` creates **Button** elements, and so on.

The `newX()` functions have the following syntax:

+ The first parameter is a string and the element's name, or the element has no name

    <pre><code class="language-diff-javascript diff-highlight">
    *// Element has the name "ELEMENT_NAME"
    $newX("<var>ELEMENT_NAME</var>", ...)
    *
    *// Element does not have a name
    $newX(...)
    </code></pre>
+ The other parameter(s), indicated by `...` in the previous example,
depend(s) on the element type.

    <pre><code class="language-diff-javascript diff-highlight">
    *// Creates a Text element named "text" that contains the string "Hello, world!".
    $newText("text", "Hello, world!")
    *
    *// Creates a Timer element named "timer" that is 1000ms long.
    $newTimer("timer", 1000)
    </code></pre>

The element name parameter is technically optional, meaning that
if a `newX()` function that can take two strings is passed only one string,
that string is passed as the non-element-name parameter:

```js
// Creates a Text element named "apple" that contains the string "orange".
newText("apple", "orange")
,
// Creates an unnamed Text element that contains the string "apple".
newText("apple")
```

**We recommend naming every element**. Although element names are technically optional
in most cases, they are required in order to use a `getX()` function. Named elements also
make it easier to debug an experiment script.

### Referring back to an element

Existing elements can be referred back to by a `getX()` function, where `X` is
an element type. Like the `newX()` functions, the term "the `getX()` functions"
collectively refers to the 21 different element-referring functions.

The `getX()` functions only take one parameter, the name of the element being
referred back to:
<pre><code class="language-diff-javascript diff-highlight">
*newTrial("<var>TRIAL_LABEL</var>", 
*    newX("<var>ELEMENT_1</var>", ...)
*    ,
*    newX("<var>ELEMENT_2</var>", ...)
*    ,
$    getX("<var>ELEMENT_1</var>")
*)
</code></pre>

### Syntax

+ Call a `newX()` or `getX()` function within the opening and closing parentheses
of a `newTrial` command. 
+ Use a comma to separate instances of a `newX()` or `getX()` function.
+ (*Recommended*): Call each instance of a `newX()` function, `getX()` function,
or comma, on an indented new line. However, PennController is not sensitive to
whitespace, meaning that the two code blocks below are functionally equivalent.

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

    ```javascript
    PennController.ResetPrefix(null)
    newTrial("TRIAL_LABEL",newX("ELEMENT_1", ...),newX("ELEMENT_2", ...),getX("ELEMENT_1"))
    ```
