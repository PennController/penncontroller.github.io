---
title: Audio
since: beta 0.3
children_collection: audio
thumbnail: audio.png
parameters:
  - name: URL
    type: string
    description: The URL of the audio file.
description: Creates an audio player.
notes: true
---

+ As of June 2019, **some browsers prevent multimedia content from automatically playing**
before the user has interacted with the page.
    If automatic audio playback is important in your experiment, you should precede
    it with some sort of participant-page interaction, in order to make sure that
    automatic playback actually occurs. Clicking a `Button` or pressing a `Key`
    are examples of participant-page interaction.
+ By default, PennController preloads all resources, meaning that an experiment
does not start until the audio stream is stored in the browser’s cache.
+ Currently, the MP3 format is the only audio format supported across Internet
Explorer, Chrome, Firefox, Safari, and Opera. You may use WAV and OGG files in
your experiment, but be aware that some browsers do not support these formats.
For more information on web browser support, see
[Audio Format and Browser Support](https://www.w3schools.com/tags/tag_audio.asp){:target="_blank"}.

<!--more-->

```javascript
newAudio(row.audio).play().wait() 
```
