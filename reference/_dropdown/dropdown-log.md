---
title: dropdown.log
command_type: "action"
syntax: .log()
description: "Will add a line to the results file for the current trial reporting what option was selected."
alternates:
  - name: "\"first\""
  - name: "\"all\""
notes: true
---

+ If you pass *"first"* as the argument, it will report the option selected upon first selection, ignoring further selections. If you pass *"all"* as the argument, it will add a line for each single occurrence of a selection. By default (no argument) it will only add a line for the value selected at the end of the trial.

<!--more-->
