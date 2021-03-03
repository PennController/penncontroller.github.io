---
title: 2. Elements
nav_order: 2
---

---

## Types of elements

Elements contain multimedia content, interactive content, or some combination
of the two.

As of PennController 1.9, PennController has 21 types of elements, including:

+ [`Text`]({{site.baseurl}}/text):
Text content (multimedia)
+ [`Timer`]({{site.baseurl}}/timer):
A timer (interactive)
+ [`Button`]({{site.baseurl}}/button):
A clickable button (multimedia and interactive)

For a complete list of all the elements, see the
[Elements]({{site.baseurl}}/elements)
reference page.

---

## Creating an element

Create an element by calling a `newX()` function, where `X` is a type of element.
There are 21 `newX()` functions, one for each type of element: `newText()` creates
`Text` elements, `newTimer()` creates `Timer` elements, `newButton()` creates `Button`
elements, and so on.

All `newX()` functions have the following syntax:

+ The optional first argument is a string and the element's name, or the element
has no name.
    <pre><code class="language-diff-javascript diff-highlight">
    @// Option 1: Element has the name "example-name"
    $newX("example-name", ...)
    @
    @// Option 2: Element does not have a name
    $newX(...)
    </code></pre>

{% capture label %}
**We recommend naming every element**. Although element names are technically optional
in most cases, they are required in order to use a `getX()` function. Named elements
also make it easier to debug an experiment script.
{% endcapture %}
{% include label-note.html label-body=label indent=true %}

+ Any other argument(s), indicated by `...` in the previous example,
depend(s) on the element.
    <pre><code class="language-diff-javascript diff-highlight">
    @// Creates a Text element named "text" that contains the string "Hello, world!".
    $newText("text", "Hello, world!")
    @
    @// Creates a Timer element named "timer" that is 1000ms long.
    $newTimer("timer", 1000)
    </code></pre>

    If a `newX()` function that can take two strings is passed only one string,
    that string is passed as the argument that is not the element name.

    ```js
    // Creates a Text element named "apple" that contains the string "orange".
    newText("apple", "orange")
    ,
    // Creates an unnamed Text element that contains the string "apple".
    newText("apple")
    ```

Elements must be created inside a trial:

<pre><code class="language-diff-javascript diff-highlight">
@// Incorrect: The 'newX()' function is called outside of a trial
%newX("element-outside-trial")
%newTrial("trial-without-element")
@
@// Correct: The 'newX()' function is called inside a trial
~newTrial("trial-with-element",
~    newX("element-inside-trial")
~)
</code></pre>

<!-- ### Element names -->
<!--  -->
<!-- *To be filled in* -->

---

## Referring back to an element

Refer back to an existing element by calling a `getX()` function, where `X` is
the same type as the element being referred back to. Like the `newX()` functions,
there are 21 different element-referring functions.

+ All `getX()` functions only take one argument, the name of the element being
referred back to:
    <pre><code class="language-diff-javascript diff-highlight">
    @newTrial("example-label",
    $    newX("element-one")
    @    ,
    @    newX("element-two")
    @    ,
    $    getX("element-one")
    @)
    </code></pre>
+ `getX()` functions can only refer back to elements of the same type:
    <pre><code class="language-diff-javascript diff-highlight">
    @// Incorrect: There is no Button element named "hello"
    %newTrial("example-trial-one",
    %    newText("hello", "Hello, world!")
    %    ,
    %    newButton("goodbye", "See you later")
    %    ,
    %    getButton("hello")
    %)
    @
    @// Correct: There is a Text element named "hello"
    ~newTrial("example-trial-two",
    ~    newText("hello", "Hello, world!")
    ~    ,
    ~    newButton("goodbye", "See you later")
    ~    ,
    ~    getText("hello")
    ~)
    </code></pre>
