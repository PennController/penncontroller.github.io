---
title: DropDown
since: PennController 1.2
parent: Elements
children_collection: dropdown
thumbnail: dropdown.png
description: Represents a drop-down list.
parameters:
  - name: DEFAULT_TEXT
    type: string
    description: represents default text displayed
notes: true
--- 

+ By default, a **DropDown** element does not have any options. To add
options, use the command `dropdown.add`.
+ The <code>"<var>DEFAULT_TEXT</var>"</code> string parameter does not create
a drop-down list option.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight">
newTrial("option-1",
    newText("like", "I like ")
    ,
    newDropDown("fruits", "(select a fruit)")
        .add("apples", "bananas", "oranges")
        .before(getText("like"))
        .print()
)

newTrial("option-2",
    newDropDown("fruits", "(select a fruit)")
        .add("apples", "bananas", "oranges")
    ,
    newText("like", "I like ")
        .after(getDropDown("fruits"))
        .print()
)
</code></pre>
