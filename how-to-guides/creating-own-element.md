---
title: Create your own element type
---

As of version 1.9, PennController has [21 element types]({{site.baseurl}}/elements/).
While they come as precompiled in _PennController.js_, each element type can
actually be defined independently thanks to the command `PennController._AddElementType`.
If you browse PennController's source code, you will notice that
[each element type has its own definition file](https://github.com/PennController/penncontroller/tree/master/src/elements){:target="_blank"},
and all those definition files use `PennController._AddElementType`.

This page is meant to give you the conceptual and technical tools 
to create your own element type, so you can extend PennController
with new features as you will.

# Description of `_AddElementType`

Any call to `_AddElementType` should follow the following template.
Note that `NAME` should be 
an [UpperCamelCase](https://en.wikipedia.org/wiki/Camel_case){:target="_blank"}
string naming the element type, which will be used in 
[the `newName`/`getName` commands]({{site.baseurl}}/core-concepts/2_elements.html#creating-an-element).
`[ARGUMENTS]` indifferently stands for a single or a series 
of comma-separated optional arguments.

```javascript
PennController._AddElementType( NAME , function(PennEngine) {

  this.immediate = function(id, [ARGUMENTS]){
    // this is executed when the experiment page opens
    // id and ARGUMENTS refer to the arguments of newNAME
  };

  this.uponCreation = function(resolve){
    // this is executed when the trial's script reaches newNAME
  }

  this.end = function(){
    // this is executed just before the trial ends
  };

  this.value = function(){
    // this should return a representation of the element's value
  };
  
  this.actions = {
    ACTION_NAME: function(resolve, [ARGUMENTS]){
      // this is executed when the script reaches the command .ACTION_NAME([ARGUMENTS])
    },
    // etc.
  };

  this.test = {
    TEST_NAME: function([ARGUMENTS]){
      // this is executed when the script reaches the test command .test.TEST_NAME([ARGUMENTS])
      // this should return true or false
    },
    // etc.
  };
  
});
```

## Illustration of timeline execution

Let us illustrate how each part of an `_AddElementType` command
is executed by looking at the case of a simple `Text` element:

```javascript
newTrial(
  newText("instructions", "Please enter your name below:")
    .unfold(1000)
  ,
  newTextInput("name", "").print().wait().remove(),
  newVar("inputName").set(getTextInput("name"))
  ,
  getText("instructions")
    .text( getVar("inputName") )
    .test.text( "Jeremy" )
    .success( getText("instructions").color("green") )
    .failure( getText("instructions").color("red") )
  ,
  newButton("Next").print().wait()
)
```

1. When the experiment page opens, the `immediate` function of the Text element type
is executed with the arguments `"instructions"` (pointed at by `id`) 
and `"Please enter your name below:"` (single member of `[ARGUMENTS]`).

2. When the trial is run, the first command to be executed is the `newText` command.
At that point, the `uponCreation` function of the Text element type is executed,
and releases the script execution to move to the next command after it calls `resolve`.

3. The next command is `unfold`, called on that same Text element: the function `unfold`
referenced in the `this.actions` object is executed, with `1000` in place
of `[ARGUMENTS]` above. It releases the script execution to move to the next command
after it calls `resolve`.

4. The script eventually reaches `getText("instructions")`, which in and of itself executes
no part of the code in `_AddElementType`. When the script reaches `.text`,
it executes the function `text` referenced in the `this.actions` object,
with `getVar("inputName")` as the sole member of `[ARGUMENTS]`, 
which PennController automatically replaces with the corresponding value 
(in this case, what the participant typed in the TextInput element).
It releases the script execution to move to the next command after it calls `resolve`.

5. Then the script reaches `.test.text( "Jeremy" )` and executes the function `text`
referenced in the `this.test` object. This function does not put the execution on hold,
and immediately returns `true` or `false`, which calls the command(s) passed to 
the corresponding (and optional) `success` or `failure` command, respectively.

6. Depending on what the participant typed, the script will either reach
`getText("instructions").color("green")` or `getText("instructions").color("red")`

7. When the script reaches the end of the trial, it calls the `end` function 
of their corresponding type on all the elements contained in the trial,
including the Text element named _instructions_.

## Example

Create a new file named *PennElement_background.js* in your _Modules_ folder,
and paste the following code:

```javascript
PennController._AddElementType( "Background" , function(PennEngine) {
  this.immediate = function(id, initialColor){
    this._color = initialColor;
    this._defaultColor = $("html").css("background-color");
  };
  this.uponCreation = function(resolve){
    if (typeof this._color == "string"){
      $("body").css({transition: "background-color 2s", "background-color": this._color});
      setTimeout(resolve, 2000);
    }
    else
      resolve();
  }
  this.end = function(){
    $("body").css({transition: "none", "background-color": this._defaultColor});
  };
  this.value = function(){
    return this._color;
  };
  this.actions = {
    color: function(resolve, color){
      this._color = color;
      if (typeof this._color == "string"){
        $("body").css("background-color", this._color);
        setTimeout(resolve, 2000);
      }
      else
        resolve();
    }
  };
  this.test = {
    color: function(color){
      return this._color == color;
    }
  };
});
```

Now you can manipulate Background elements in your experiment!
Try adding this trial to your project's _main.js_ file:

<pre><code class="language-diff-javascript diff-highlight try-true">
@newTrial(
@    newButton("Start").print().wait().remove()
@    ,
$    newBackground("myBackground", "lightblue")
@    ,
@    newText("Change background color to:").print()
@    ,
@    newTextInput("color", "").print()
@    ,
@    newButton("Apply").callback(
@        newVar("newColor")
@        ,
@        getTextInput("color").setVar("newColor").disable()
@        ,
$        getBackground("myBackground").color(getVar("newColor"))
@        ,
@        getTextInput("color").enable()
@    ).print()
@    ,
@    newButton("Validate")
@        .print()
@        .wait(
$            getBackground("myBackground")
$                .test.color("pink")
$                .failure( newText("Sorry, you got the wrong color").print() )
@        )
@)
</code></pre>

The background color will turn light blue after a click on _Start_,
and to whatever color is typed into the _color_ TextInput element
upon click on _Apply_. Clicks on the _Validate_ button will only
end the trial if the background color is pink, and starting with the next trial, 
the background color will go back to what it was before clicking on _Start_.

# The PennEngine object

**To be written (`.Element.standardCommands`, `.controllers`, etc.)**

# The element object

**To be written (`this.jQueryElement`, `this.jQueryContainer`, etc.)**
