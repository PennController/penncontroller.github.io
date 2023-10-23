---
title: Using PROLIFIC
---

{% capture label %}
Before collecting data from participants, make sure you understand how group assignment works in PCIbex experiments. See [this page from the advanced tutorial]({{site.baseurl}}/advanced-tutorial/10_counterbalancing.html#controlling-group-assignment) for some explanations.
{% endcapture %}
{% include label-note.html %}

To credit participants automatically via PCIbex for doing the experiments, <b> follow these steps exactly, and in order:</b>
    
1. Visit the [Prolific website](https://www.prolific.co){:target="_blank"} and login to your account.  

2. Click on the "New Study" button to create a new study.

3. Now you need to edit the study link after filling out the previous information as seen in the following picture.
    
    ![alt text]({{site.baseurl}}/assets/images/prolific1.png)

    You should each of the three possible IDs on your picture based on your need. Note that the PROLIFIC_ID in our example is the unique ID for each participant.

4. Choose the method to confirm participants have to completed your study
   
   We recommend directing participants using an URL. Remember that URL because we will need it in our PCIbex code. 

5. Configure other options as well and then press save.

6. Now go to the PCIbex platform and enter the following code (remember to change the links to your own links obtained in the previous steps):

     ```javascript
     PennController.ResetPrefix(null) // Keep here

Sequence("trials", "prolific-consent", "confirmation-prolific", SendResults())

newTrial("prolific-consent",
  newHtml("prolific-consent.html").print()
  ,
  newButton("I consent").print().wait()
)

newTrial( "trials" ,
  newButton("This is a mock trial")
  .print()
  .wait()
)

newTrial( "confirmation-prolific" ,
    newText("<p>Thank you for your participation!</p>")
        .center()
        .print()
    ,
   // This is where you should put the link from the last step.
    newText("<p><a href='https://app.prolific.co/submissions/complete?cc=2RRF5B4I'>Click here to validate your submission</a></p>")
        .center()
        .print()
    ,
    newButton("void")
        .wait()
)
     ```

