---
title: Adding a command
---

# {{ page.title}}

---

## Adding an element command

To add a new element command reference page, follow these steps:

1. Create a new MD (Markdown) file in the appropriate folder.
    + If the command is a standard command, use the `reference/_standard-element-commands/`
    folder.
    + Otherwise, use the corresponding element folder. For example, if you're creating
    a page for an `Audio` element command, use the `reference/_audio/` folder.
2. Name the MD file:
    + If the command is a standard command, name the file `standard-<COMMAND_NAME>.md`.
    For example, `standard-after.md` and `standard-test.printed.md`
    + If the command is an element-specific command, name the file
    `<ELEMENT_TYPE>-<COMMAND_NAME>.md`. For example, `audio-disable.md` and `audio-test.playing.md`.
3. Include the following YAML tags in the front matter:

    ```yaml
    ---
    title: <ELEMENT_TYPE>.<COMMAND_NAME>
    command_type: "action" or "test"
    syntax: .<COMMAND_NAME>()
    description: Describe the command in present tense.
    ---
    ```

    For example, here's part of the front matter for the
    [`audio.disable`]({{site.baseurl}}/elements/audio/audio-disable){:target="_blank"}
    command:

    ```yaml
    ---
    title: audio.disable
    command_type: action
    syntax: .disable()
    description: Disables the audio player interface controls.
    ---
    ```

    **All element command pages must have the `title`, `command_type`,**
    **`syntax`, and `description` YAML tags.**
4. (*Optional*) Add any relevant YAML tags, following the recommended
  [YAML tag order](#yaml-tag-order)
    + [`parameters`](#parameters)
    + [`alternates`](#alternates)
    + [`notes`](#notes)
    + [`related`](#related)
    + [`since`](#since)
5. Write an example, and... *to be filled in*

---

## Adding a global command

To add a new global command reference page, follow these steps:

1. To
2. be
3. filled
4. in

---

## Adding a special command

To add a new special command reference page, follow these steps:

1. To
2. be
3. filled
4. in

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

For example, the
[`standard.css`]({{site.baseurl}}/commands/standard-element-commands/standard-css){:target="_blank"}
command has two parameters, `CSS_PROPERTY` and `VALUE`:

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

The
[`standard.css`]({{site.baseurl}}/commands/standard-element-commands/standard-css){:target="_blank"}
command has two obligatory parameters, and one optional alternate, `PROPERTY_VALUE_ARRAY`.

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

For example, the [`audio.wait`]({{site.baseurl}}/elements/audio/audio-wait){:target="_blank"}
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

### `notes`

By default, command pages do not have a <span class="text-delta">notes</span> section.

To create a Notes section, add the following tag:

```yaml
---
notes: true
---
```

The content in the Notes section is taken from the command page's
[excerpt](https://jekyllrb.com/docs/posts/#post-excerpts){:target="_blank"},
the content that precedes the `<!--more-->` excerpt seperator.

If you create a Notes section...*to be filled in*

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

For example, the
[`standard.after`]({{site.baseurl}}/commands/standard-element-commands/standard-after){:target="_blank"}
command is related to the
[`standard.before`]({{site.baseurl}}/commands/standard-element-commands/standard-before){:target="_blank"}
command:

```yaml
---
related:
  - name: standard.before
    collection: standard-element-commands
---
```

### `since`

States the PennController version in which the command was released...*to be filled in*

---

## YAML tag order

YAML tags should be in the following order:

```yaml
---
title:
command_type:
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
notes:
related:
  - name:
    collection:
since:
---
```
