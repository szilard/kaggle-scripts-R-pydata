list.of.packages <- c("rvest", "stringr", "jsonlite", "magrittr", "dplyr","readr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)


library(rvest)
library(stringr)
library(jsonlite)
library(magrittr)
library(readr)
library(dplyr)

base_url <- "https://www.kaggle.com/scripts/all/%d?sortBy=votes"
index <- 0
done <- FALSE

script_data <- data.frame()

while (! done) {
  url <- sprintf(base_url, index)
  print(paste("retrieving", url))
  script_data <- rbind(script_data, fromJSON(url, flatten=TRUE))
  index <- index + 15
  
  if (min(script_data$totalVotes) < 1) {
    done <- TRUE
  }  
}

script_data$outputTypes <- NULL
script_data %<>% filter(totalVotes > 0)

write_csv(script_data, "script_metadata.csv")
