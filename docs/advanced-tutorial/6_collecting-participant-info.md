---
layout: default
title: Collecting participant information
parent: Advanced Tutorial
nav_order: 6
---
## {{ page.title }}

This section describes ways of collecting participant responses:

+ [Creating an obligatory checkbox for a consent form](#obtaining-participant-consent)
+ [Logging participant IDs with a global variable](#recording-participant-ids)

### Obtaining participant consent

An [**Html** element]({{site.baseurl}}/docs/elements/html){:target="_blank"} lets you insert an existing HTML document in a PennController experiment. This can be useful for displaying an informed consent form; instead of creating and printing many **Text** elements, you can print a single **Html**.

We'll use the mock consent form [`consent.html`]({{site.baseurl}}/assets/tutorials/consent.html){:target="_blank"}.

{% capture label %}
`consent.html` is only for illustrative purposes and is not a real consent form. You should follow your institution's guidelines for informed consent.
{% endcapture %}
{% include label-note.html label-body=label %}

The consent form has an checkbox that the participant should click to give consent. Make the checkbox an obligatory field by adding the `"obligatory"` class to the HTML `<input>` tag, as in `<input type="checkbox" class="obligatory">`. The `"obligatory"` class comes from the [Ibex `Form` controller](https://github.com/addrummond/ibex/blob/master/docs/manual.md#form){:target="_blank"}.

[Text areas](https://www.w3schools.com/tags/tag_textarea.asp){:target="_blank"}, [text boxes](https://www.w3schools.com/tags/att_input_type_text.asp){:target="_blank"}, and [radio buttons](https://www.w3schools.com/tags/att_input_type_radio.asp){:target="_blank"} can also be made into obligatory fields. For more information on obligatory fields, read the [`Html` element type documentation]({{site.baseurl}}/docs/global-commands/sequence){:target="_blank"}.

Some commands interact with obligatory fields, for example:
+ [`checkboxWarning`]({{site.baseurl}}/docs/html/html-checkboxwarning){:target="_blank"}: Defines (but does not print) an error message for an unfilled obligatory checkbox.
+ [`warn`]({{site.baseurl}}/docs/html/html-warn){:target="_blank"}: Prints a defined error message for every unfilled obligatory field.
+ [`test.complete`]({{site.baseurl}}/docs/html/html-test-complete){:target="_blank"}: Tests whether all obligatory fields have been filled out.

The `test.complete` command is a [test command]({{site.baseurl}}/docs/core-concepts/commands#test-commands){:target="_blank"}. Test commands have the prefix `test.`, and test some aspect of the element they are called on. The `success` and `failure` keywords define a block of commands that are executed upon success or failure of the test, respectively:

```javascript
PennController.ResetPrefix(null)

newTrial("TRIAL_LABEL",
    newX("ELEMENT_1", ...)
      .test.COMMAND_1()
      .success(...)
      .failure(...)
)
```

You can express the negation of a test by replacing the `test.` prefix with `testNot.`, and you can use the keywords `and` and `or` to combine tests. For more information, read the [Test commands documentation]({{site.baseurl}}/docs/core-concepts/commands#test-commands){:target="_blank"}.

Test commands are used in two ways:
+ Within a **Trial** object to define conditional branching; or
+ Within a `wait` command to modify its success condition(s).

We'll pass the test command `test.complete` as an argument to a `wait` command on a **Button** element. 

Normally, if the `wait` command is called on a **Button**, experiment script execution pauses until the `wait` command's success condition is fulfilled, in other words until the participant clicks the button. When a test command is passed as an argument, the `wait` command's success condition is modified. 

The test is run when the participant clicks the button, and experiment script execution is paused until the participant clicks the button *and* the test succeeds. If the participant clicks the button and the test fails, then experiment script execution remains paused. The test is run again the next time the participant clicks the button.

{% capture instructions %}
+ Create a new **Trial** labeled `"consent"`. Modify the `Sequence` global command to include the `"consent"` **Trial**.
+ Create and print an **Html** named `"consent_form"`.
  1. Call the [`cssContainer`]({{site.baseurl}}/docs/standard-element-commands/standard-csscontainer){:target="_blank"} command to set the container width to 720px.
  2. Call the [`checkboxWarning`]({{site.baseurl}}/docs/html/html-checkboxwarning){:target="_blank"} command to define an error message for an unfilled obligatory checkbox.
+ Create and print a centered **Button** named `"continue"`.
  1. Call the [`wait`]({{site.baseurl}}/docs/button/button-wait){:target="_blank"} command on the `"continue"` **Button** and pass the `test.complete` test command on the `"consent_form"` **Html** as an argument. This pauses experiment script execution until the participant clicks the button *and* all obligatory fields are filled out.
  2. Use the `failure` keyword on the [`test.complete`]({{site.baseurl}}/docs/html/html-test-complete){:target="_blank"} command. If the consent checkbox is not filled out when the participant clicks the button, PennController calls the [`warn`]({{site.baseurl}}/docs/html/html-warn){:target="_blank"} command on the `"consent_form"` **Html**, which prints the error message defined by the `checkboxWarning` command.

<pre><code class="language-diff-javascript diff-highlight"> 
*// code omitted in the interest of space
*
*// Control trial sequence
!Sequence("consent", "instructions", randomize("experimental-trial"), "send", "completion_screen")
*
+// Consent form
+newTrial("consent",
+    newHtml("consent_form", "consent.html")
+        .cssContainer({"width":"720px"})
+        .checkboxWarning("You must consent before continuing.")
+        .print()
+    ,
+    newButton("continue", "Click to continue")
+        .center()
+        .print()
+        .wait(getHtml("consent_form").test.complete()
+                  .failure(getHtml("consent_form").warn())
+        )
+)
*
*// Instructions
*// code omitted in the interest of space
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}

### Recording participant IDs

A [**TextInput** element]({{site.baseurl}}/docs/elements/textinput){:target="_blank"} creates a text input box that can collect participant input, like an ID number or experiment feedback. 

We'll ask participants to enter a name or ID number before they start the experiment, and use the `log` method to record the content of the **TextInput** as a new column in the `results` file. 

However, you cannot directly pass the content of a **TextInput** as an argument to the `log` method. Create a [**Var** element]({{site.baseurl}}/docs/elements/var){:target="_blank"}, make it a global variable, and set its value to the content of the **TextInput**. A global variable can be accessed in subsequent **Trial** objects; a non-global variable can only be accessed in the **Trial** that it's created in. Then, you can pass the **Var** as an argument to the `log` method.

{% capture instructions %}
+ Update the instructions.
+ Create and print a [**TextInput**]({{site.baseurl}}/docs/elements/textinput){:target="_blank"} named `"input_ID"` that is centered and has a 1em bottom margin.
+ Create a [**Var**]({{site.baseurl}}/docs/elements/var){:target="_blank"} named `"ID"`.
  + Call the [`global`]({{site.baseurl}}/docs/var/var-global){:target="_blank"} command to make it a global variable.
  + Call the [`set`]({{site.baseurl}}/docs/var/var-set){:target="_blank"} command to set its value to the content of the `"input_ID"` **TextInput**.
+ Use the [`log` method]({{site.baseurl}}/docs/global-commands/newtrial#methods){:target="_blank"} on the `"experimental-item"` **Trial** to record the participant ID.

<pre><code class="language-diff-javascript diff-highlight"> 
*// code omitted in interest of space
*
*// Instructions
*newTrial("instructions",
*    defaultText
+        .cssContainer({"margin-bottom":"1em"})
*        .center()
*        .print()
*    ,
*    newText("instructions-1", "Welcome!")
*    ,
*    newText("instructions-2", "In this experiment, you will hear and read a sentence, and see two images.")
*    ,
*    newText("instructions-3", "&lt;b&gt;Select the image that better matches the sentence:&lt;/b&gt;")
*    ,
*    newText("instructions-4", "Press the &lt;b&gt;F&lt;/b&gt; key to select the image on the left.&lt;br&gt;Press the &lt;b&gt;J&lt;/b&gt; key to select the image on the right.&lt;br&gt;You can also click on an image to select it.")
*    ,
*    newText("instructions-5", "If you do not select an image by the time the audio finishes playing,&lt;br&gt;the experiment will skip to the next sentence.")
+    ,
+    newText("instructions-6", "Please enter your ID and then click the button below to start the experiment.")
+    ,
+    newTextInput("input_ID")
+        .cssContainer({"margin-bottom":"1em"})
+        .center()
+        .print()
*    ,
*    newButton("wait", "Click to start the experiment")
*        .center()
*        .print()
*        .wait()
+    ,
+    newVar("ID")
+        .global()
+        .set(getTextInput("input_ID"))
*)
*
*// Experimental trial
*Template("items.csv", row => 
*    newTrial("experimental-trial",
*    // code omitted in interest of space
*    )
*    .log("group", row.group)
*    .log("item", row.item)
*    .log("condition", row.inflection)
+    .log("ID", getVar("ID"))
*)
*
*// code omitted in interest of space
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions %}