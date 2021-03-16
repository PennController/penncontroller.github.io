---
title: UploadRecordings
syntax: UploadRecordings()
description: "Creates a trial which, when executed, will send the recordings collected so far via the MediaRecorder element to the URL provided to `InitiateRecorder`."
alternates:
  - name: "\"label\""
  - name: "\"label\" , \"noblock\""
notes: true
---

+ You can specify a label so as to control when the `UploadRecordings` is to be run in the flow of your experiment, by referencing the label in `Sequence`.

+ The trial will wait until the recordings are successfully sent, or until an error occurs, before moving to the next trial. Specify `"noblock"` as the second argument, after the label, if you want the next trial to start immediately, even if the send request has not completed yet.

+ A final `UploadRecordings` trial is automatically inserted before your results are sent to the experiment's server, which will wait until all the upload requests have completed before proceeding to sending the results.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@Sequence( 
@  "intro" 
@  ,
@  sepWith("sendAsync", "recordTrial") 
$)
@
@InitiateRecorder("https://my.server/path/to/uploadScript.php")
@  .label("intro")
@
$UploadRecordings("sendAsync", "noblock")
@
@newTrial("recordTrial", 
@  newText("Please act out happiness").print()
@  ,
@  newMediaRecorder("happiness").print().log().wait()
@)
@
@newTrial("recordTrial", 
@  newText("Please act out sadness").print()
@  ,
@  newMediaRecorder("happiness").print().log().wait()
@)
</code></pre>

+ Will start sending each video sample to the server immediately after it is recorded.		
