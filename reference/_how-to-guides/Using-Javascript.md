---
title: Using JavaScript
---

This page describes the differences between plain JavaScript code and PennController commands,
and discusses a non-exhaustive list of situations which may or may not require injecting
plain JavaScript code into PennController code.

* TOC
{:toc}

# JavaScrip is immediate, PennController is delayed

The scripts in your projects are `.js` files and, as such, they contain JavaScript code. 
That code is evaluated as soon as a participant opens your experiment.
This means that all plain JavaScript code will be executed at once at the beginning of your experiment. 

PennController commands, on the other hand, were specifically designed
to take effect upon runtime, one command after the other, one trial after the other.

For example, trying to directly increase a JavaScript variable from within
a [`newTrial`]({{site.baseurl}}/global-commands/newtrial) command
embedded in a [`Template`]({{site.baseurl}}/global-commands/template) command 
to keep track of the _running order_  of the trial will not have the desired outcome.
A better solution is to use a Var element, which was designed to handle runtime execution:

<pre><code class="language-diff-javascript diff-highlight">
@Sequence( randomize("creation") , randomize("runtime") )
@
@// Will print the *creation* order
%order = 0
@Template( row =>
@    newTrial( "creation" ,
%        order++    // Executed immediately
%        ,
%        newText("Creation Trial #"+order).print()
@        ,
@        newButton("Next").print().wait()
@    )
@)
@
@// Will print the *running* order
@Template( row =>
@    newTrial( "runtime" ,
~        newVar("order",0).global().set(v=>v+1) // Executed upon runtime
~        ,
~        newText("Runtime Trial #")
~            .after( newText("").text(getVar("order")) )
~            .print()
@        ,
@        newButton("Next").print().wait()
@    )
@)
</code></pre>

<!-- More technically, all PennController commands are JavaScript functions whose evaluation is immediate  -->
<!-- but whose execution is (for the most part) delayed.  -->
<!-- Because they ultimately are JavaScript functions, their arguments also are evaluated immediately. -->

## Creation vs Execution

All `newX` commands are evaluated at the beginning of your experiment,
thus _creating_ elements in memory long before their containing trials are executed.
For example, the immediate evaluation of `newText` explains why we needed to pass the Var element 
to the [`text`]({{site.baseurl}}/text/text-text) command in the example above.
The same is true of the [`newTrial`]({{site.baseurl}}/global-commands/newtrial) 
and [`Template`]({{site.baseurl}}/global-commands/template) commands: 
all the trials are _created_ at the beginning of the experiment, regardless of when (and whether) 
they are executed upon runtime (again, this is why `order` in the example above is incremented immediately).

For exampe, using `newImage` in a [`test` command]({{site.baseurl}}/core-concepts/3_commands#test-commands) 
will always create an Image element, regardless of whether you end up printing it upon runtime. 
Let's say you have a table in which you reference image filenames in a column _for a subset of rows only_.
The following code will only run the Image element's `print` command for non-empty filenames, 
but your experiment will still try (and fail) to preload Image elements for the other trials too,
because you _create_ Image elements for every row, including those that point to an invalid (empty) filename:

<pre><code class="language-diff-javascript diff-highlight">
@Template( row =>
@    newTrial(
@        newText("Please answer the question below").print()
@        ,
%        newVar( row.Image )
%            .testNot.is("")
%            .success( newImage(row.Image).print() )
@        ,
@        newText( row.Question ).print()
@        ,
@        newTextInput("answer","").log().print().wait()
@    )
@)
</code></pre>

# Conditional statements

Based on what we said above, you may already see why you cannot simply inject
plain JavaScript `if` statements in a [`newTrial`]({{site.baseurl}}/global-commands/newtrial) command.
Not only will their execution _not_ be delayed, it would also be syntactically inappropriate:
ultimately, `newTrial` (and any PennController command for that matter) is a JavaScript _function_,
and code inside parentheses consists of _arguments_, which cannot be `if` statements.

Instead of JavaScript `if` statements, you can use [`test` commands]({{site.baseurl}}/core-concepts/3_commands#test-commands) as already illustrated above, and illustrated here again:

```javascript
newFunction( () => __counter_value_from_server__ % 2 )
    .test.is(0)
    .success( newImage("test.png").print() )
    .failure( newImage("filler.png").print() ) 
```

Note however that, in some cases, having the conditional take effect _immediately_
rather than upon runtime can be desirable. This is the case for the Image creation situation
described in the previous section. In such a case, 
you can use the JavaScript ternary conditional operator, which follows this syntax:

<pre><code class="language-diff-javascript diff-highlight">
@newText("Please answer the question below").print()
@,
$...( row.Image != "" ? [
$    newImage(row.Image).print() 
$] : [] )
</code></pre>

This will include the `newImage` command in the code and evaluate it
only when `row.Image` is a not an empty string.


# How can I still use plain JavaScript in my code?
 
There are some environments in PennController that allow you to inject plain Javascript in your code:

 + Passing a function to a Var element's `set` command:
 
<pre><code class="language-diff-javascript diff-highlight">
$newVar("RT").set( v=>Date.now() )
@,
@newKey("FJ").log().wait()
@,
$getVar("RT").set( v=>Date.now()-v )
</code></pre>

+  As a Function element:

<pre><code class="language-diff-javascript diff-highlight">
$newFunction("timestampMultipleOfThree", () => Date.now() % 3 )
@,
@newText("missed", "Bad luck, try again!")
@    .color("red")
@    .bold()
@,
@newButton("myButton", "Click me")
@    .print()
@    .wait(
$        getFunction("timestampMultipleOfThree")
$            .testNot.is()
$            .success( getText("missed").remove() )
$            .failure( getText("missed").print() )
@    )
```
</code></pre>

+ For immediate evaluation

<pre><code class="language-diff-javascript diff-highlight">
$var randomWord = ["hello","world","bye","earth","howdy","planet"].sort(v=>Math.random()-Math.random());
@
@Template( "table.csv" , row =>
@  newTrial(
@    defaultText.center()
@    ,
@    newText("How similar are these two words?").print()
@    ,
@    newText( row.Word + " -- " )
$        .after( newText(randomWord.pop()) )
@        .print()
@    ,
@    newScale(7)
@        .before( newText("Nothing alike") )
@        .after( newText("Basically identical") )
@        .center()
@        .print()
@        .wait()
@  )
@)
</code></pre>

In this example, we assume a 6-row table listing words in a column named _Word_.
We want to randomly pair each of those words with a word taken form another list of 6 words.

As soon as our experiment page opens, the JavaScript variable `randomWord` 
will contain a randomized array of 6 words. The 6 trials are then generated cycling through the table's rows,
and on each cycle, `randomWord.pop()` extracts the current last word from the array.

Once `Template` has been evaluated, all the trials and their elements have been created,
including 6 Text elements (one per trial) filled with words from the array. At that point,
before the trials even start _running_, the JavaScript variable `randomWord` no longer contains words, 
it is an empty array.
