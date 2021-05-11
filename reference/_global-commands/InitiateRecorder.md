---
title: InitiateRecorder
syntax: InitiateRecorder()
parameters:
  - name:  url 
description: "Use this to specify the URL of the PHP file to upload the audio recordings collected during the experiment."
alternates:
  - name: " url , message "
notes: true
---

+ `InitiateRecorder` creates a PennController trial asking for the participant's consent to record audio samples. You can specify a `message` to replace the default one. Use the `label` command on it to determine when it should appear in your sequence of trials.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-data">
@
@Sequence("first_trial", "second-trial")
@
$InitiateRecorder(
$    "https://myserver/uploadVoices/saveRecordings.php"
$    ,
$    "This experiment collects audio recordings. **Once you grant it access to your recording device, you will be notified of whether you are being recorded by a label at the top of the page**"
$)
$.label("first-trial")
@
@newTrial( "second-trial" ,
@    newMediaRecorder("recorder", "audio")
@        .print()
@        .wait()
@)
</code></pre>

+ Adds a page asking for the participant's authorization to use their recording device, using a custom text message.		
