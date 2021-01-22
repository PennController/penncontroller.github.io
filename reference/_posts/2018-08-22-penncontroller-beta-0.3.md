---
title:  PennController beta 0.3
tags: [versions]
---

[PennController 1.0](https://github.com/PennController/penncontroller/tree/master/releases/1.0){:target="_blank"}
is now available! This is the first public release of a non-beta version.

Changelog

Fixes

+ Proceeded to complete engine overhaul
+ Default prefix is now ‘Elements’ (e.g. PennController.Elements.newText("myText", "hello") )
+ Fixed ResetPrefix (was testing type with “text” insteand of “string”)
+ New format for saved lines (now [ElementType, ElementName, Parameter, Value, EventTime, Comments])
+ Default commands are now specific to a trial
+ Printed elements are now all embedded in a container DIV and assigned classes based on their type and their name
+ Trials can now be run multiple times (when their labels appear more than once in shuffleSequence)
+ GetTable().setLabel, GetTable().setItem and GetTable().setGroup now return the table
+ Settings commands ‘before’ and ‘after’ now inherit blocking from the commands they execute
+ Scale buttons now save option’s index if no label was specified
+ Fixed timer.settings.callback (froze)
+ Fixed key.test.pressed()

New features
+ PennController._AddElementType for developers to design their own element types like text, audio, etc.
+ PennController._AddStandardCommands for developers to add commands to all elements of all types
+ Added PennController.Header and PennController.Footer
+ Added .noHeader and .noFooter methods for PennController
+ Added .log method for PennController, to add columns (previously known as .logAppend, which now adds *lines*)
+ Added .setOption method for PennController
+ Added new element type: Var
+ Added new element type: Tooltip
+ Added Settings command .slider for Scale elements
+ Added Settings commands .horizontal and .vertical for Scale elements
+ Added Test command .ended for Timer elements
+ Added Action command .stop for Timer elements
+ Added Test command .clicked for Button elements
+ Added Settings command .length for TextInput elements
+ Added Test command .complete and Action command .warn for Html elements
+ Added Settings command .once for Youtube elements
+ Added Test commands .ended and .clicked for Youtube elements
+ Added Test command .printed as Standard
+ Added Settings commands .hidden and .visible as Standard
+ Added Settings command .settings.selector as Standard (added by Selector)
+ Added Action command .setVar as Standard (added by Var)
+ Added options to .settings.log for TextInput, including possibility to record every single key press

https://www.pcibex.net/2018/08/22/hello-world-2/
