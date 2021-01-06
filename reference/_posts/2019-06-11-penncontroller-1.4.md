---
layout: post
title:  PennController 1.4
tags: [versions]
---

[PennController 1.4](https://github.com/PennController/penncontroller/tree/master/releases/1.5){:target="_blank"} is now available!

Newly created experiments on the PCIbex Farm come with it, and you can sync your existing projects with the [master branch](https://github.com/PennController/Sync){:target="_blank"} to update your version of PennController.

**Major changes from 1.3**:

+ The debugger window now shows up by default. Call PennController.DebugOff() to remove it before publishing.
+ Improved error detection and feedback in the debugger’s error tab, most notably: misspelled new/get/default* commands and undefined references inside PennController.Template.
+ The general element command .print can now take x/y arguments for all types of elements.
+ Key elements now log key presses using keys’ string representations rather than numeric key codes.
+ newKey now accepts special key names like “Shift” or “Enter” and named elements can take multiple key arguments, e.g. newKey( "validate" , "Enter" , " " ) creates a Key element listening for key presses on the Enter/Return key as well as on the space bar.
+ Using .log on PennController.InitiateRecorder() now also appends a value at the end of the result line corresponding to the archive’s upload.
+ Sample files collected with VoiceRecorder elements are now named after the element they correspond to (tip: in PennController.Template, name your VoiceRecorder elements using columns, e.g. newVoiceRecorder( 'sample-' + row.Item )).
+ When using several tables listing the same range of values in the Group column, PennController now enforces selecting rows corresponding to the same group from all tables.
+ PennController now waits before audio can be played fully before considering them preloaded. Earlier versions would only check that playback can start, making preloading faster but at the risk of potential lagging during playback.
+ Arrays returned by PennController.Template can now include labels, e.g. PennController.Template( "table.csv" , [ row.Type , "Messsage" , {html: row.Sentence} , "Question" , {q: row.Question, as: ["Yes","No"]} ] )

https://www.pcibex.net/2019/06/11/penncontroller-1-4/