---
title: CheckPreloaded
syntax: CheckPreloaded()
description: "*PennController* always starts the preloading of every image, audio and video resource used in your experiment as soon as the experiment starts running and, by default, it will wait before running a trial that all the resources it uses are preloaded. Since this could result in undesirable random breaks in the flow of your experiment, you can control when *PennController* should check that the resources used by (subsets of) your trials are preloaded before proceeding by using `CheckPreloaded`."
alternates:
  - name: " labels "
  - name: " delay "
  - name: " labels , delay "
notes: true
---

+ **Note** that `CheckPreloaded` inserts a trial in your experiment the same way `newTrial` does. You can label the generated trial by using the `label` command so you can refer to it within `Sequence`.

+ You can also define a delay after which the trial sequence will proceed anyway if preloading fails, by passing a number as the last parameter of the command (in *milliseconds*). Each resource that PennController fails to preload will be reported in a new line in the results file.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
$CheckPreloaded("audio", "video");
@
@newTrial( "audio" ,
@    newAudio("audio file", "test.mp3")
@        .print()
@        .play()
@        .wait()
@);
@
@newTrial( "video" ,
@    newVideo("video file", "skate.mp4")
@        .print()
@        .play()
@        .wait()
@);
@
$CheckPreloaded();
@
@newTrial( "filler" ,
@    newImage("image", "square.png")
@        .print()
@    ,
@    newKey("fj", "FJ")
@        .wait()
@);
@
@newTrial( "test" ,
@    newImage("image", "triangle.png")
@        .print()
@    ,
@    newKey("fj", "FJ")
@        .wait()
@);
</code></pre>

+ Will make sure that *test.mp3* and *skate.mp4* are fully preloaded before running the very first PennController trial, labeled *audio*. After the PennController trial labeled *video* has ended, will make sure that *all* image, audio and video resources ever used in the experiment are preloaded before running the trial labeled *filler* (which practically means it will check that *square.png* and *triangle.png* are preloaded, since the first preloader made sure the audio and video resources were already preloaded).		
