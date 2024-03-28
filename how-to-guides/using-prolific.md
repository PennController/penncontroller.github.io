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
    
    ![After entering Prolific page for creating the new study, you need to edit/take a look the study link. Study link will usually contain PRILIFIC_ID, STUDY_ID and SESSION_ID. STUDY_ID and SESSION_ID are optional.]({{site.baseurl}}/assets/images/prolific1.png)

    You should change each of the three possible IDs based on your need. Note that the PROLIFIC_ID in our example is the unique ID for each 
    participant.
    
4. In PCIbex, include the following at the top of your experiment, below PennController.ResetPrefix(null) (search for [Header]({{site.baseurl}}/global-commands/header/){:target="_blank"} , [log]({{site.baseurl}}/standard-element-commands/standard-log/){:target="_blank"} , or [GetURLParameter]({{site.baseurl}}/global-commands/geturlparameter/){:target="_blank"} for more details) to add the participant’s Prolific ID to your results file (this can also be used to double check participation manually when needed):
     
     ```javascript
     Header(
        // void
     )
     .log( "PROLIFIC_ID" , GetURLParameter("id") )
     ```

5. Choose the method to confirm participants have to completed your study
   
   We recommend directing participants using an URL. 
   
    ![Scrolling down, you will see the section which asks you to choose how you want to direct participants. We recommend choosing an URL, since the URL can be copied in PCIbex code down below. ]({{site.baseurl}}/assets/images/prolific2.png)
   
   Add a final page to your experiment after sending results that redirects to the Completion URL (client-side) provided. Copy and paste the entire URL from there to get the correct redirection. You can copy & paste the following code and change the redirection URL to match the redirection URL on your Prolific page:
   
   ```javascript
    newTrial( "final" ,
        newText("<p>Thank you for your participation!</p>")
            .center()
            .print()
        ,
        newText("<p><a href='https://app.prolific.co/submissions/complete?cc=CODE'"+ GetURLParameter("id")+"' target='_blank'>Click here to confirm your participation on Prolific.</a></p> <p>This is a necessary step in order for you to receive participation credit!</p>")
            .center()
            .print()
        ,
        newButton("void")
            .wait()
        )
    ```   
    
    However, your redirection URL may differ. It can include your own written code instead of CODE portion in https://app.prolific.co/submissions/complete?cc=CODE. The most important part is to include your redirection link (however it looks like on Prolific page) at the end of the experiment under the final trial. 
    
    (Note: the use of final ‘newButton’ command here ensures that participants cannot navigate past this page to avoid them accidentally missing the link to receive credit on Prolific)
    
    Following this process will automatically credit participants who take web study.  

6. Configure other options as well and then press save.

7. Your final code should look like this:

     ```javascript

        PennController.ResetPrefix(null) // Keep here
         
        Header(
            // void
        )
        .log( "PROLIFIC_ID" , GetURLParameter("id") )
     
        Sequence("trials", "prolific-consent", SendResults(), "confirmation-prolific")

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
            newText("<p><a href='https://app.prolific.co/submissions/complete?cc=CODE'>Click here to validate your submission</a></p>")
                .center()
                .print()
            ,
            newButton("void")
                .wait()
        )
     ```

