---
title: DownloadRecordingButton
syntax: DownloadRecordingButton()
parameters:
  - name:  text 
description: "Generates a `<button>` that, when clicked, proposes to download a ZIP archive containing all the media recordings collected during the experiment."
notes: true
since: PennController 1.8
---

+ This should be used only after the recordings have been sent to the server you specified as described on this page. You would typically send the results early with `SendResults` and show an exit page with the button after that.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@InitiateRecorder("https://myserver/uploadVoices/saveRecordings.php")
@
@newTrial( "record" ,
@    newMediaRecorder("recorder")
@        .print()
@        .wait()
@)
@
@SendResults()
@
@newTrial(
@    newFunction("check upload", ()=>PennController.uploadRecordingsError)
@        .test.is()
@        .success(
@            newText("confirmation", "The recordings were sent to the server. ")
@                .print()
@        )
@        .failure(
@            newText("error", "There was a problem sending the recordings to the server. ") 
@                .color("red")
@                .print()
@        )
@    ,
$    newText("download", DownloadRecordingButton("Click here to download an archive of your recordings.") )
@        .print()
@    ,
@    newTimer("inifinite", 0)
@        .wait()
@)
</code></pre>

+ Invites the participant to make a video recording and sends the results to the server. In this case, we specified a dummy URL, so uploading the recordings will fail, and `PennController.uploadRecordingsError` will accordingly be defined. The last screen will inform the participant of the error (since `PennController.uploadRecordingsError` is **not** void/undefined) and will show a button to download an archive of the recordings.
