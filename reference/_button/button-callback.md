---
layout: command
command_type: action
element_type: button
title: button.callback
parent: Button
grand_parent: Elements
syntax: getButton("ELEMENT_NAME").once()
description: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
---

```javascript
newVideo("skate", "skate.mp4")
    .print()
,
newButton("(Re)play")
    .callback( 
        getVideo("skate")
            .stop()
            .play()
    )
    .print()
```