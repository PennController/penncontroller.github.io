---
title: ResetPrefix
syntax: ResetPrefix()
parameters:
  - name:  "prefix" 
description: "By default, all the commands to create and refer back to elements in a PennController trial should be preceded by a prefix (`PennController.Elements.` as of beta 0.3). It is standard practice that every command added by a javascript module (which is what PennController is) uses a specific prefix (in this case, `PennController`). This is to avoid inadvertently overwriting (or being overwritten by) commands of the same names defined somewhere else, outside of the module. For instance, it could be that you or another module defined a function `getImage` which, say, takes a filename and adds it at the end of a certain URL (this would be useful if you defined many items using built-in Ibex controllers that contain images and you do not want to type the host URL each time)."
alternates:
  - name: " null "
notes: true
---

+ Yet, having to write `PennController.Elements.` before each creation of/reference to an element would be particularly long, painful and not necessarily fit to your aesthetic preferences. Consider this:

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
@PennController.newTrial(
$    PennController.Elements.defaultImage
@        .size(80, 80)
@    ,
$    PennController.Elements.newText("helloworld", "Hello world!")
@        .print()
@    ,
$    PennController.Elements.newCanvas("geometry", 200, 100)
$        .add(  10, 10, PennController.Elements.newImage("left image", "triangle.png") )
$        .add( 110, 10, PennController.Elements.newImage("right image", "square.png") )
@        .print()
@    ,
$    PennController.Elements.newSelector("shapes")
$        .add( PennController.Elements.getImage("left image") , PennController.Elements.getImage("right image") )
@        .print()
@        .wait()
@);
</code></pre>

+ Long, painful and a little messy, right?

+ Now if you already have a `getImage` function defined somewhere else and you do not want to rename it, but you do not want PennController to erase it either, you can choose to reset the prefix to make everything shorter while keeping your own `getImage` function. For instance, you can choose to use the prefix `E` for ***E**lement* (assuming no script defined a global object named *E* otherwise):

<pre><code class="language-diff-javascript diff-highlight try-data">
@
+PennController.ResetPrefix("E");
@
@E.newTrial(
$    E.defaultImage
@        .size(80, 80)
@    ,
$    E.newText("helloworld", "Hello world!")
@        .print()
@    ,
$    E.newCanvas("geometry", 200, 100)
$        .add(  10, 10, E.newImage("left image", "triangle.png") )
$        .add( 110, 10, E.newImage("right image", "square.png") )
@        .print()
@    ,
$    E.newSelector("shapes")
$        .add( E.getImage("left image") , E.getImage("right image") )
@        .print()
@        .wait()
@);
</code></pre>

+ This is already much better. But to the extent that PennController's element commands have names that are not used by default Ibex projects, you may want to straight out drop the prefix using `PennController.ResetPrefix( null )`, which is what is assumed throughout this documentation (no longer assuming the pre-existence of a *getImage* function in your project).		
