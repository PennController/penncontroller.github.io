---
title:  PennController 1.8
tags: [versions]
---

[PennController 1.8](https://github.com/PennController/penncontroller/tree/master/releases/1.8){:target="_blank"}
is now available!

Newly created experiments on the PCIbex Farm come with it, and you can sync your
existing projects with the
[master branch](https://github.com/PennController/Sync){:target="_blank"}
to update your version of PennController.

## Major changes from 1.7

+ Replaced the [`VoiceRecorder` element]({{site.baseurl}}/deprecated/voicerecorder){:target="_blank"}, with the [`MediaRecorder` element]({{site.baseurl}}/elements/mediarecorder){:target="_blank"}, to allow for video sample collection.
  + Use `newMediaRecorder("name", "audio")` to collect audio only.
  + Pass `"video"` or simply drop the second parameter altogether to record audio and video.
+ Added the global command [`PennController.UploadRecordings`]({{site.baseurl}}/commands/global-commands/uploadrecordings){:target="_blank"}, which creates a trial that uploads the samples recorded (but not sent) so far.
+ Added the [`EyeTracker` element]({{site.baseurl}}/elements/eyetracker){:target="_blank"}, along with the global command [`EyeTrackerURL`]({{site.baseurl}}/commands/global-commands/eyetrackerurl){:target="_blank"}.
