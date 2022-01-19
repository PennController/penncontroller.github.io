---
title: FAQs
nav_order: 1
---

# {{ page.title }}

---

## What does `(PennController.)` mean? {#penncontroller-prefix}

By default, all PennController commands begin with the prefix `PennController.` in order to avoid naming conflicts with other JavaScript modules. For example, [`PennController.newTrial`]({{site.baseurl}}/global-commands/newtrial) is a global command that creates a trial. In addition, the `newX()` and `getX()` functions have the prefix `PennController.Elements`.

The global command [`PennController.ResetPrefix(null)`]({{site.baseurl}}/global-commands/resetprefix) removes the `PennController.(Elements.)` prefix for all subsequent calls of a global command and instances of a `newX()` or `getX()` function. You can also pass a string instead of `null`, which resets the prefix to the given string.

## What does `getX()` mean? {#get-x}

`getX()` is a function that refers back to an element that has been created with the corresponding `newX()` command. For example, `getButton("Next")` will refer back to a previously-created element named "Next" (eg. `newButton("Next")`) so you can call commands that will apply to that element.

In the documentation, we sometimes use `getX()` before a command to mean that that command applies to a specific element type, as in `getButton(NAME).click()`, which means that the `click` command is meant to be called on a Button element. Each command can be used directly on `newX()` or on `getX()` for the same `X`.

## Is `X.wait` a standard element command? {#wait-command}

There is no standard `.wait` command in the sense that some element types (like Text elements for example) do not have a `.wait` command defined, and trying to call `getText(NAME).wait()` might cause your experiment to crash. However, the `.wait` command is defined for all interactive element types, as listed below. Note that the specific effect of the `.wait` command will depend on the element type (on a Button element, it will hold the script until a click on the button; on an Audio element, it will hold the script until the audio stops playing).

+ [`audio.wait`]({{site.baseurl}}/audio/audio-wait)
+ [`button.wait`]({{site.baseurl}}/button/button-wait)
+ [`controller.wait`]({{site.baseurl}}/controller/controller-wait)
+ [`dropdown.wait`]({{site.baseurl}}/dropdown/dropdown-wait)
+ [`key.wait`]({{site.baseurl}}/key/key-wait)
+ [`mediarecorder.wait`]({{site.baseurl}}/mediarecorder/mediarecorder-wait)
+ [`scale.wait`]({{site.baseurl}}/scale/scale-wait)
+ [`selector.wait`]({{site.baseurl}}/selector/selector-wait)
+ [`textinput.wait`]({{site.baseurl}}/textinput/textinput-wait)
+ [`tooltip.wait`]({{site.baseurl}}/tooltip/tooltip-wait)
+ [`video.wait`]({{site.baseurl}}/video/video-wait)
+ [`youtube.wait`]({{site.baseurl}}/youtube/youtube-wait)
