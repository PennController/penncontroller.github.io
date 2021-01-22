---
<<<<<<< HEAD
layout: element
title: DropDown element
parent: Elements
thumbnail: sample-element.png
syntax: newX("id", "arg")
blurb: To be filled in...
description: Lorem *ipsum* dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. **Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.** Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui `officia deserunt` mollit anim id est laborum.
---

## Example
```javascript
// example
```
=======
title: DropDown
since: PennController 1.2
element_type: dropdown
thumbnail: dropdown.png
description: Represents a drop-down list.
parameters:
  - name: '"DEFAULT_TEXT"'
    description: To be filled in.
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
>>>>>>> pcibex/master
