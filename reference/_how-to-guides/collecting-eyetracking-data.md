---
title: Collecting eye tracking data
---

> <b>Note!</b>
> <b>Failing calibration with a score of 0? </b> Upload [this file](https://raw.githubusercontent.com/PennController/penncontroller/master/dev/js_includes/PennElement_eyetracker.js)
to your project to overwrite the EyeTracker element (don’t mind the corresponding warning message in the Debug window).


> <b>Note!</b>
> The EyeTracker element is supported by a limited set of browsers. For best results, your participants should use Chrome desktop or Firefox desktop. Even so, calibrating is likely to fail for some of your participants for a number of reasons (ambient light, background shapes, facial characteristics, webcam position, etc.). Because chances are that several people will experience issues with eye-tracking, we advise awareness when recruiting participants. <b> If you recruit paid labor, set a time limit and be willing to pay participants who could not complete your experiment. </b>

In this guide, we will design a simple eye-tracking experiment splitting the page in four quarters. Our ultimate goal will be to plot a graph reporting the timecourse of gazes to each quarter over time. If all goes well, looks should converge toward the quarter that was clicked at the end of the trial.

Note that in order to collect eye-tracking data, you need to have access to a server where you can upload and execute PHP scripts. <b> Platforms like DreamHost offer this service with minimal setup, and server providers like Linode require more advanced setup. Resource-sharing services like Dropbox or Google Drive do NOT support PHP scripts. </b>


# The Experiment

Create a new experiment from the <b>Empty Project</b> and in the <b>Git Sync</b> form, type https://github.com/PennController/Template, and then choose <b>eyetracker</b> from the branch dropdown. 

![alt text]({{site.baseurl}}/assets/images/githubsync.png)

This will import all we need to run our experiment:

* A table file named clefts.csv that describes the different conditions of our design
* An aesthetics file named PennController.css that will take care of adding a frame around the element being looked at
* A main script file named main.js that defines the structure of our experiment and of our trials
* PennController.js

We will only take a look at main.js and simply skip over clefts.csv, as we will end up only using half of it anyway. The experiment is a simplified and decontextualized version of an experiment that was run with an EyeLink eye-tracker machine in Florian Schwarz’s lab.

On each trial, independent of the other trials, the participant is presented with four characters, each associated with a card showing one of the four suits hearts, diamonds, clubs or spades. The character are supposed to join the “house” corresponding to the suit of the card that they were dealt. The participant listens to a recording of the “role master” saying something about a named character, and their task is to identify as quickly as they can who is the named character using all the information available.


# Structure of the main script

This section gives an overview of the file main.js.

The three PreloadZip lines import the images and the audio files that we will use from a distant server. See the guide [Zipped Resources](https://www.pcibex.net/wiki/zipped-resources/) to learn more about it. 

The next EyeTrackerURL line specifies where to find the PHP script that will receive the eye-tracking data, and that will also take care of decoding the lines and serving them as CSV files at the analyses step. You should set up your own PHP script when running your own experiments, as this is where your participants’ data will be stored. We will come back to the PHP setup procedure below, but for the purpose of this experiment we can keep the provided URL.

You may have noticed that this experiment does not contain a [Sequence command](https://penncontroller.github.io/commands/global-commands/sequence/): all the trials will therefore be executed in the top-down order in which they are defined, and accordingly no label is explicitly assigned to any trial. A real experiment would of course do things differently and need to assign labels so as to randomize the presentation of the different trials.




