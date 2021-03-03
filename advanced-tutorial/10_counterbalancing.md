---
title: 10. Counterbalancing
nav_order: 3
start_heading: 10
---

In this section, we'll shuffle image positions, randomize item order, and control
group assignment.
{: .h1-blurb }

---

## Shuffling image position

Currently, the plural image is always printed on the left and the singular image
is always printed on the right. This might create an confound that could lead to
incorrect conclusions about morphological processing, because it's possible that
participants are simply always faster at choosing images on the left (or on the
right).

We'll address this potential confound by randomly shuffling the image positions.

{% capture instructions %}
1. [Shuffle]({{site.baseurl}}/selector/selector-shuffle) the `"selection"`
Selector.

<pre><code class="language-diff-javascript diff-highlight">
@// code omitted in interest of space
@
@// Experimental trial
*Template("items.csv", row => 
@    newTrial("experimental-trial",
@        newTimer("break", 1000)
@            .start()
@            .wait()
@        ,
@        newAudio("audio", row.audio)
@            .play()
@        ,
@        newTimer("timeout", row.duration)
@            .start()
@        ,
@        newText("sentence", row.sentence)
@            .center()
@            .unfold(row.duration)
@        ,
@        newImage("plural", row.plural_image)
@            .size(200, 200)
@        ,
@        newImage("singular", row.singular_image)
@            .size(200, 200)
@        ,
@        newCanvas("side-by-side", 450,200)
@            .add(  0, 0, getImage("plural"))
@            .add(250, 0, getImage("singular"))
@            .center()
@            .print()
@            .log()
@        ,
@        newSelector("selection")
@            .add(getImage("plural"), getImage("singular"))
+            .shuffle()
@            .keys("F", "J")
@            .log()
@            .callback(getTimer("timeout").stop())
@        ,
@        getTimer("timeout")
@            .wait()
@        ,
@        getAudio("audio")
@            .stop()
@    )
@    .log("group", row.group)
@    .log("item", row.item)
@    .log("condition", row.inflection)
@)
@
@// code omitted in interest of space
</code></pre>

{% capture label %}
Be sure to call the `shuffle` command **before** calling the `keys` command!

This ensures that the `F` key is associated with whichever image is printed on
the left, and that the `J` key is associated with whichever image is printed on
the right.

If you associate keys before shuffling, the image that ends up on the right might
be associated with the `F` key, and the image that ends up on the left might be
association with the `J` key.
{% endcapture %}
{% include label-note.html label-body=label %}

{% endcapture %}
{% include instructions.html text=instructions%}

The `shuffle` command shuffles the image positions for every `"experimental-item"`
trial independently, meaning that within an iteration of the **AdvancedTutorial**
experiment it's still possible for the plural image to be printed on the left
for all four experimental items.

You could also counterbalance by explicitly setting half of the items to display
the plural image on the left, and the other half to display the plural image on
the right. In this experiment, we use the `shuffle` command, but include the
hardcoded counterbalancing for reference:

{% capture content %}

<i>Note: The `singular_image` and `plural_image` columns have been changed to
`left_image` and `right_image`.</i>

| group | item | sentence                                           | inflection | audio                | duration | left_image          | right_image         |
|-------|------|----------------------------------------------------|------------|---------------------|----------|---------------------|---------------------|
| A     | 1    | The fish swim in a tank which is perfectly round   | plural     | 2fishRoundTank.mp3  | 2676     | 1fishSquareTank.png | 2fishRoundTank.png  |
| A     | 2    | The deer runs in a wood which is extremely dense   | singular   | 1deerDenseWood.mp3  | 2650     | 2deerSparseWood.png | 1deerDenseWood.png  |
| A     | 3    | The sheep roam in a pen which is strikingly blue   | plural     | 2sheepBluePen.mp3   | 2598     | 1sheepRedPen.png    | 2sheepBluePen.png   |
| A     | 4    | The moose walks in a park which is visibly new     | singular   | 1mooseNewPark.mp3   | 2546     | 2mooseOldPark.png   | 1mooseNewPark.png   |
| B     | 1    | The fish swims in a tank which is perfectly square | singular   | 1fishSquareTank.mp3 | 2833     | 2fishRoundTank.png  | 1fishSquareTank.png |
| B     | 2    | The deer run in a wood which is extremely sparse   | plural     | 2deerSparseWood.mp3 | 2650     | 1deerDenseWood.png  | 2deerSparseWood.png |
| B     | 3    | The sheep roams in a pen which is strikingly red   | singular   | 1sheepRedPen.mp3    | 2755     | 2sheepBluePen.png   | 1sheepRedPen.png    |
| B     | 4    | The moose walk in a park which is visibly old      | plural     | 2mooseOldPark.mp3   | 2441     | 1mooseNewPark.png   | 2mooseOldPark.png   |

<pre><code class="language-diff-javascript diff-highlight">
@// code omitted in interest of space
@
@// Experimental trial
*Template("items.csv", row =>
@    newTrial("experimental-trial",
@        newTimer("break", 1000)
@            .start()
@            .wait()
@        ,
@        newAudio("audio", row.audio)
@            .play()
@        ,
@        newTimer("timeout", row.duration)
@            .start()
@        ,
@        newText("sentence", row.sentence)
@            .center()
@            .unfold(row.duration)
@        ,
!        newImage("left", row.left_image)
@            .size(200, 200)
@        ,
!        newImage("right", row.right_image)
@            .size(200, 200)
@        ,
@        newCanvas("side-by-side", 450,200)
!            .add(  0, 0, getImage("left"))
!            .add(250, 0, getImage("right"))
@            .center()
@            .print()
@            .log()
@        ,
@        newSelector("selection")
!            .add(getImage("left"), getImage("right"))
@            .keys("F", "J")
@            .log()
@            .callback(getTimer("timeout").stop())
@        ,
@        getTimer("timeout")
@            .wait()
@        ,
@        getAudio("audio")
@            .stop()
@    )
@    .log("group", row.group)
@    .log("item", row.item)
@    .log("condition", row.inflection)
@)
@
@// code omitted in interest of space
</code></pre>
{% endcapture %}
{% include collapsible-block.html content=content summary="Click for more details" inner-border=true %}

---

## Randomizing item order

The global command
[`Sequence`]({{site.baseurl}}/global-commands/sequence) uses type predicates
(predicates for short) and the functions `seq`, `randomize`, `shuffle`, and
`rshuffle` to create shuffle sequences. A shuffle sequence is a way of sequencing
or randomizing an array of items, in this case the PennController trials.
Randomizing experimental item order is one way of controlling for order effects.

For the **AdvancedTutorial** experiment, the important parts to know are that:

+ Predicates can be trial labels.
+ `Sequence(PREDICATE_1, PREDICATE_2, ...)` creates a sequence in which all trials
that match `PREDICATE_1` precede all trials that match `PREDICATE_2`, and so on.
+ `randomize(PREDICATE)` creates a sequence in which all trials that match
`PREDICATE` are randomly ordered.
+ Trials that do not match a `PREDICATE` are not run.

{% capture instructions %}
1. Use the [`Sequence`]({{site.baseurl}}/global-commands/sequence) global command
to run the four `"experimental-trial"` trials in a random order.

<pre><code class="language-diff-javascript diff-highlight">
@// Type code below this line.
@
@// Remove command prefix
@PennController.ResetPrefix(null)
@
@// Turn off debugger
@// DebugOff()
@
+// Control trial sequence
+Sequence("instructions", randomize("experimental-trial"), "send", "completion_screen")
@
@// code omitted in the interest of space
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

---

## Controlling group assignment

PennController uses an internal counter to counterbalance group assignment.
By default, the counter increases by one at the end of an experiment, which
rotates which experimental item group is run.

Other options for controlling group assignment:

+ Use the global command
[`SetCounter`]({{site.baseurl}}/global-commands/setcounter)
to manually control the internal counter.
+ Modify the experiment URL to force assignment to a specific group.

To modify the experiment URL, replace `experiment.html` with `server.py?withsquare=N`,
where `N` is a number from 0 to number-of-groups-minus-one. This method is
useful if you're sending the URL around for data collection but want to control
which group participants end up in.

For example, the **AdvancedTutorial** experiment has two groups:

+ If a participant clicks the default URL
`https://farm.pcibex.net/p/qkybME/experiment.html`, they'll be assigned
to group `A` or `B` depending on the internal counter.
+ If a participant clicks the link
`https://farm.pcibex.net/p/qkybME/server.py?withsquare=0`, they'll be assigned
to group `A`.
+ If a participant clicks the link 
`https://farm.pcibex.net/p/qkybME/server.py?withsquare=1`, they'll be assigned
to group `B`.
