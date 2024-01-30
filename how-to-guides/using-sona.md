---
title: Using SONA
---

{% capture label %}
Before collecting data from participants, make sure you understand how group assignment works in PCIbex experiments. See [this page from the advanced tutorial]({{site.baseurl}}/advanced-tutorial/10_counterbalancing.html#controlling-group-assignment) for some explanations.
{% endcapture %}
{% include label-note.html %}


To credit participants automatically via PCIbex for doing the experiments, <b> follow these steps exactly, and in order:</b>
    
1. The Study Information on your SONA Systems displays a linked button labeled "Sample Link with Embedded ID Code".

     ![alt text]({{site.baseurl}}/assets/images/sona3.png)
     
In PCIbex, include the following at the top of your experiment, below PennController.ResetPrefix(null) (search for [Header](https://doc.pcibex.net/global-commands/header/){:target="_blank"} , [log](https://doc.pcibex.net/standard-element-commands/standard-log/){:target="_blank"} , or [GetURLParameter](https://doc.pcibex.net/global-commands/geturlparameter/){:target="_blank"} for more details) to add the participant’s Sona ID to your results file (this can also be used to double check participation manually when needed):

```javascript
Header(
// void
)
.log( "sonaID" , GetURLParameter("id") )
```

2. Add a final page to your experiment after sending results that redirects to the Completion URL (client-side) provided in SONA. Copy and paste the entire URL from there to get the correct experiment_id and credit_token and replace the final ‘XXXX’ bit with "+ GetURLParameter("id")+" (including the straight double quotation marks), as illustrated below. You can copy & paste the following code, making sure to replace `EXPERIMENT_ID` and `CREDIT_TOKEN` with the values from SONA:

```javascript
newTrial( "final" ,
     newText("<p>Thank you for your participation!</p>")
          .center()
          .print()
     ,
     newText("<p><a href='https://upenn.sona-systems.com/webstudy_credit.aspx?experiment_id=EXPERIMENT_ID&credit_token=CREDIT_TOKEN&survey_code="+GetURLParameter("id")+"' target='_blank'>Click here to confirm your participation on SONA.</a></p> <p>This is a necessary step in order for you to receive participation credit!</p>")
          .center()
          .print()
     ,
     newButton("void")
          .wait()
)
```
    
(Note: the use of final ‘newButton’ command here ensures that participants cannot navigate past this page to avoid them accidentally missing the link to receive credit on SONA)
    
Following this process will automatically credit participants who take web study.  
     
+ Only the SURVEY_CODE value provided by SONA is stored as part of the results on PCIbex, so as long as you don’t collect any personal identifying data within your experiment, the results stored on PCIbex will be entirely anonymous.
