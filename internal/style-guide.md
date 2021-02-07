---
title: Style guide
nav_order: 4
numbered_headings: true
start_heading: 1
---

<div class="initialize" style="--h1counter-value: {{page.start_heading}};"></div>

# {{ page.title}}

This page provides guidelines for writing PennController documentation.
{: .h1-blurb }

---

## General

This website recommends following the
[Google developer documentation style guide](https://developers.google.com/style/highlights){:target="_blank"}
when writing documentation, in particular its rules for tone and grammar.

### Tone

+ [Be conversational and friendly without being frivolous](https://developers.google.com/style/tone){:target="_blank"}.
+ [Write with reading ease in mind](https://developers.google.com/style/accessibility#reading-ease){:target="_blank"}.
+ [Use descriptive link text](https://developers.google.com/style/link-text){:target="_blank"}.

### Grammar

+ Use [active voice](https://developers.google.com/style/voice){:target="_blank"}
and [present tense](https://developers.google.com/style/tense){:target="_blank"}.
+ [Put conditional clauses before instructions, not after](https://developers.google.com/style/clause-order){:target="_blank"}.
+ [Use second person when giving instructions](https://developers.google.com/style/person){:target="_blank"}.

---

## Markdown syntax conventions

This website uses Markdown. If you're new to Markdown, read this
[Getting Started](https://www.markdownguide.org/getting-started/){:target="_blank"}
overview and
[Basic Syntax](https://www.markdownguide.org/basic-syntax/){:target="_blank"}
guide before continuing.

There is some variation in Markdown syntax; for consistency across this website,
please follow these conventions in your Markdown files.

### Headings

Use pound signs (`#`) to create headings:

{% capture code %}
# Heading level 1 (h1)
## Heading level 2 (h2)
### Heading level 3 (h3)
#### Heading level 4 (h4)
##### Heading level 5 (h5)
###### Heading level 6 (h6)
{% endcapture %}

{% include code-example.html code=code no-output=true %}

### Italic text

Use a single asterisk `*` for italicized text:

{% capture code %}
This sentence has *italicized* text.
{% endcapture %}

{% include code-example.html code=code %}

### Bold text

Use double asterisks `**` for bold text:

{% capture code %}
This sentence has **bold** text.
{% endcapture %}
{% include code-example.html code=code %}

### Ordered list

To create an ordered list, add a number followed by a period in front of each
list item:

{% capture code %}
1. Lorem
2. Ipsum
3. Dolor
{% endcapture %}
{% include code-example.html code=code %}

### Unordered list

To create an unordered list, add a plus sign `+` in front of each list item:

{% capture code %}
+ Lorem
+ Ipsum
+ Dolor
{% endcapture %}
{% include code-example.html code=code %}

---

### Horizontal rule

Create a horizontal rule with three dashes `---`:

{% capture code %}
This is text above a horizontal rule.

---

This is text below a horizontal rule.
{% endcapture %}
{% include code-example.html code=code %}

### Internal links

Internal links should be in the form
{% raw %}`[LINK_TEXT]({{site.baseurl}}/PAGE_PATH)`{% endraw %}.
Do *not* hardcode the website url, as in `[LINK_TEXT](https://doc.pcibex.net/PAGE_PATH)`.

{% capture raw %}
  {% raw %}
  This is a link to the [Core Concepts]({{site.baseurl}}/core-concepts) section.
{% endraw %}
{% endcapture %}

{% capture code %}
  This is a link to the [Core Concepts]({{site.baseurl}}/core-concepts) section.
{% endcapture %}

{% include code-example.html raw=raw code=code %}

A page's page path is likely different from its file path. For example, the
file path for the
[`standard.after`]({{site.baseurl}}/standard-element-commands/standard-after)
command is
[`reference/_standard-element-commands/standard-after.md`](https://github.com/PennController/penncontroller.github.io/blob/master/reference/_standard-element-commands/standard-after.md){:target="_blank"},
but its page path is `/standard-element-commands/standard-after`.

If you are not sure what a page's page path is, open that page and check its URL
in the address bar of your web browser.

### External links

External links should open in a new tab: add `{:target="_blank"}` after the URL.

{% capture code %}
This is a link to the
[`penncontroller.github.io`](https://github.com/PennController/penncontroller.github.io){:target="_blank"}
repository.
{% endcapture %}
{% include code-example.html code=code %}

### Blockquotes

If you want to draw emphasis to a certain section, create a note instead
of using a blockquote:

{% capture raw %}
  {% raw %}
  {% capture label %}
  This is an example note. Notes support Markdown syntax, meaning that you can
  freely *italicize* and **bold** text, and even create lists:

  1. Lorem
  2. Ipsum
  3. Dolor

  + Consectetur
  + Adipsicing
  + Elit
  {% endcapture %}
  {% include label-note.html label-body=label %}
  {% endraw %}
{% endcapture %}

{% capture code %}
  {% capture label %}
  This is an example note. Notes support Markdown syntax, meaning that you can
  freely *italicize* and **bold** text, and even create lists:

  1. Lorem
  2. Ipsum
  3. Dolor

  + Consectetur
  + Adipsicing
  + Elit
  {% endcapture %}
  {% include label-note.html label-body=label %}
{% endcapture %}
{% include code-example.html raw=raw code=code %}

### Inline code

In general, use backticks <code>`</code> for inline code:

{% capture code %}
This is a sentence with `inline code`.
{% endcapture %}
{% include code-example.html code=code %}

If you want to include italicized text in inline code to indicate a placeholder
variable, use <code>&lt;code>&lt;var>PLACEHOLDER_VARIABLE&lt;/var>&lt;/code></code>

{% capture raw %}
  This is a sentence with an &lt;code>inline code &lt;var>variable&lt;/var>&lt;/code>.
{% endcapture %}

{% capture code %}
  This is a sentence with an <code>inline code <var>variable</var><code>.
{% endcapture %}
{% include code-example.html raw=raw code=code %}

---

## Markdown code blocks

The PennController website uses the
[Prism](https://prismjs.com/){:target="_blank"} syntax highlighter to style code
blocks, instead of the default Rouge highlighter. Since PennController is based
on JavaScript, use JavaScript as the language for syntax highlighting.

There are two types of code blocks: without line highlighting, and with
line highlighting.

### Code blocks without line highlighting

If you're creating a code block without line highlighting, create a fenced code
block by surrounding the code with <code>```javascript</code>
and <code>```</code>:

{% capture code %}
```javascript
// This is a comment

PennController.ResetPrefix(null)

newTrial("example-trial",
    newText("hello", "Hello World!")
        .print()
    ,
    newButton("wait", "")
        .wait()
)
```
{% endcapture %}
{% include code-example.html code=code no-output=true %}

### Code blocks with line highlighting

If you're creating a code block with line highlighting, surround the code with
<code>&lt;pre>&lt;code class="language-diff-javascript diff-highlight"></code>
and <code>&lt;/code>&lt;/pre></code>.

Every line in the code block should begin with one of the following symbols:

+ `$`: Purple line highlight; used to place general emphasis on a line.
+ `+`: Green line highlight with a plus sign; used to indicate an added line.
+ `-`: Red line highlight with a minus sign; used to indicate a deleted line.
+ `!`: Yellow line highlight with an exclamation mark; used to indicate a changed
line.
+ `~` Green line highlight; used to indicate correctness.
+ `%`: Red line highlight; used to indicate incorrectness.
+ `@`: Default syntax highlighting.

If the `@` symbol is omitted, that line does not receive any syntax highlighting.
The `@` symbol is not striclty required for empty lines, as there is no code to
be highlighted, but you should include it anyways for consistency.

The start symbol is added in addition to any indenting spaces. For example,
if a line is indented by four spaces, that line should begin with a start symbol
and four spaces, for a total of five characters before the code on that line begins.

{% capture raw %}
&lt;pre>&lt;code class="language-diff-javascript diff-highlight">
$PennController.ResetPrefix(null)
@
+newTrial("example-trial-one",
+    newText("hello", "Hello World!")
-        .print()
-    ,
!    newButton("wait", "")
!        .wait()
$)
@
@// CORRECT: The 'newX()' function is called inside a trial
~newTrial("trial-with-element",
~    newX("element-inside-trial")
~)
@
@// INCORRECT: The 'newX()' function is called outside of a trial
%newX("element-outside-trial")
%newTrial("trial-without-element")
@
@// This is a comment with syntax highlighting
// This is a comment without syntax highlighting
@
@PennController.ResetPrefix("apple")    // Code with syntax highlighting
PennController.ResetPrefix("apple")    // Code without syntax highlighting
&lt;/code>&lt;/pre>
{% endcapture %}

{% capture code %}
<pre><code class="language-diff-javascript diff-highlight">
$PennController.ResetPrefix(null)
@
+newTrial("example-trial-one",
+    newText("hello", "Hello World!")
-        .print()
-    ,
!    newButton("wait", "")
!        .wait()
$)
@
@// CORRECT: The 'newX()' function is called inside a trial
~newTrial("trial-with-element",
~    newX("element-inside-trial")
~)
@
@// INCORRECT: The 'newX()' function is called outside of a trial
%newX("element-outside-trial")
%newTrial("trial-without-element")
@
@// This is a comment with syntax highlighting
// This is a comment without syntax highlighting
@
@PennController.ResetPrefix("apple")    // Code with syntax highlighting
PennController.ResetPrefix("apple")    // Code without syntax highlighting
</code></pre>
{% endcapture %}
{% include code-example.html raw=raw code=code %}

---

## Markdown style rules

The following style suggestions are based on the rules from the Visual Studio
Code extension
[markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint){:target="_blank"}.
For a full list of its rules, see
[Rules](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md){:target="_blank"}.

### Headings

Surround headings with blank lines (one blank line above and one blank line
below the heading)

{% capture code %}
CORRECT:

## Heading 2

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

## Heading 2

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

INCORRECT:

## Heading 2
Lorem ipsum dolor sit amet, consectetur adipiscing elit.

Lorem ipsum dolor sit amet, consectetur adipiscing elit.
## Heading 2
{% endcapture %}
{% include code-example.html code=code no-output=true %}

### Whitespace

+ Use spaces instead of hard tabs for indentation.
+ Avoid trailing spaces at the end of a line.
+ Avoid multiple consecutive blank lines.

### Line length

Wrap lines that are longer than 80 characters long for readability.

However, links are frequently close to over 80 characters, but must be on a
single line in order to be parsed properly. In such cases, place the link
on its own line.

{% capture code %}
CORRECT: The link is on its own line, for a total of three lines.

This is a link to the
[`penncontroller.github.io`](https://github.com/PennController/penncontroller.github.io){:target="_blank"}
repository.

INCORRECT: The link is on the same line, for a total of one line. However, the
example looks like two lines because of word wrapping within the code block.

This is a link to the [`penncontroller.github.io`](https://github.com/PennController/penncontroller.github.io){:target="_blank"} repository.
{% endcapture %}
{% include code-example.html code=code no-output=true %}

---

## YAML tags

+ If the value contains a colon, surround the value with single or double quote to
escape the special colon character:

    ```yaml
    ---
    example: "This sentence contains a colon : and needs quotes"
    ---
    ```
+ If the value contains double quotes, surround the value with single quotes
to escape the double quotes:

    ```yaml
    ---
    example: '"first"'
    ---
    ```
+ *To be filled in*
