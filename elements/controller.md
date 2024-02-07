---
title: Controller
since: PennController 1.7
parent: Elements
children_collection: controller
thumbnail: controller.png
parameters:
  - name: CONTROLLER
    type: string
    description: The inserted Ibex controller.
  - name: KEY_VALUE_PAIRS
    type: array
    description: An array of key-value pairs; see each individual Ibex controller for details.
description: Embeds an Ibex controller.
notes: true
---

The currently supported Ibex controllers are:

+ [AcceptabilityJudgment](https://github.com/addrummond/ibex/blob/master/docs/manual.md#acceptabilityjudgment){:target="_blank"}:
makes it straightforward to present a sentence together with a rating scale; it is a combination of the FlashSentence and Message controllers - press above to see more information
+ [DashedAcceptabilityJudgment](https://github.com/addrummond/ibex/blob/master/docs/manual.md#dashedacceptabilityjudgment){:target="_blank"}:
like AcceptabilityJudgment, but it uses DashedSentence instead of FlashSentence; this is useful for running speeded acceptability judgment tasks (which otherwise require some rather creative use of shuffle sequences) - press above to see more information
+ [DashedSentence](https://github.com/addrummond/ibex/blob/master/docs/manual.md#dashedsentence){:target="_blank"}:
sentence is displayed as a sequence of dashes - press above to see more information
+ [FlashSentence](https://github.com/addrummond/ibex/blob/master/docs/manual.md#flashsentence){:target="_blank"}:
sentence is displayed for a certain defined period - press above to see more information
+ [Form](https://github.com/addrummond/ibex/blob/master/docs/manual.md#form){:target="_blank"}
collects data from an HTML form presented to the participant - press above to see more information
+ [Message](https://github.com/addrummond/ibex/blob/master/docs/manual.md#message){:target="_blank"}:
message is displayed to user, and it is usually calling for the action - press above to see more information
+ [Question](https://github.com/addrummond/ibex/blob/master/docs/manual.md#question){:target="_blank"}:
question is displayed to user, and it is usually calling for the action - press above to see more information
+ [Separator](https://github.com/addrummond/ibex/blob/master/docs/manual.md#separator)"{:target="_blank"}:
controls if the previous item was completed - press above to see more infomration
+ [VBox](https://github.com/addrummond/ibex/blob/master/docs/manual.md#vbox){:target="_blank"}:
makes it possible to combine multiple controllers to form a single controller - press above to see more information

<!--more-->

<pre><code class="language-diff-javascript diff-highlight try-">
$newController("DashedSentence", {s: "This is an example sentence."} )
@   .print()
@   .log()
@   .wait()
@   .remove()
</code></pre>

