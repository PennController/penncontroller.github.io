---
layout: command
command_type: test
title: button.test.clicked
parent: Button element
grand_parent: Elements
syntax: getButton("ELEMENT_NAME").test.clicked()
description: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
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