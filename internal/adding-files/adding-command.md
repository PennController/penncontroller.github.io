---
title: Adding a command
---

# {{ page.title}}

---

## Adding an element command

1. Create a new MD (Markdown) file in the appropriate folder.
    + If the command is a standard command, use the
    [`reference/_standard-element-commands/`](https://github.com/PennController/penncontroller.github.io/tree/master/reference/_standard-element-commands){:target="_blank"}
    folder.
    + Otherwise, use the corresponding element folder. For example, if you're creating
    a page for an `Audio` element command, use the
    [`reference/_audio/`](https://github.com/PennController/penncontroller.github.io/tree/master/reference/_audio){:target="_blank"}
    folder.
2. Name the MD file.
    + If the command is a standard command, name the file `standard-<COMMAND_NAME>.md`.
    For example, *`standard-after.md`* and *`standard-test.printed.md`*.
    + If the command is an element-specific command, name the file
    `<ELEMENT_TYPE>-<COMMAND_NAME>.md`. For example, *`audio-disable.md`* and *`audio-test.playing.md`*.
3. Include the `title`, `command_type`, `syntax`, and `description` YAML tags.

    ```yaml
    ---
    title: <ELEMENT_TYPE>.<COMMAND_NAME> or standard.<COMMAND_NAME>
    command_type: "action" or "test"
    syntax: .<COMMAND_NAME>()
    description: Describe the command in present tense.
    ---
    ```

    Example - Part of the [`audio.disable`]({{site.baseurl}}/audio/audio-disable)
    front matter:
    {: .text-delta }

    ```yaml
    ---
    title: audio.disable
    command_type: action
    syntax: .disable()
    description: Disables the audio player interface controls.
    ---
    ```

4. If the command is a standard command, add the `relevant_elements` tag, an array
of PennController elements that are relevant to the command.

    Example - Part of the
    [`standard.disable`]({{site.baseurl}}/standard-element-commands/standard-disable)
    front matter:
    {: .text-delta }

    ```yaml
    ---
    title: standard.disable
    command_type: action
    relevant_elements: [Audio, Button, Controller, DropDown, Key, MediaRecorder, Scale, Selector, TextInput, Timer, Tooltip, Video, Youtube]
    syntax: .disable()
    description: Disables any interactive feature of the element.
    ---
    ```

5. *Optional*: Add any relevant YAML tags, following the recommended
  [YAML tag order](#yaml-tag-order).
    + [`parameters`](#parameters): Obligatory parameters.
    + [`alternates`](#alternates): Command alternates. The term
    “alternate” refers to an optional parameter that must be called by itself.
    + [`notes`](#notes): If true, creates a Notes section from the page excerpt.
    + [`related`](#related): Related commands.
    + [`since`](#since): The PennController version in which the command was
    released.

    Example - The complete front matter for `audio.disable`:
    {: .text-delta }

    ```yaml
    ---
    title: audio.disable
    command_type: action
    syntax: .disable()
    description: Disables the audio player interface controls.
    alternates:
      - name: OPACITY
        type: float from 0.01 to 1
        description: Prints a rectangular layer of specified value onto the audio player interface, where `0.01` is white and `1` is dark grey.
    notes: true
    related:
      - name: standard.disable
        collection: standard-element-commands
    ---
    ```

6. Write an example.
    + Do not include a call to `PennController.ResetPrefix(null)`.
    + Include any elements or commands that are necessary for the command to work
    or display properly.

      For example, the first example for `audio.disable` includes a call to `standard.print`,
      `audio.play`, and `audio.wait` because the effects of `audio.disable` are otherwise
      not visible:

      ```javascript
      newAudio("sentence", "test.mp3")
          .print()
          .disable()
          .play()
          .wait()
      ```

    + [Highlight]({{site.baseurl}}/internal/style-guide#code-blocks-with-line-highlighting)
    the line in which the command is called.

      Example - Code for the first `audio.disable` example:
      {: .text-delta }

      ```md
      <pre><code class="language-diff-javascript diff-highlight">
      @newAudio("sentence", "test.mp3")
      @    .print()
      $    .disable()
      @    .play()
      @    .wait()
      </code></pre>
      ```

    + Include a description and/or explanation of the code example as an
    unordered list item.

      Example - Description for the first `audio.disable` example:
      {: .text-delta }

        ```md
      <pre><code class="language-diff-javascript diff-highlight">
      @newAudio("sentence", "test.mp3")
      @    .print()
      @    .play()
      @    .wait()
      $    .disable()
      </code></pre>

      + Prints a disabled audio player interface and then plays the file
      *`test.mp3`*.
      ```

    + *Optional*: Include additional examples if you think they will
    be helpful.

7. If the command has any alternates, include an example for each alternate.
If there are multiple examples, precede each example with a comment
`// Example N:`.

    Example - The `audio.disable` command has three examples:
    {: .text-delta }

    ```md
    <pre><code class="language-diff-javascript diff-highlight">
    @// Example 1:
    @newAudio("sentence", "test.mp3")
    @    .print()
    $    .disable()
    @    .play()
    @    .wait()
    @
    @// Example 2:
    @newAudio("sentence", "test.mp3")
    @    .print()
    $    .disable(0.01)
    @    .play()
    @    .wait()
    @
    @// Example 3:
    @newAudio("sentence", "test.mp3")
    @    .print()
    @    .wait()
    $    .disable()
    </code></pre>

    + Example 1: Prints a disabled audio player interface and then plays the file
    *`test.mp3`*.
    + Example 2: Prints a disabed audio player interface and then plays the file
    *`test.mp3`*. The disabled audio player is displayed as a solid white rectangle.
    + Example 3: Prints an audio player interface but does not play it; the participant
    must click the play button to start audio playback. After audio playback finishes,
    the audio player interface is disabled.
    ```

---

## Adding a global command

1. Create a new MD file in the
[`reference/_global-commands/`](https://github.com/PennController/penncontroller.github.io/tree/master/reference/_global-commands){:target="_blank"}
folder.
2. Name the MD file `<COMMAND_NAME>.md`, without including the `PennController.`
prefix. For example, *`AddHost.md`* and *`AddTable.md`*.
3. Include the `title`, `syntax`, and `description` YAML tags.

    ```yaml
    ---
    title: <COMMAND_NAME>
    syntax: <COMMAND_NAME>()
    description: Describe the command in present tense.
    ---
    ```

    Example - Part of the [`AddHost`]({{site.baseurl}}/global-commands/addhost)
    front matter:
    {: .text-delta }

    ```yaml
    ---
    title: AddHost
    syntax: AddHost()
    description: Specifies a host URL to use as a source file for when calling creating a new `Audio`, `Image`, or `Video` element. The `URL` argument must end in `"/"`.
    ---
    ```

4. *Optional*: Add any relevant YAML tags, following the recommended
  [YAML tag order](#yaml-tag-order).
    + [`parameters`](#parameters): Obligatory parameters.
    + [`alternates`](#alternates): Command alternates. The term
    “alternate” refers to an optional parameter that must be called by itself.
    + [`methods`](#methods): To be filled in
    + [`notes`](#notes): If true, creates a Notes section from the page excerpt.
    + [`related`](#related): Related commands.
    + [`since`](#since): The PennController version in which the command was
    released.

    Example - The complete front matter for `AddHost`:
    {: .text-delta }

    ```yaml
    ---
    title: AddHost
    syntax: AddHost()
    parameters:
      - name: URL
        type: string
        description: A URL.
    description: Specifies a host URL to use as a source file for when calling creating a new `Audio`, `Image`, or `Video` element. The `URL` argument must end in `"/"`.
    notes: true
    ---
    ```

5. Write an example.
    + Do not include a call to `PennController.ResetPrefix(null)`.
    + Include any elements or commands that are necessary for the command to work
    or display properly.
    + [Highlight]({{site.baseurl}}/internal/style-guide#code-blocks-with-line-highlighting)
    the line in which the command is called.
    + Include a description and/or explanation of the code example as an
    unordered list item.
    + *Optional*: Include additional examples if you think they will
    be helpful.
6. *To be filled in*

---

## Adding a special command

1. Create a new MD file in the
[`reference/special-commands/`](https://github.com/PennController/penncontroller.github.io/tree/master/reference/_special-commands){:target="_blank"}
folder.
2. Name the MD file `<COMMAND_NAME>.md`. For example, *`clear.md`* and *`end.md`*.
3. Include the `title`, `syntax`, and `description` YAML tags.

    ```yaml
    ---
    title: <COMMAND_NAME>
    syntax: <COMMAND_NAME>()
    description: Describe the command in present tense.
    ---
    ```

    Example - The [`clear`]({{site.baseurl}}/special-commands/clear)
    front matter:
    {: .text-delta }

    ```yaml
    ---
    title: clear
    syntax: clear()
    description: Removes from the screen any element that was previously added during the trial.
    ---
    ```

4. *Optional*: Add any relevant YAML tags, following the recommended
  [YAML tag order](#yaml-tag-order).
    + [`notes`](#notes): If true, creates a Notes section from the page excerpt.
    + [`related`](#related): Related commands.
    + [`since`](#since): The PennController version in which the command was
    released.
5. Write an example.
    + Do not include a call to `PennController.ResetPrefix(null)`.
    + Include any elements or commands that are necessary for the command to work
    or display properly.
    + [Highlight]({{site.baseurl}}/internal/style-guide#code-blocks-with-line-highlighting)
    the line in which the command is called.
    + Include a description and/or explanation of the code example as an
    unordered list item.
    + *Optional*: Include additional examples if you think they will
    be helpful.
6. *To be filled in*

---

## Optional YAML tags

### `parameters`

A list of obligatory command parameters.

```yaml
---
parameters:
  - name: <PARAMETER_1>
    type: (optional, can be omitted)
    description: Describe the parameter in present tense. You can use Markdown syntax,
    like backticks (`) for code font.
  - name: <PARAMETER_2>
    type: (optional, can be omitted)
    description: Describe the parameter in present tense.
---
```

Example - The
[`standard.css`]({{site.baseurl}}/standard-element-commands/standard-css)
command has two parameters:
{: .text-delta }

```yaml
---
parameters:
  - name: CSS_PROPERTY
    type: string
    description: To be filled in
  - name: VALUE
    type: string
    description: To be filled in
---
```

### `alternates`

A list of command alternates. The term "alternate" describes an optional
parameter that must be called by itself.

```yaml
---
alternates:
  - name: <ALTERNATE_1>
    type: (optional)
    description: Describe the parameter in present tense. You can use Markdown syntax,
    like backticks (`) for code font.
  - name: <ALTERNATE_2>
    type: (optional)
    description: Describe the parameter in present tense. You can use Markdown syntax,
    like backticks (`) for code font.
---
```

Example - The
[`standard.css`]({{site.baseurl}}/standard-element-commands/standard-css)
command has one alternate:
{: .text-delta }

```yaml
---
alternates: 
  - name: 'PROPERTY_VALUE_ARRAY'
    type: array
    description: 'Apply multiple CSS properties at once by passing an array of property-value pairs in the format `{CSS_PROPERTY_1: VALUE_1, CSS_PROPERTY_2: VALUE_2}`'
---
```

An important distinction between the `parameters` and `alternates` tags is
that alternates must be called by themselves.

For example, the [`audio.wait`]({{site.baseurl}}/audio/audio-wait)
command arguments `"first"` and `TEST_COMMAND` must be called separately: you
can call `.wait("first")` or `.wait(TEST_COMMAND)`, but not
`.wait("first", TEST_COMMAND)`.

Therefore, they are listed under the `alternates` tag, and not the `parameters` tag:

```yaml
---
alternates:
  - name: '"first"'
    description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  - name: TEST_COMMAND
    type: test command
    description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.
---
```

### `methods`

To be filled in.

### `notes`

To create a Notes section, add the `notes: true` tag.

If you create a Notes section, you must include the excerpt seperator
`<!--more-->`. The content in the Notes section is taken from the command page's
[excerpt](https://jekyllrb.com/docs/posts/#post-excerpts){:target="_blank"},
the content that precedes the excerpt seperator. Everything below the excerpt
seperator is included in the Example section.

Example: The [`audio.disable`]({{site.baseurl}}/audio/audio-disable)
command has a notes section:
{: .text-delta }

```md
+ Some browsers display disabled interfaces as a plain gray rectangle.

<!--more-->

<pre><code class="language-diff-javascript diff-highlight">
@// Example 1:
@newAudio("sentence", "test.mp3")
@    .print()
$    .disable()
@    .play()
@    .wait()
@
@// Example 2:
@newAudio("sentence", "test.mp3")
@    .print()
$    .disable(0.01)
@    .play()
@    .wait()
@
@// Example 3:
@newAudio("sentence", "test.mp3")
@    .print()
@    .wait()
$    .disable()
</code></pre>

+ Example 1: Prints a disabled audio player interface and then plays the file
*`test.mp3`*.
+ Example 2: Prints a disabed audio player interface and then plays the file
*`test.mp3`*. The disabled audio player is displayed as a solid white rectangle.
+ Example 3: Prints an audio player interface but does not play it; the participant
must click the play button to start audio playback. After audio playback finishes,
the audio player interface is disabled.
```

### `related`

A list of related commands.

```yaml
---
related:
  - name: <RELATED_COMMAND_1>
    collection: <NAME_OF_COLLECTION_THAT_CONTAINS_RELATED_COMMAND_1>
  - name: <RELATED_COMMAND_NAME_2>
    collection: <NAME_OF_COLLECTION_THAT_CONTAINS_RELATED_COMMAND_2>
---
```

Example
{: .text-delta }

```yaml
---
related:
  - name: standard.before
    collection: standard-element-commands
---
```

### `since`

States the PennController version in which the command was released.

---

## YAML tag order

YAML tags should be in the following order:

```yaml
---
title:
command_type:
relevant_elements:
syntax:
parameters:
  - name:
    type:
    description:
    optional:
description:
alternates:
  - name:
    type:
    description:
methods:
  - syntax:
    description:
notes:
related:
  - name:
    collection:
since:
---
```
