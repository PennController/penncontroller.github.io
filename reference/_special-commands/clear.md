---
layout: command
command_type: special
title: clear
parent: Special commands
grand_parent: Commands
syntax: clear()
description: Removes from the screen any element that was previously added during the trial.
---

 ```javascript
newText("helloworld", "Hello world!")
    .print()
,
newImage("smiley", "ya.png")
    .print()
,
newButton("erase", "Erase")
    .print()
    .wait()
,
clear()
,
newButton("void", "Enough with the emptiness")
    .print()
    .wait()
 ```

1. Prints a line of **Text**, an **Image** and a **Button** with the text `"erase"` to the screen. 
2. Remove the three elements from the screen when the `"erase"` **Button** is clicked.
3. Print a new **Button** that is waiting to be clicked to the screen.