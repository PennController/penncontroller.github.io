---
layout: element
element_type: audio
title: Audio element
parent: Elements
has_children: true
has_toc: false
thumbnail: audio.png
syntax: newAudio("ELEMENT_NAME", "AUDIO_FILE_NAME.MP3")
description: Adds audio streams to an experiment.
notes: true
---

+ The `"URL"` argument can be omitted if:
  + The audio file has been uploaded to your experiment's **Resource** folder; or
  + The URL has been added as a default host URL by the command `PennController.AddHost`.
+ By default, PennController preloads all resources, which means that an experiment will not start until the audio stream is stored in the browser’s cache. For more information on audio streams, see [*HTML Audio*](https://www.w3schools.com/html/html5_audio.asp).
+ As of June 2019, some browsers prevent multimedia content from automatically playing before the user has interacted with the page. Do not assume playback will automatically start, if this is the first thing that should happen when your participants open the experiment page. You should have a screen that asks participants to interact with the page, for example by clicking a **Button**, before playing any audio.

<!--more-->

```javascript
// example
```
