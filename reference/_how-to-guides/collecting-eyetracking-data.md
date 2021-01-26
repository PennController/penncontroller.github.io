---
title: Collecting eye tracking data
---

> Note!
> <b>Failing calibration with a score of 0? </b> Upload [this file](https://raw.githubusercontent.com/PennController/penncontroller/master/dev/js_includes/PennElement_eyetracker.js) to your project to overwrite the EyeTracker element (don’t mind the corresponding warning message in the Debug window)


> Note!
> The EyeTracker element is supported by a limited set of browsers. For best results, your participants should use Chrome desktop or Firefox desktop. Even so, calibrating is likely to fail for some of your participants for a number of reasons (ambient light, background shapes, facial characteristics, webcam position, etc.). Because chances are that several people will experience issues with eye-tracking, we advise awareness when recruiting participants. <b> If you recruit paid labor, set a time limit and be willing to pay participants who could not complete your experiment. </b>

In this guide, we will design a simple eye-tracking experiment splitting the page in four quarters. Our ultimate goal will be to plot a graph reporting the timecourse of gazes to each quarter over time. If all goes well, looks should converge toward the quarter that was clicked at the end of the trial.

Note that in order to collect eye-tracking data, you need to have access to a server where you can upload and execute PHP scripts. <b> Platforms like DreamHost offer this service with minimal setup, and server providers like Linode require more advanced setup. Resource-sharing services like Dropbox or Google Drive do NOT support PHP scripts. </b>


# The Experiment

Create a new experiment from the <b>Empty Project</b> and in the <b>Git Sync</b> form, type https://github.com/PennController/Template choose <b>eyetracker</b> from the branch. 

![alt text]({{site.baseurl}}/assets/images/githubsync.png)


