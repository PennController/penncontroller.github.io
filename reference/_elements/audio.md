---
title: Audio
since: beta 0.3
element_type: audio
thumbnail: audio.png
parameters:
  - name: '"AUDIO_FILE_NAME.MP3"'
    description: The name of the audio file.
description: Creates an audio player.
notes: true
---

+ The `"URL"` argument can be omitted if:
  + The audio file has been uploaded to your experiment's **Resource** folder; or
  + The URL has been added as a default host URL by the command `AddHost`.
+ By default, PennController preloads all resources, which means that an experiment
will not start until the audio stream is stored in the browser’s cache. For more
information on audio streams, see [*HTML Audio*](https://www.w3schools.com/html/html5_audio.asp).
+ As of June 2019, some browsers prevent multimedia content from automatically playing
before the user has interacted with the page. Do not assume playback will
automatically start, if this is the first thing that should happen when your participants
open the experiment page. You should have a screen that asks participants to interact
with the page, for example by clicking a `Button`, before playing any audio.

<!--more-->

```javascript
// example
```
