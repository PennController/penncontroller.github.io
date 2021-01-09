---
title: end
syntax: end()
description: Ends a trial immediately.
---

```javascript
PennController.ResetPrefix(null);

newTrial(
    newText("instructions", "Press F to end the trial immediately, or press J to continue.")
    	.print()
    ,
    newKey("fj", "FJ")
        .wait()
    ,
    getKey("fj")
        .test.pressed("F")
        .success(end())
        .failure(
            newText("continue", "The trial has continued! Press the spacebar to finish.")
                .print()
            ,
            newKey(" ")
                .wait()
        )
)
```

1. Prints the `"instructions"` **Text** element to the screen.
2. Creates the `"fj"` **Key** element and waits for the `F` or `J` key to be pressed.
  + If `F` was pressed, end the trial immediately.
  + Otherwise, print the `"continue"` **Text** element and wait for the `Spacebar` key to be pressed.