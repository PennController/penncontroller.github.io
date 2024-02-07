---
title: Image
since: beta 0.3
parent: Elements
children_collection: image
thumbnail: image.png
parameters:
  - name: URL or reference
    type: string
    description: The URL of the image file or the reference to the image
description: Represents an image.
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newImage("img1", row.printimages)
@.print()
@.log()
</code></pre>

+ Prints an image from the row "printimages" from the table and logs the print time of the element in the result file.
