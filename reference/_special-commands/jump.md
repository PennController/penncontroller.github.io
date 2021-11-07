---
title: jump
syntax: jump()
description: Navigates the sequence and jumps to the part specified.

---

 ```javascript
 newButton("botao7", "Voltar")
    .callback(jump("pratica1"),end())
    .before( newButton("botao8", "Seguir") ) 
    .css("margin-left","1em")
    .print()
,
getButton("botao8").wait()
 ```

+ When the button is pressed, "practica1" trial is showed.
