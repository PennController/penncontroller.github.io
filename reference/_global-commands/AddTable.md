---
title: AddTable
syntax: AddTable()
parameters:
  - name: ID
    type: string
    description: To be filled in
  - name: CSV
    description: to be filled in
description: Defines a table to use with `PennController.Template`. As of PennController beta 0.4, you can directly upload a CSV file to the **Resources** or **chunk_includes** folders.
---

```javascript
AddTable( "myTable",             // Name of the table
    "Type,Sentence\n"+           // Column names (mind the \n)
    "practice,Hello world!\n"+   // First row (mind the \n)
    "test,Bye world!"            // Second row
);

Template( "myTable" , row => 
    newTrial(
        newText("type", row.Type)
            .print()
        ,
        newButton("sentence", row.Sentence)
            .print()
            .wait()
    )
);
```
