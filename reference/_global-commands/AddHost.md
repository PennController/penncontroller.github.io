---
<<<<<<< HEAD
layout: command
title: PennController.AddHost
parent: Global commands
grand_parent: Commands
syntax: PennController.AddHost("*URL*")
blurb: Specifies a host URL to use as a source file for when calling `newAudio`, `newVideo`, or `newImage`. URL must end with `"/"`.
extended_description: true
---

You can pass multiple URLs (separated by comma) or use `PennController.AddHost` multiple times. PennController looks for audio/images at the specified host URLs in the order that they were provided, and stops looking as soon as an appropriate audio/image file is found.

You can still directly specify URLs when creating a new element even if you specified a host URL with  `PennController.AddHost`.

---

## Example

```javascript
PennController.ResetPrefix(null);

AddHost("https://files.lab.florianschwarz.net/test/");
AddHost("http://spellout.net/ibexfarm/static/images/");
=======
title: AddHost
syntax: AddHost("*URL*")
description: Specifies a host URL to use as a source file for when calling creating a new `Audio`, `Image`, or **Video** element. The `"URL"` argument must end in `"/"`.
notes: true
---

+ You can pass multiple URLs (separated by commas) to the `AddHost` command, or call `AddHost` multiple times. PennController looks for multimedia files at the specified host URLs in the order that they were provided, and stops looking as soon as an appropriate file is found.
+ You can still directly pass a multimedia file URL when creating a new element, even if a host URL has already been specified by `AddHost`.

<!--more-->

```javascript
PennController.ResetPrefix(null)

AddHost("https://files.lab.florianschwarz.net/test/")
AddHost("http://spellout.net/ibexfarm/static/images/")
>>>>>>> pcibex/master

newTrial(
    newImage("ibex", "ibex.jpg")
        .print()
    ,
    newImage("wait", "https://openclipart.org/image/300px/svg_to_png/23920/Anonymous-Sandglass.png")
        .print()
    ,
    newAudio("sentence", "test.mp3")
        .play()
        .wait()
<<<<<<< HEAD
);
```
> 1. Prints two images and plays one audio file. 
>
> + When loading the `"ibex"` **Image** element, PennController sends a request for the file `https://files.lab.florianschwarz.net/test/ibex.png`. 
>    + If no such file is found, it sends a request for the file `http://spellout.net/ibexfarm/static/images/ibex.png`.
> + When loading the `"wait"` **image** element, PennController sends a request for the file `https://openclipart.org/image/300px/svg_to_png/23920/Anonymous-Sandglass.png`.
> + When loading the `"sentence"` **Audio** element, PennController sends a request for the file `https://files.lab.florianschwarz.net/test/test.mp3`. 
>    + If no such file is found, it sends a request for the file `http://spellout.net/ibexfarm/static/images/test.mp3`.
=======
)
```
Prints two images and plays one audio file. 
+ When loading the `"ibex"` `Image` element, PennController sends a request for the file `https://files.lab.florianschwarz.net/test/ibex.png`. 

    If no such file is found, it sends a request for the file `http://spellout.net/ibexfarm/static/images/ibex.png`.
+ When loading the `"wait"` `image` element, PennController sends a request for the file `https://openclipart.org/image/300px/svg_to_png/23920/Anonymous-Sandglass.png`.
+ When loading the `"sentence"` `Audio` element, PennController sends a request for the file `https://files.lab.florianschwarz.net/test/test.mp3`. 
    
    If no such file is found, it sends a request for the file `http://spellout.net/ibexfarm/static/images/test.mp3`.
>>>>>>> pcibex/master
