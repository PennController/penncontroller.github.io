---
title: Transforming data in R
---

# Starting with a clean slate

You probably tested your experiment at multiple steps along the way, at which your were recording different pieces of information in the results file. Now that you have a final design, press the right side of <b>Results</b> button on the farm interface to load more options, and then press the button to delete all the previous results.

Then take your experiment at least twice, entering different IDs, to generate some results. Press the left sideof the <b>Results</b> button to see new result file.

Save your results file in a folder that you will be able to access from an R script.


# Load your results file in R

Add the function below to your R script so you can read your results file in R as a CSV file, and automatically name the columns using the comments lines:

<!--more-->
```javascript 
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
```

Then all you need to do to read your results file is <!--more-->
```javascript results <- read.pcibex("results")``` (assuming your saved your results file in your R working directory under the name results). 

You can then take a look at the first lines of your table, and their column names, using <!--more--> 
```javascript head(results)``` .

By default, when the R-function above finds more than one column with the same label in the comments of the results file, it suffixes the first column name with .Ibex. Since the native IBEX format already inserts two columns in the results file described as Item and Group, and assuming you used <!--more-->
```javascript .log( "Item" , variable.Item )``` and <!--more-->
```javascript .log( "Group" , variable.Group )``` on your table-generated trials, this behavior ensures that the Ibex-native columns (which appear first) are named Item.Ibex and Group.Ibex while the columns you added using the .log commands are indeed named Item and Group.


# Compare RTs

You can easily take a look at response times using the dplyr package:
<!--more-->
```javascript
require(dplyr)

results %>%
  filter(Ending %in% c("No-s","-s") & (Parameter == "Selection" | Value == "Start")) %>%
  mutate(Accurate = rep(Value[Parameter=="Selection"]==gsub("No-s","two", gsub("-s", "one", Ending[Parameter=="Selection"])), each=2)) %>%
  group_by(Accurate, Ending, Group, ID) %>%
  summarise( RT = mean(EventTime[Parameter=="Selection"] - EventTime[Value=="Start"]) , N = length(Value)/2 )
```

Our filter only keeps rows which report No-s or -s (the welcome-trial rows) and corresponding to an image selection or to the start of a trial.

The function mutate adds a column Accurate indicating whether the Value for the Selection rows matches the condition identifier encoded in Ending.

We then group our rows by Accurate and Ending to get a clear idea of the effect of our manipulation (presence vs absence of -s) and also by Group and ID to get individual observations.

Finally we report the mean differences between the EventTime of the Selection minus the Start rows, along with the number of observations (two rows per trial, Start and Selection, call for a division by 2).
