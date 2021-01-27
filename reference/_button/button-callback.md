---
title: button.callback
command_type: action
syntax: .once()
description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.
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