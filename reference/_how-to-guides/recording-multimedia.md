---
title: Recording audio or video
---

This page describes the configuration you need to set up to record and collect audio and/or video samples with your project. Once you have set up your configuration, use the [MediaRecorder element]({{site.baseurl}}/mediarecorder/) to let your participants record audio samples.

{% capture label %}
Recording audio/video requires hosting your experiment on a secure domain. You can set up a project on either the PCIbex Farm or the original IBEX Farm, but you will need a personal server (with a secure domain too) to save the collected samples.
{% endcapture %}
{% include label-note.html %}

# Server setup

<b>Please note<b> that neither the [PCIbex Farm](https://farm.pcibex.net) nor the original [Ibex Farm](https://spellout.net/ibexfarm/) provide hosting for collected samples. You need to have access to a server where you can upload and execute a PHP file, and which will authorize the PHP file to upload ZIP files to a subfolder. Free web hosting services such as Dropbox or Google drive typically do NOT offer that option. Web hosting solutions that you access via FTP/SSH (e.g., Dreamhost) would typically do the job.
  
1. On your server, create a new folder dedicated to audio recording collection

2. In that folder, create a subfolder named uploads (all lower-case, note the s at the end)

3. Make sure the owner has permission to write the uploads subfolder: the first digit of the numeric permissions value should be 6 or 7; if you are using a terminal, try executing chmod -R 755 uploads from the main folder. The owner should correspond to the webserver user; with most configurations, that user is named www-data: if you are using a terminal, try executing chown -R www-data uploads/ from the main folder

4. In the main folder (i.e., NOT in uploads) upload a PHP file containing the following code:

<!--more--> 

```php
<?php
// via: https://github.com/muaz-khan/RecordRTC/blob/master/RecordRTC-to-PHP/save.php
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header('Access-Control-Allow-Headers: X-Requested-With, content-type, access-control-allow-methods');
// Comment out the line below right after data collection
header("Access-Control-Allow-Origin: https://farm.pcibex.net");
function selfInvoker()
{
    if (!isset($_POST['fileName'])) {
        echo 'PermissionDeniedError';
        return;
    }

    $fileName = '';
    $tempName = '';

    if (isset($_POST['fileName'])) {
        $fileName = $_POST['fileName'];
        $tempName = $_FILES['file']['tmp_name'];
    }

    if (empty($fileName) || empty($tempName)) {
        echo 'PermissionDeniedError';
        return;
    }
    $filePath = 'uploads/' . $fileName;

    // make sure that one can upload only allowed zip files
    $allowed = array(
        'zip'
    );
    $extension = pathinfo($filePath, PATHINFO_EXTENSION);
    if (!$extension || empty($extension) || !in_array($extension, $allowed)) {
        echo 'PermissionDeniedError';
    }

    if (!move_uploaded_file($tempName, $filePath)) {
        echo ('Problem saving file.');
        return;
    }

    echo ($filePath);
}
selfInvoker();
?>
```  

{% capture label %}
+ If your experiment is not hosted on the PCIbex Farm, modify the domain in the fourth line (https://farm.pcibex.net) accordingly. You can also replace it with * and the PHP script will accept upload requests from any domain, but this might not be the best idea. Read more about CORS permissions here. It is a good idea to either comment out the line or remove the PHP file from the server altogether after data collection to prevent any malicious attempt to externally upload files on your server.

+ **For maximal security, remove the PHP file from your server as soon as your are done collecting recordings.**

+ If you are still experiencing upload problems, make sure your PHP configuration has no open_basedir restriction at all, or that [open_basedir gives your PHP script permission to write in the uploads folder](https://stackoverflow.com/questions/13291185/how-to-set-for-specific-directory-open-basedir/13291257#13291257){:target="_blank"}.
{% endcapture %}
{% include label-note.html %}


# Project setup

You need to tell your experiment where to upload the recordings before any [MediaRecorder command]({{site.baseurl}}/mediarecorder/) gets evaluated. To this end, you should create a trial using the command [InitiateRecorder]({{site.baseurl}}/global-commands/initiaterecorder/). Make sure that the trial is run before any trial using a MediaRecorder element (use the .label command if needed). This is pretty simple in practice:

<!--more--> 

```javascript
Sequence("init","trial","upload");

// Indicate where to look for the PHP file you uploaded on you server
InitiateRecorder("https://my.server/myExperiment/myFile.php").label("init");

newTrial( "trial",
  newText("instructions", "Please record a sample and proceed.")
      .print()
  ,
  newMediaRecorder("recorder")
      .print()
  ,
  newButton("continue", "Click here to continue")
      .print()
      .wait()
);

UploadRecordings("upload")
```  

