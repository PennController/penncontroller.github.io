---
title: Elements
permalink: /elements/
children_collection: elements
children_code_font: true
nav_order: 6
---

# {{ page.title }}

---

<div class="flex-row-wrap mb-8">
{% for child in site.elements %}
  <div class="centered-25 pb-4">
    <a href="{{ child.url | absolute_url }}" class="overlay-link" target="_blank">
    <div class="overlay">
      <img src="{{ site.baseurl }}/assets/elements/{{ child.thumbnail }}" alt="{{ child.title }}" width="100" height="100" class="image">
      <br>
      <div class="element-title"><code>{{ child.title }}</code> element</div>
    </div></a>
    <div class="element-description">{{ child.description }}</div>
  </div>
{% endfor %}
</div>

{% capture content %}

+ `Audio` element:
["Audio"](https://thenounproject.com/rose-alice-design/collection/speaker/?i=3408350){:target="_blank"}
by Alice Design from the Noun Project
+ `Button` element: Based off
["Button"](https://thenounproject.com/search/?q=button&i=2211253){:target="_blank"}
by Adrien Coquet from the Noun Project
+ **DropDown** element: Based off
["Dropdown"](https://thenounproject.com/andrejs/collection/user-interface-thin/?i=1678861){:target="_blank"}
by Andrejs Kirma from the Noun Project
+ **Eyetracker** element:
["Eye Tracking"](https://thenounproject.com/term/eye-tracking/2610605/){:target="_blank"}
by Sarah Mautsch from the Noun Project
+ **Function** element:
Based off ["javascript"](https://thenounproject.com/search/?q=javascript&i=1637023){:target="_blank"}
by I Putu Kharismayadi from the Noun Project
+ `Key` element:
["Keyboard"](https://thenounproject.com/term/keyboard/689836/){:target="_blank"}
by ✦ Shmidt Sergey ✦ from the Noun Project
+ **MediaRecorder** element:
["Recorder"](https://thenounproject.com/term/recorder/2416739/){:target="_blank"}
by Bagus Kusnandar from the Noun Project
+ **MouseTracker** element:
["Mouse"](https://thenounproject.com/boerma/collection/computer/?i=3573979){:target="_blank"}
by Marcel Boer from the Noun Project
+ **Selector** element:
["mouse click arrow"](https://thenounproject.com/weltenraser/collection/computing/?i=1676719){:target="_blank"}
by Weltenraser from the Noun Project
+ **TextInput** element:
["text input"](https://thenounproject.com/andrejs/collection/user-interface/?i=815651){:target="_blank"}
by Andrejs Kirma from the Noun Project
+ `Timer` element:
["timer"](https://thenounproject.com/juliansyah33/collection/baseball/?i=2735133){:target="_blank"}
by Jejen Juliansyah Nur Agung from the Noun Project
+ **Tooltip** element:
["tooltip"](https://thenounproject.com/search/?q=tooltip&i=3194820){:target="_blank"}
by Adrien Coquet from the Noun Project
+ **Video** element:
["Video"](https://thenounproject.com/vectlabmail/collection/media/?i=2375491){:target="_blank"}
by vectlab from the Noun Project
+ **Youtube** element:
["Video"](https://thenounproject.com/term/video/672008/){:target="_blank"}
by Allen Wang from the Noun Project

{% endcapture %}
{% include collapsible-block.html content=content summary="image attribution" %}
