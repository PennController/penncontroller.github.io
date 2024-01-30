---
title: Setting up a server
---

# Prerequisites

You will need a _standalone_ version of your experiment in order to run it outside the PCIbex Farm. 

When editing a project on [the PCIbex Farm](https://farm.pcibex.net){:target="_blank"},
you can click the _..._ button to the right of the _Download_ button and then click on
_Download standalone version_ to download an archive that contains all the necessary files
to upload to your webserver and run your experiment.

# The original IBEX way (python 2)

Please refer to [the original Ibex documentation](https://github.com/addrummond/ibex/blob/master/docs/manual.md#setting-up-the-server){:target="_blank"} for instructions on how to set up your own server using a python 2 CGI script

# Static / python 3

[This page](https://github.com/JeremyZehr/penncontroller_new/tree/main/lib){:target="_blank"}
hosts two python 3 script files named _static.py_ and _server.py_ that you can apply to the standalone version
of your experiment in order to serve it either statically (no server setup required) or on a simple local server

## Static

_static.py_ takes the standalone experiment folder and outputs a static experiment in another folder.
The resulting experiment can be run entirely locally in a web browser, without even needing a local server.
That being said, because of the absence of a server, it won't support automatic update of the counter,
or sending of the results: by default the counter will be set to a random value between 0 and 1000,
or to the value passed to the withsquare parameter in the URL, 
and the browser will open a prompt to download the results as a file on the device. 
You can still run the output on a server: to obtain the exact same behavior, 
make sure to pass static=1 as a parameter in the URL, 
or don’t pass it if you want to handle the counter and the results file on the server.

Usage example: `python3 static.py -i ./ibex_exp -o ~/static_exp`

## Local server

_server.py_ will run a very simple server that handles counter updates, 
saving results and serving files. Note that it was not designed to be used as a public web server,
although it could technically be implemented as such — it works well as a local server though. 
It will run at localhost:3000 by default, but you can update the port by setting `PORT`
at the top of the script to a different value. 
Also make sure to edit `PRIVATE_DIRECTORY` and `PUBLIC_DIRECTORY` 
to point to the directories you want to use on your machine: 
`PRIVATE_DIRECTORY` is where you will have the counter and results file, 
and it should not be publicly exposed 
(although if you’re running a local server, it doesn’t matter much); 
`PUBLIC_DIRECTORY` is the directory serving files, 
and it should be set to point to the output folder of static.py above (in this example, ~/static_exp/) 
this way it can serve multimedia files, for example. 
Finally note the line `response.headers["Access-Control-Allow-Origin"] = "*"`: 
this will accept incoming requests from any domain (including localhost, crucially) 
so make sure to edit it if you need to make things more secure.

Usage example: `python3 server.py`
