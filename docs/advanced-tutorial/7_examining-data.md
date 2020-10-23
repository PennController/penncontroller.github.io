---
layout: default
title: Examining data
parent: Advanced Tutorial
---

## {{ page.title }}

We'll run the experiment to collect data that we can examine.

{% capture instructions %}
+ Uncomment the `DebugOff` command, since we are now ready to collect data:
+ Delete any files that already exist in the experiment project page's **Results** folder.
+ Run the experiment at least twice.
+ Save the `results` file as a CSV file named `results.csv`.

<pre><code class="language-diff-javascript diff-highlight"> 
*// This is the AdvancedTutorial experiment.
*// Type code below this line.
*
*// Remove command prefix
*PennController.ResetPrefix(null)
*
*// Turn off debugger
!DebugOff()
*
*// Control trial sequence
*Sequence("consent", "instructions", randomize("experimental-trial"), "completion_screen")
*
*// Instructions
*// code omitted in the interest of space
</code></pre>
{% endcapture %}
{% include instructions.html text=instructions%}

### Reading in results

{% capture label %}
This section assumes prior knowledge of R.
{% endcapture %}
{% include label-note.html label-body=label %}

We'll use this sample results file, [`results.csv`]({{site.baseurl}}/assets/tutorials/results.csv){:target="_blank"}.

{% capture instructions %}
+ Add one of the following code blocks to your R script to: 
  1. Create a [user-defined function](https://r4ds.had.co.nz/functions.html){:target="_blank"} that reads in a PennController results file in CSV format.
  2. Read in `results.csv` and save it as a data frame named `results`.
+ Make sure that your R script and `results.csv` are in the same folder.

{% capture content %}
```r
# Set working directory to source file location

# User-defined function to read in PCIbex Farm results files
read.pcibex <- function(filepath, auto.colnames=TRUE, fun.col=function(col,cols){cols[cols==col]<-paste(col,"Ibex",sep=".");return(cols)}) {
  n.cols <- max(count.fields(filepath,sep=",",quote=NULL),na.rm=TRUE)
  if (auto.colnames){
    cols <- c()
    con <- file(filepath, "r")
    while ( TRUE ) {
      line <- readLines(con, n = 1, warn=FALSE)
      if ( length(line) == 0) {
        break
      }
      m <- regmatches(line,regexec("^# (\\d+)\\. (.+)\\.$",line))[[1]]
      if (length(m) == 3) {
        index <- as.numeric(m[2])
        value <- m[3]
        if (index < length(cols)){
          cols <- c()
        }
        if (is.function(fun.col)){
         cols <- fun.col(value,cols)
        }
        cols[index] <- value
        if (index == n.cols){
          break
        }
      }
    }
    close(con)
    return(read.csv(filepath, comment.char="#", header=FALSE, col.names=cols))
  }
  else{
    return(read.csv(filepath, comment.char="#", header=FALSE, col.names=seq(1:n.cols)))
  }
}

# Read in results file
results <- read.pcibex("results.csv")
```
{% endcapture %}
{% include collapsible-block.html content=content summary="Click for base R version" outer-border=true %}

{% capture content %}
```r
# Set working directory to source file location

# Load tidyverse package
library (tidyverse)

# User-defined function to read in PCIbex Farm results files
read.pcibex <- function(filepath, auto.colnames=TRUE, fun.col=function(col,cols){cols[cols==col]<-paste(col,"Ibex",sep=".");return(cols)}) {
  n.cols <- max(count.fields(filepath,sep=",",quote=NULL),na.rm=TRUE)
  if (auto.colnames){
    cols <- c()
    con <- file(filepath, "r")
    while ( TRUE ) {
      line <- readLines(con, n = 1, warn=FALSE)
      if ( length(line) == 0) {
        break
      }
      m <- regmatches(line,regexec("^# (\\d+)\\. (.+)\\.$",line))[[1]]
      if (length(m) == 3) {
        index <- as.numeric(m[2])
        value <- m[3]
        if (index < length(cols)){
          cols <- c()
        }
        if (is.function(fun.col)){
          cols <- fun.col(value,cols)
        }
        cols[index] <- value
        if (index == n.cols){
          break
        }
      }
    }
    close(con)
    return(read_csv(filepath, comment="#", col_names=cols))
  }
  else{
    return(read_csv(filepath, comment="#", col_names=seq(1:n.cols)))
  }
}

# Read in results file
results <- read.pcibex("results.csv")
```
{% endcapture %}
{% include collapsible-block.html content=content summary="Click for tidyverse version" outer-border=true %}

{% endcapture %}
{% include instructions.html text=instructions %}

If you're using the [tidyverse](https://www.tidyverse.org/){:target="_blank"}, you may see an error message like the following when you create the `results` tibble:

<pre><code class="language-none" style="white-space:pre;">
Warning: 8 parsing failures.
row col   expected     actual          file
  1  -- 17 columns 13 columns 'results.csv'
  2  -- 17 columns 13 columns 'results.csv'
  3  -- 17 columns 13 columns 'results.csv'
  4  -- 17 columns 13 columns 'results.csv'
 21  -- 17 columns 13 columns 'results.csv'
... ... .......... .......... .............
See problems(...) for more details.
</code></pre>

Don't worry! You can ignore this message. The [`readr::read_csv()`](https://readr.tidyverse.org/reference/read_delim.html){:target="_blank"} function throws a warning because some rows have different number of columns:
+ The rows that log the `"consent"` and `"instructions"` **Trial** objects have the default 13 columns.
+ The rows that log the `"experimental-trial"` **Trial** objects have the default 13 columns plus 4 columns added by the `log` method (`group`, `item`, `condition` and `ID`).

If you're using base R, the pre-installed [`utils::read.csv()`](https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/read.table){:target="_blank"} function won't throw such a warning.

### Tidying and analyzing data (optional) {#tidying-data}

{% capture label %}
This section uses the tidyverse to transform and analyze data (prior knowledge of the tidyverse assumed). The code blocks in this section are suggestions that can be modified as desired.

If you're using base R, you can skip ahead to [Wrapping up](#wrapping-up).
{% endcapture %}
{% include label-note.html label-body=label %}

Tidyverse functions are designed to work with [tidy data](https://r4ds.had.co.nz/tidy-data.html#tidy-data-1){:target="_blank"}, meaning that:
+ Each variable must have its own column.
+ Each observation must have its own row.
+ Each value must have its own cell.

The `results` tibble is not tidy, because every `"experimental-trial"` **Trial** is split into 4 rows:
1. Trial start
2. Information logged from the `"side-by-side"` **Canvas**
3. Information logged from the `"selection"` **Selector**
4. Trial end

Tidy the `results` tibble:

{% capture content %}
Add the following code block to your R script:
  1. Keep only rows that log information about the `"side-by-side"` **Canvas** or `"selection"` **Selector**.
  2. Keep only the `ID`, `group`, `item`, `condition`, `PennElementName`, `Value`, and `EventTime` columns.
  3. Group by the `ID` and `item` variables.
  4. Create the `event` and `selection` columns, and coerce the `EventTime` column from a character vector to a double vector.
  5. Drop the `PennElementName` and `Value` columns (necessary for `pivot_wider()`).
  6. "Widen" the tibble. For a more in-depth explanation, see [Transforming data in R]({{site.baseurl}}/docs/how-to-guides/data-transformation){:target="_blank"}.
  7. Save the tidied data as a new tibble named `tidied_results`.

```r
tidied_results <- results %>% 
  filter(PennElementName == "side-by-side" | PennElementName == "selection") %>% 
  select(ID, group, item, condition, PennElementName, Value, EventTime) %>% 
  group_by(ID, item) %>% 
  mutate(event = case_when(PennElementName == "side-by-side" ~ "canvas_time",
                           PennElementName == "selection" ~ "selection_time"),
         selection = case_when("singular" %in% Value ~ "singular",
                               "plural" %in% Value ~ "plural",
                               FALSE ~ NA_character_),
         EventTime = if_else(EventTime == "Never", NA_real_, suppressWarnings(as.numeric(EventTime)))) %>% 
  ungroup() %>% 
  select(-PennElementName, -Value) %>% 
  pivot_wider(names_from = event, values_from = EventTime)
```
*Note: You may need to scroll to the right to see all the columns.*

| ID         | group | item | condition | selection | canvas_time   | selection_time |
|------------|-------|------|-----------|-----------|---------------|----------------|
| SOME_ID    | B     | 4    | plural    | plural    | 1603397451156 | 1603397453036  |
| SOME_ID    | B     | 2    | plural    | NA        | 1603397454060 | NA             |
| SOME_ID    | B     | 3    | singular  | singular  | 1603397457722 | 1603397459321  |
| SOME_ID    | B     | 1    | singular  | singular  | 1603397460332 | 1603397461856  |
| ANOTHER_ID | B     | 1    | singular  | singular  | 1603398704462 | 1603398706007  |
| ANOTHER_ID | B     | 4    | plural    | plural    | 1603398707019 | 1603398708549  |
| ANOTHER_ID | B     | 3    | singular  | plural    | 1603398709562 | 1603398711692  |
| ANOTHER_ID | B     | 2    | plural    | plural    | 1603398712705 | 1603398714189  |

{% endcapture %}
{% include collapsible-block.html content=content summary="Click for more details" inner-border=true %}

You can analyze the tidied data in a variety of ways, for example:

1. Calculate reaction times and response accuracy.
2. Calculate average reaction time by condition.
3. Calculate average response accuracy by participant.

{% capture content %}

1. Calculate reaction times and response accuracy: 
    + Create the `reaction_time` column by subtracting the `trial_start` value from the `canvas_time` value. The resulting value is how long it took a participant to select an image once the images were printed to the screen.
    + Create the `correct` column by comparing the `condition` and `selection` columns. The resulting value is `1` if the particpant selected the correct image, and `0` if the participant selected the wrong image.

    ```r
    tidied_results <- tidied_results %>% 
      mutate(reaction_time = selection_time - canvas_time,
            correct = if_else(condition == selection, 1, 0))
    ```

    Result: 

    *Note: You may need to scroll to the right to see all the columns.*

    | ID         | group | item | condition | selection | canvas_time   | selection_time | reaction_time | correct |
    |------------|-------|------|-----------|-----------|---------------|----------------|---------------|---------|
    | SOME_ID    | B     | 4    | plural    | plural    | 1603397451156 | 1603397453036  | 1880          | 1       |
    | SOME_ID    | B     | 2    | plural    | NA        | 1603397454060 | NA             | NA            | NA      |
    | SOME_ID    | B     | 3    | singular  | singular  | 1603397457722 | 1603397459321  | 1599          | 1       |
    | SOME_ID    | B     | 1    | singular  | singular  | 1603397460332 | 1603397461856  | 1524          | 1       |
    | ANOTHER_ID | B     | 1    | singular  | singular  | 1603398704462 | 1603398706007  | 1545          | 1       |
    | ANOTHER_ID | B     | 4    | plural    | plural    | 1603398707019 | 1603398708549  | 1530          | 1       |
    | ANOTHER_ID | B     | 3    | singular  | plural    | 1603398709562 | 1603398711692  | 2130          | 0       |
    | ANOTHER_ID | B     | 2    | plural    | plural    | 1603398712705 | 1603398714189  | 1484          | 1       |

    <hr>

2. Calculate the average reaction time by condition: 

    ```r
    tidied_results %>% 
      group_by(condition) %>% 
      summarize(avg_rt = mean(reaction_time, na.rm = TRUE),
                n = sum(!is.na(reaction_time)))
    ```

    Result: 

    | condition | avg_rt | n |
    |-----------|--------|---|
    | plural    | 1631.  | 3 |
    | singular  | 1700.  | 4 |

    + `n` is the number of items with a reaction time for a given condition, meaning that 1 item in the `plural` condition did not have a response.

    <hr>

3. Calculate average response accuracy by participant:

    ```r
    tidied_results %>% 
      group_by(ID) %>% 
      summarize(accuracy = sum(correct, na.rm = TRUE) / sum(!is.na(correct)),
                answered = sum(!is.na(correct)) / n())

    ```

    Result: 

    | ID         | accuracy | answered |
    |------------|----------|----------|
    | ANOTHER_ID | 0.75     | 1        |
    | SOME_ID    | 1        | 0.75     |

    + The `ANOTHER_ID` participant had 75% accuracy and 100% completeness, meaning that they responded correctly to 3 out of 4 items.
    + The `SOME_ID` participant had 100% accuracy and 75% completeness, meaning that they responded correctly to 3 out of 3 items, and did not respond to 1 item.

{% endcapture %}
{% include collapsible-block.html content=content summary="Click for more details" inner-border=true %}
