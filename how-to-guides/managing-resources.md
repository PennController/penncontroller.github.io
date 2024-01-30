---
title: Managing resources
---

# Preloading resources

By default, all the resources start to preload when the experiment page opens, and every PennController trial, when executed, will pause the experiment if the specific resources it uses have not yet preloaded.

You can change this behavior and control <b>when</b> and <b>which</b> resources should be checked for preloading by using the command [CheckPreloaded]({{site.baseurl}}/global-commands.html#checkpreloaded). <!--more--> 


```javascript
CheckPreloaded()
```  
It creates a PennController trial which, when executed, will pause the experiment until all the resources are preloaded. You can also be more specific and only target resources used by PennController trials with certain labels: 

<!--more--> 

```javascript
CheckPreloaded(
    startsWith("practice")
    ,
    startsWith("test")
    ,
    "exitItem"
)
```  

This code will create a PennController trial which, when executed, will pause the experiment until preloading is complete for all the resources used by PennController trials whose labels start with practice, by PennController trials whose labels start with test, and by PennController trials whose labels correspond exactly to exitItem, and only by those.

Use the .label command on the PennController trial to label it so you can control when in the flow of your experiment the resources will be checked for preloading (see full example below).

You can also pass a number as the last argument to specify a delay (in milliseconds) after which, even if not all the resources have been preloaded, the next trial in the experiment flow should start anyway:

<!--more--> 

```javascript
CheckPreloaded(
    startsWith("test")
    ,
    5000
)
```  

# Complete example

> <b>Note!</b>
> To control <b>when</b> in the flow of your experiment the resources should be checked for preloading, use the .label command onto the PennController trial generated by PennController.CheckPreload to assign a label to it, and refer to the label in [PennController.Sequence]({{site.baseurl}}/global-commands/sequence/).



<!--more--> 

```javascript
Sequence( "welcome" , "preloadPractice" , startsWith("practice") , "preloadTest" , startsWith("Test") );


CheckPreloaded( startsWith("practice") )
    .label( "preloadPractice" );

CheckPreloaded( startsWith("Test") )
    .label( "preloadTest" );


newTrial( "welcome" ,
    newText( "message" , "Welcome. The resources are currently being preloaded. The next trial won't start before all the resources for the 'practice' trial are loaded (i.e. 1fishSquareTank.png).")
        .print()
    ,
    newButton("start", "Start")
        .print()
        .wait()
);

newTrial( "practice-1" ,
    newImage("tank", "1fishSquareTank.png")
        .print()
    ,
    newText("description", "The tank is round.")
        .print()
    ,
    newKey("validate", "FJ")
        .wait()
);

newTrial( "practice-2" ,
    newImage("tank", "1fishSquareTank.png")
        .print()
    ,
    newText("description", "The tank is square.")
        .print()
    ,
    newKey("validate", "FJ")
        .wait()
);

newTrial( "Test-1" ,
    newImage("tank", "2fishRoundTank.png")
        .print()
    ,
    newText("description", "The tank is round.")
        .print()
    ,
    newKey("validate", "FJ")
        .wait()
);

newTrial( "Test-2" ,
    newImage("tank", "2fishRoundTank.png")
        .print()
    ,
    newText("description", "The tank is square.")
        .print()
    ,
    newKey("validate", "FJ")
        .wait()
);

```  

# Zipped resources

> <b>Note!</b>
> Your ZIP file must be hosted on a domain with the same secure settings as the domain running your experiment. As of April 26, 2020, both the original Ibex Farm and the PCIbex Farm are hosted on a secure domain (https) Make sure the domain of your ZIP file matches the running https domain.

PennController offers two methods for including multimedia resources in your experiments:

1. each of them is separately hosted on and requested from a distant server
2. all of them are contained in a single ZIP archive that is hosted on and requested once from a distant server

If your experiment uses many files and is sent to many participants, the number of requests to the distant server can become quite massive. The second method has the advantage of sending only one request to the distant server, and making sure that all the resources are loaded locally in the cache of the participant’s browser.

The ZIP method comes with a limitation though: you need to upload your ZIP file on a server that allows cross-domain requests. This is typically NOT the case for cloud services such as Dropbox or Google Drive. If you access your server through an FTP protocol, chances are that you can apply the method below to grant your participants’ browsers access to your ZIP file.


# Requirements

+ Access to a host server that lets you configure CORS settings
+ All your resource files should be <b>at the root</b> of the ZIP archive, i.e. they should not be nested in a folder inside the ZIP file


# Uploading and granting access to ZIP files

1. Open your favorite text editor and enter the following:

<!--more--> 

```javascript
# with AJAX withCredentials=false (cookies NOT sent)
Header always set Access-Control-Allow-Origin "*"                  
Header always set Access-Control-Allow-Methods "GET"
Header always set Access-Control-Allow-Headers "X-Accept-Charset,X-Accept,Content-Type"
RewriteEngine On                  
RewriteCond %{REQUEST_METHOD} OPTIONS
RewriteRule ^(.*)$ $1 [R=200,L,E=HTTP_ORIGIN:%{HTTP:ORIGIN}]]
```  

2. Save your file under the name .htaccess making sure that no extension is added to the filename (mind the period at the beginning). If your editor or operating system does not allow you to give this name to your file, name it htaccess.txt: you will rename it later after uploading it on your server. <b>Note</b>: make sure to save it as plain text and not as, for example, Rich Text Format (RTF).

3. Using your method of choice (e.g., the software FileZilla) access your server and upload the ZIP file containing your resources in a dedicated folder (create a new folder if you do not already have a specific folder).

4. Upload your .htaccess file <b>in the exact same folder</b>. The .htaccess file grants access to any file located in the folder containing it to any scripts run in any browser, so it is important that you upload it in a folder that only contains files you are willing to grant such access to.

5. [OPTIONAL] If you could not use this filename before (due to your operating system’s settings for instance) rename your file .htaccess.


# In your IBEX Project

Simply refer to the ZIP files uploaded on your server by using the command [PreloadZip]({{site.baseurl}}/global-commands/preloadzip/). in your experiment’s script:

<!--more--> 

```javascript

PennController.ResetPrefix(null);

PreloadZip("https://files.lab.florianschwarz.net/ibexfiles/PennController/SampleTrials/stillalienspictures.zip"); // Pictures
PreloadZip("https://files.lab.florianschwarz.net/ibexfiles/PennController/SampleTrials/stillalienssounds.zip");   // Sounds

newTrial(
    newImage( "alien" , "alien_blue.png" )
        .settings.size( 200 , 200 )
        .print()
    ,
    newAudio( "sentence" , "stillalien1.mp3" )
        .play()
        .wait()
);

newTrial(
    newImage( "alien" , "alien_red.png" )
        .settings.size( 200 , 200 )
        .print()
    ,
    newAudio( "sentence" , "stillalien2.mp3" )
        .play()
        .wait()
);
```  



