---
title: 3. Commands
nav_order: 3
---

PennController has three types of commands:
{: .h1-blurb}

+ [Element commands](#element-commands):
Used within a trial and called on an element
+ [Global commands](#global-commands):
Used outside of a trial
+ [Special commands](#special-commands):
Used within a trial, but not called on an element.
{: .h1-blurb }

---

## Element commands

There are two types of element commands:

+ Action command: Directly manipulates an element
+ Test command (PennController equivalent of a conditional statement):
Runs a test on an element, and executes different code blocks depending on the
success or failure of the test.

Action commands and test commands can be *standard* or *element-specific*:

+ Standard: Can be called on any element without causing a runtime error.
+ Element-specific: Can only be called on a specific type of element. Otherwise,
causes an error.

![A diagram that shows the different types of element commands]({{site.baseurl}}/assets/images/command-types.png)

### Prefixes

Throughout this documentation, you'll see commands with the prefix `standard.`,
like
[`standard.print`]({{site.baseurl}}/standard-element-commands/standard-print)
or
[`standard.center`]({{site.baseurl}}/standard-element-commands/standard-center).
You'll also see commands with the prefix `X.`, where `X` is a type of element,
like
[`timer.start`]({{site.baseurl}}/timer/timer-start)
or
[`button.once`]({{site.baseurl}}/button/button-once).

The `standard.` prefix indicates that the command is a standard element command,
and the `X.` prefix indicates that the command is an element-specific command.

However, these prefixes are used only for illustrative clarity.

{% capture label %}
The `standard.` and `X.` prefixes are **not part of PennControlller syntax**
and cannot be used inside an actual PennController script.
{% endcapture %}
{% include label-note.html label-body=label %}


### Action commands

Action commands do at least one of three things:

+ Manipulate an element's visual content
+ Trigger an element-related event
+ Control an element's interaction with the participant

Examples of action commands:

+ [`standard.print`]({{site.baseurl}}/standard-element-commands/standard-print):
Prints the element to the screen (manipulates visual content). By default, the element
is aligned with the left edge of the screen.
    <pre><code class="language-diff-javascript diff-highlight">
    @newText("text", "Hello, world!")
    $    .print()
    </code></pre>

+ [`timer.start`]({{site.baseurl}}/timer/timer-start):
Starts the Timer element (triggers an event).
    <pre><code class="language-diff-javascript diff-highlight">
    @newTimer("timer", 1000)
    $    .start()
    </code></pre>

+ [`button.wait`]({{site.baseurl}}/button/button-wait):
Pauses experiment script execution until the participant clicks the Button element.
(controls participant interaction).
    <pre><code class="language-diff-javascript diff-highlight">
    @newButton("button", "Hello, button!")
    @    .print()
    $    .wait()
    </code></pre>

In the third example, we called `standard.print` and `button.wait` on the
`Button` element, and we crucically called `standard.print` *before* calling
`button.wait`. Remember, PennController scripts are
[evaluated and executed from top to bottom]({{site.baseurl}}/core-concepts/1_experiment#flow-of-evaluation).

Printing the Button element before pausing experiment script execution means that
there is in fact a Button for the participant to click. If we call
`button.wait` before calling `standard.print`, the experiment script execution
pauses right before actually printing the Button -- there would be no Button
for the participant to click, and the experiment would stay paused forever.

Pay attention to the order in which you call your element commands, especially
when calling a command that will pause experiment script execution!

### Test commands

Test commands define conditional branching by running a test on an element:

+ If the test succeeds, PennController executes the code block defined by
the `success` keyword.
+ If the test fails,  PennController executes the code block defined by
the `failure` keyword.

For example, the test command
[`button.test.clicked`]({{site.baseurl}}/button/button-test-clicked)
tests whether the Button it is called on has ever been clicked. It succeeds
if, at the time of testing, the Button has been clicked at least once. It fails if
the Button has never been clicked:

<pre><code class="language-diff-javascript diff-highlight">
@newButton("big-red-button", "I'm a big red button")
@    .css({"background-color": "red", "font-size": "large"})
@    .center()
@    .print()
@,
@newButton("continue", "Click to continue")
@    .print()
@    .center()
@    .wait()
@,
@getButton("big-red-button")
$    .test.clicked()
$    .success(newText("success", "You clicked the big red button").print())
$    .failure(newText("failure", "You didn't click the big red button").print())
</code></pre>

+ In this example, there are two Button elements, one named `"big-red-button"` and
  one named `"continue"`. Both Buttons are printed to the screen by the `standard.print`
  command.

  The `"continue"` Button pauses the experiment until the participant clicks on it.
  After the participant clicks the `"continue"` Button, PennController uses the
  `getButton()` function to refer back to the `"big-red-button"` Button, and calls
  the test command `button.test.clicked` on it.
+ If the participant clicked on the `"big-red-button"` Button before clicking the
`"continue"` button, the test succeeds and the `success` code block is executed.
PennController creates a new `Text` element named `"sucess"`, and prints the string
`"You clicked the big red button"` to the screen:
    <pre><code class="language-diff-javascript diff-highlight">
    @getButton("big-red-button")
    @    .test.clicked()
    $    .success(newText("success", "You clicked the button").print())
    @    .failure(newText("failure", "You didn't click the button").print())
    </code></pre>
+ If the participant didn't click on the `"big-red-button"` Button before clicking
the `"continue"` button, the test fails and `failure` code block is executed.
ennController creates a new `Text` element named `"failure"`, and prints the string
`"You didn't click the big red button"` to the screen:
    <pre><code class="language-diff-javascript diff-highlight">
    @getButton("big-red-button")
    @    .test.clicked()
    @    .success(newText("success", "You clicked the big red button").print())
    $    .failure(newText("failure", "You didn't click the big red button").print())
    </code></pre>
+ This example also introduces the standard action commands
[`standard.css`]({{site.baseurl}}/standard-element-commands/standard-css)
and
[`standard.center`]({{site.baseurl}}/standard-element-commands/standard-center).

  The `standard.css` command applies the specified CSS styles to the element. In this
  example it sets the `"big-red-button"` Button's
  [`background-color`](https://www.w3schools.com/cssref/pr_background-color.asp){:target="_blank"}
  property to `red`, and its
  [`font-size`](https://www.w3schools.com/cssref/pr_font_font-size.asp){:target="_blank"}
  property to `x-large`.

  The `standard.center` command horizontally centers an element, meaning that the
  two Button elements are printed to the center of the screen, instead of to the
  default left edge.

All test commands contain the obligatory prefix `test.`, which distinguishes them
from action commands.

<pre><code class="language-diff-javascript diff-highlight">
@// Incorrect: The test command `button.test.clicked` is not called with the `test.` prefix
%newTrial("example-trial-one",
%    newButton("button", "I'm a button")
%        .clicked()
%)
@
@// Correct: The test command `button.test.clicked` is called with the `test.` prefix
~newTrial("example-trial-one",
~    newButton("button", "I'm a button")
~        .test.clicked()
~)
</code></pre>

#### Keywords

To be filled in



### Default commands

Every element type has a corresponding default object that can be accessed by
calling `defaultX`, where `X` is an element type. For example, the default object
of the `Text` element type is `defaultText`.

A default command is set by calling an element command on an element type's
default object. Once a default command has been set, it will be called on all
subsequent instances of that element type **within the same trial**. Instances
of that element type in other trials are not affected.

```javascript
newTrial("trial-one",
  newText("text-one")
)

newTrial("trial-two",
  defaultText
      .center()
  ,
  newText("text-two")
)

newTrial("trial-three",
)
```

---

## Global commands

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

---

## Special commands

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
