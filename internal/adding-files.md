---
layout: default
title: Adding files
parent: Internal documentation
has_children: true
has_toc: false
---

# {{ page.title}}

test 

> info "The information header"
 > Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean interdum, ligula in
 > ultrices sodales, ante enim scelerisque diam, nec molestie lorem nulla sit amet dolor.
 > Aenean id augue ante. Duis ut mi faucibus, pellentesque sem quis, gravida nisi. Nam cursus.


<pre><code class="language-diff-javascript diff-highlight"> 
!// This is the BasicTutorial experiment.
 // Type code below this line.
 
+// Remove command prefix
-PennController.ResetPrefix(null)
 
+newTrial("second-trial")
 
 newTrial("third-trial")
newTrial("fourth-trial")

+newText("instructions", "Press the F key if the image on the left matches the sentence. Presss the K key if the image on the right matches the sentence.")
     .center()
+    .italic()
!    .print()
</code></pre>

```javascript
 // This is the BasicTutorial experiment.
 // Type code below this line.

+// Remove command prefix
-PennController.ResetPrefix(null)

+ newTrial("first-trial")
+newTrial("second-trial")

 newTrial("third-trial")
newTrial("fourth-trial")

+newText("instructions", "Press the F key if the image on the left matches the sentence. Presss the K key if the image on the right matches the sentence.")
    .center()
+    .italic()
    .print()
```
