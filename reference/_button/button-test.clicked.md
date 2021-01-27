---
title: button.test.clicked
command_type: test
syntax: .test.clicked()
description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.
---

```javascript
newButton("print", "Print the buttons' words")
    .print()
    .wait()
    .remove()
,
getButton("top")
    .test.printed()
    .success( newText("top word", "hello").print() )

```