---
title: ⚠ Deprecated features
has_children: true
has_toc: false
nav_order: 4
---

# {{ page.title }}

---

This page is meant to help you troubleshoot your experiment.

It is a good idea to keep the Debug window **on** (ie. do not use `DebugOff`) until you are ready to collect data: the Debug window can provide you with very helpful feedback when troubleshooting your experiment

Below is a list of common issues. Click to unfold troubleshooting instructions. If you don't find an answer to your question, check [the forums](https://www.pcibex.net/forums/).

**My experiment is stuck on "Loading, please wait&#8230"**

There can be multiple causes for this problem:

- You have named one or several files with an uppercase extension, eg. <em>image.PNG</em>. Make sure to rename your files so they all have lowercase extensions (remember to update your scripts accordingly if needed).
- You are referring to a native-Ibex controller (eg. _DashedController_) in your script but you made a typo on its name, or you forgot to upload its script to _Modules/js_includes_, or you made a typo when naming the script file.

**My trial won't run / I can't see an element that I `print`ed**

Chances are that your script reached the end of a trial and moved to the next one before you got a chance to see what it printed on the screen. You need to code how the trial ends: by a [Key]({{site.baseurl}})/key/)press, by a click on a [Button]({{site.baseurl}})/button/), by waiting for a [Timer]({{site.baseurl}})/timer/), etc. Use the `wait` command on the corresponding element to prevent the trial for ending immediately.

**My image / audio / video won't preload**

- First, check for any mismatch between the name of the file and the name as you typed it in your script or in your table. You won't see an error message in case of a mismatch, but you will see everloading messages.
- Make sure that your resource file is properly uploaded to your experiment or to your distant host. If your resources are hosted on a distant server, check for any typo in the host's URL.
- If your resources are in a zip file, make sure that they are placed at the root of the zip file (not embedded in a subfolder) and that you have [properly set the CORS configuration]({{site.baseurl}}/how-to-guides/managing-resources/#zipped-resources) (if you initially named the file _htaccess.txt_, make sure to rename it _.htaccess_)
- If your resources are hosted on a distant server (whether directly or not as part of a zip file) make sure that the domain is secure (http**s**).
- Check that your table does not contain extra empty rows: if it does, your [`Template`]({{site.baseurl}}/global-commands/template/) command will generate extra trials using (invalid) empty resources.


**My audio / video won't play**

- Most browsers block automatic playback of multimedia files in an effort to block unsolicited ad-content. Make sure that your participant interacts with your experiment through a keypress or a click before automatic playback is supposed to start. Initial welcome/instruction/consent pages are an effective and sensible solution.
- Different browsers support different audio/video formats and encoding. If your audio or video file won't play, try converting it using another format or another codec. As a starting point, you can check [the w3schools guide on HTML Media](https://www.w3schools.com/html/html_media.asp) for pointers on multimedia browser support.
