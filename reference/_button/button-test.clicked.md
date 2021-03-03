---
title: button.test.clicked
command_type: "test"
syntax: .test.clicked()
description: "Tests whether the button was ever clicked before."
---

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-true">
@newButton("test", "It's a test!")
@    .log()
@    .once()
@    .print()
$    .test.clicked()
@,
@newAudio("sound", "test.mp3")
@    .play()
@    .wait()
</code></pre>
