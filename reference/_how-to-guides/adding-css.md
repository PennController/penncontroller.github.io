---
title: Adding custom CSS
---

Multiple settings commands provide you with basic ways to play with the aesthetics of a given element within a trial’s script. If you want to customize your experiment’s visual rendering though, it is a good idea to consider defining general aesthetics for your experiment.

Each element type comes with its own [CSS Classes](https://www.w3schools.com/Css/), so you can upload a file named PennController.css to your PCIbex Farm project’s folder.

If you want to add 10px above and below <b>each</b> Text element on the page, you can write this in your PennController.css file:

<!--more-->

```javascript
.Text-container {
  margin: 10px auto;
}
```

However you want to change the style of the experiment, you can edit PennController.css file to change any CSS setting.

You could also directly use the command .css on the Text element in your experiment instead of changing PennController.css file:
 
 <!--more-->

```javascript
newText("dots")
    .css("text-decoration","underline")
    .print()
```

