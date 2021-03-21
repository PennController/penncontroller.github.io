---
title: Using JavaScript
---

# What should I keep in mind when using plain JavaScript?

PennController commands are executed upon runtime, whereas all JavaScript code (unless embedded in a newFunction element) is executed at the very beginning of the experiment. In the other words, using plain JavaScript code in your experiment might cause experiment being incorrect, as the JavaScript code is executed at the beginning, not the runtime.
Furthermore, all the newElements are evaluated at the beginning of the experiment, regardless of whether/when their stack of commands (print, wait, etc.) ends up being executed at runtime.

# Does that mean that I cannot use if statements in my PennController code?

We strongly encourage you to use the command test instead of if statement as follows:

```javascript
newFunction("Checker" , () => { Palette.test.color("MyCanvas", "white");}) 
        .test.is(true)
        .success( getButton("Continue").print(475,300))
        .failure( getFunction("Checker").call()) 
```

 Using if statements as plain JavaScript will be wrong, because the if statement will be executed even before the participant reaches the Trial. Furthermore, using an if statement inside a newTrial command just like that is invalid syntax: as far as JavaScript is concerned, newTrial is a function and the commands passed to it are simple function arguments - passing an if statement as an argument to a JavaScript function is wrong. However, there is a way how you can use if syntax by using the ternary syntax as follows:

```javascript
newText( row.Question ).print()
,
...( row.ShowImage == "Yes" ? [
    newImage( row.Image ).print() 
] : [] )
```

# How can I still use plain JavaScript in my code?
 
 There are some occasions in which you can still use plain Javascript in your code, and they are as follows:

 + Passing a function to a VarSet command    
 
```javascript
newVar("RT").set( v=>Date.now() )
,
newKey("FJ").log().wait()
,
getVar("RT").set( v=>Date.now()-v )
```

+  As a Function element

```javascript
newFunction("timestampMultipleOfThree", () => Date.now() % 3 )
,
newText("missed", "Bad luck, try again!")
    .color("red")
    .bold()
,
newButton("myButton", "Click me")
    .print()
    .wait(
        getFunction("timestampMultipleOfThree")
            .testNot.is()
            .success( getText("missed").remove() )
            .failure( getText("missed").print() )
    )
```

+ Manipulating arrays counters in Template function 

This is quite advanced and should be avoided whenever possible. Assuming we know in advance that table.csv contains 6 rows:


```javascript
var randomWord = ["hello","world","bye","earth","howdy","planet].sort(v=>Math.random()-Math.random());

Template( "table.csv" , row =>
  newTrial(
    defaultText.center()
    ,
    newText("How similar are these two words?").print()
    ,
    newText( row.Word + " -- " )
        .after( newText(randomWord.pop()) )
        .print()
    ,
    newScale(7)
        .before( newText("Nothing alike") )
        .after( newText("Basically identical") )
        .center()
        .print()
        .wait()
  )
)
```
Because the Array method pop returns the last member of the array and actually deletes it from the array, randomWord will be 1 member shorter every Template cycle (every time an arrow is processed is same as every time a new trial is generated).


Furthermore, because we used sort (v=>Math.random()-Math.random()), the association between each row's Word column and one of the strings in randomWord will be random.

