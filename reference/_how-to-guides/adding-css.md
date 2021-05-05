---
title: Adding custom CSS
---

Multiple settings commands provide you with basic ways to play with the aesthetics of a given element within a trial’s script. If you want to customize your experiment’s visual rendering though, it is a good idea to consider defining general aesthetics for your experiment.

Each element type comes with its own [CSS Classes](https://www.w3schools.com/Css/){:target="_blank"}, so you can upload a file named PennController.css to your PCIbex Farm project’s folder.

{% capture label %}
[As explained in the original Ibex manual](https://github.com/addrummond/ibex/blob/master/docs/manual.md#css-mangling){:target="_blank"}, 
every CSS class you define in _PennController.css_ will be automatically prefixed with `PennController-`.
{% endcapture %}
{% include label-note.html label-body=label %}

When an element is printed, it adds **four** HTML nodes to the page: 
one node, the container, which embeds three other nodes. 
One embedded node is the element itself, and the two other nodes come before and after the element’s node
(see the standard [`.before`]({{site.baseurl}}/standard-element-commands/standard-before/) and 
[`.after`]({{site.baseurl}}/standard-element-commands/standard-after/) commands). 
Each node receives specific CSS class names.

For example, when you use `newText("dots", "...").print()`, this is what gets added to the page:

<div style="border: solid 1px black; margin: 10px; font-size: 0.8em;">
  .PennController-elementContainer<br />
  .PennController-Text-container<br />
  .PennController-<tt><strong>dots</strong></tt>-container
  <div style="text-align:center; width: 100%;">
    <div style="border: solid 1px black; margin-left: auto; margin-right: 5px; display: inline-block; width: 30%; text-align: left; vertical-align: middle;">
      .PennController-before<br />.PennController-Text-before<br />.PennController-<tt><strong>dots</strong></tt>-before
    </div>
    <div style="border: solid 1px black; margin: 5px; display: inline-block; width: 30%; text-align: left; vertical-align: middle;">
      <div>.PennController-Text<br />.PennController-<tt><strong>dots</strong></tt></div>
      <div style="width: 100%; text-align:center; margin: 0;"><tt>"..."</tt></div>
    </div>
    <div style="border: solid 1px black;  margin-left: 5px; margin-right: auto; display: inline-block; width: 30%; text-align: left; vertical-align: middle;">
      .PennController-after<br />.PennController-Text-after<br />.PennController-<tt><strong>dots</strong></tt>-after
    </div>
  </div>
</div>

If you want to add 10px above and below **each** Text element on the page, 
you can write this in your _PennController.css_ file (remember Ibex’s automatic prefix policy---see note above):

```css
.Text-container {
  margin: 10px auto;
}
```

It is important to understand and keep in mind that elements' nodes are embedded in a container,
along with a before and an after node. Most often, you will want to target the container 
rather than the element's node itself. For example, if you defined a CSS rule `font-size: 2em;`
on a Text element's node, any text added with `.before` or `.after` would remain unaffected,
but they _would be_ affected if you applied that rule to the container instead.

As we said, the rule above targets any Text element. If you need to be more specific, 
you can target element _names_. For example, the following CSS rule will only underline
the Text element named `dots` in your experiment:

```css
.dots {
  text-decoration: underline;
}
```

Another option is to use the command [`.css`]({{site.baseurl}}/standard-element-commands/standard-css/)
directly on an element in your experiment instead of editing _PennController.css_:

```javascript
newText("dots")
    .css("text-decoration","underline")
    .print()
```
