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

# Load in results file
results <- read.pcibex("results.csv")

view(results)

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

tidied_results

write_csv(tidied_results, "table1.csv")

tidied_results <- tidied_results %>% 
  mutate(reaction_time = selection_time - canvas_time,
         correct = if_else(condition == selection, 1, 0))

tidied_results %>% 
  group_by(condition) %>% 
  summarize(avg_rt = mean(reaction_time, na.rm = TRUE),
            n = sum(!is.na(reaction_time)))

tidied_results %>% 
  group_by(ID) %>% 
  summarize(accuracy = sum(correct, na.rm = TRUE) / sum(!is.na(correct)),
            answered = sum(!is.na(correct)) / n())
            
            


