---
title: AddHost
syntax: AddHost()
parameters:
  - name:  url 
description: "You can use `AddHost` to spare you from specifying a URL when you create an element with `newAudio`, `newVideo` or `newImage`. The URL **must end with `/`**."
notes: true
---

+ You can pass multiple URL strings (separated by comma) or use `AddHost` as many times as you want. If you do so, PennController will try to look for audio/images at the host URLs in the order they were provided, and stop looking as soon as it finds one.

+ Note that you can still directly specify URLs when creating a new element even if you added a host URL with `AddHost`.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
$AddHost("https://files.lab.florianschwarz.net/test/");
$AddHost("http://spellout.net/ibexfarm/static/images/");
@
@newTrial(
@    newImage("ibex", "ibex.jpg")
@        .print()
@    ,
@    newImage("wait", "https://openclipart.org/image/300px/svg_to_png/23920/Anonymous-Sandglass.png")
@        .print()
@    ,
@    newAudio("sentence", "test.mp3")
@        .play()
@        .wait()
@);
</code></pre>

+ The trial shows two images and plays one audio file. PennController will first try send a request for the file *https://files.lab.florianschwarz.net/test/ibex.png* and another one for the file *http://spellout.net/ibexfarm/static/images/ibex.png*. The same is true for the audio file: PennController will first send a request for the file *https://files.lab.florianschwarz.net/test/test.mp3* and another one for the file *http://spellout.net/ibexfarm/static/images/test.mp3*. PennController uses the resource from the first successfully resolving request: in this example, assuming there is a file named *ibex.png* at *http://spellout.net/ibexfarm/static/images/* and a file named *test.mp3* at *https://files.lab.florianschwarz.net/test/* (and only there), those are the resources that PennController will use (it may still trigger warnings in the console for the unsuccessful requests). PennController will only look for the *wait* image at *https://openclipart.org/image/300px/svg_to_png/23920/Anonymous-Sandglass.png*, since a full URL is provided there.

+ 		
