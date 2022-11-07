---
title: Post 11/6/22 maintenance update + Notes & Suggestions
tags: [status update]
---

We’re happy to report that the farm at farm.pcibex.net is back to normal operation. A few notes and suggestions to help with keeping things as smooth as possible moving forward, both for you and for us:
 
+ The perennial *‘save’ issue should be somewhat alleviated (or even absent) for now, but we’re still working towards implementing a full solution 
to keep it from happening in the future. In the meantime, recall that the **easiest work-around is to edit your scripts locally** in an editor of your choice, 
and then upload it to the resources section when ready to test or run the experiment. This ensures both that you’ll always have a local back-up copy of 
your work, and that the version on the farm reflects all your latest changes properly when testing.
+ Concerning file resources (images, audio, etc.), the best and most reliable solution for smooth loading and running on the participant’s end 
is to **host zipped resources on a server space of your own**, rather than uploading them directly under resources. That way, only one file is called 
(the zip-file), and once that is loaded, all resources are available locally on the user-side for the experiment to run smoothly. 
See https://doc.pcibex.net/how-to-guides/managing-resources/#zipped-resources for documentation.
+ When **experiencing delays in accessing results**, just let the browser window sit after clicking on ‘download’ – **give it at least a couple of minutes 
before trying again**, and only download one results file at a time: the more requests for results files the server receives and has to treat in parallel, 
the slower every request will be!
+ When running into any issues, **please search the forums** (https://www.pcibex.net/forums/) first, and then consider posting there if you can’t find a 
discussion helping you with an issue, so that others can benefit from answers to your questions moving forward.
+ For those with relevant expertise and technical resources, remember **you can set up your own server for data collection**. This lets you take advantage 
of the PCIbex farm environment for development and implementation, but makes your data collection independent from any issues that can arise every once in a while on the farm, like last week. Simply develop your project on the PCIbex farm, then click on ‘Download standalone’ under Download, and you have everything you need for running and collecting data for your experiment on your own server. See https://doc.pcibex.net/how-to-guides/setting-up-server/ for details and link to original Ibex documentation by Alex Drummond for setting up a server.

Finally, for those of you interested in, or curious about, **web-cam based eye tracking** using PCIbex, an exciting new article showing both potential 
and limitations of this just came out in Behavior Research Methods (congrats, Mieke & Robert!):

Mieke Sarah Slim & Robert J. Hartsuiker (2022). Moving visual world experiments online? A web-based replication of Dijkgraaf, Hartsuiker, 
and Duyck (2017) using PCIbex and WebGazer.js, Behavior Research Methods. DOI https://doi.org/10.3758/s13428-022-01989-z
 
**Thanks for your patience** with the recent farm troubles. Our user base has grown enough (which is exciting!) that sometimes demand 
and usage volume creates issues for our setup. **PCIbex is provided for free and maintained as a labor of love**, with basically all 
the crucial technical work done by Jeremy Zehr (and financial support provided by MindCORE @ Penn for server costs) – thus at
 times when maintenance needs arise, we can’t always respond as quickly as users might like (and as commercial outfits with paid 
staff might be able to). **We always welcome inquiries from people interested in helping or getting involved**, and even just simply 
having more people that answer questions on the forum would be of great help.
 
Best,
Florian & Jeremy
 
PS: **We appreciate you citing us** as:
Zehr, J., & Schwarz, F. (2018). PennController for Internet Based Experiments (IBEX). https://doi.org/10.17605/OSF.IO/MD832
in any work and presentations based on data collected using PCIbex, which also helps us to keep track of work happening using the platform!
