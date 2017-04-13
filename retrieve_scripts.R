list.of.packages <- c("rvest", "stringr", "jsonlite", "magrittr", "dplyr","readr", "purrr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)


library(rvest)
library(stringr)
library(jsonlite)
library(magrittr)
library(readr)
library(dplyr)
library(purrr)

base_url <- "https://www.kaggle.com"
script_metadata <- read_csv("script_metadata.csv")

if (!file.exists("scripts")) {
  dir.create("scripts")
}

i <- 1
while (i < nrow(script_metadata)) {
  print(paste("Retrieving", i))
  row <- script_metadata[i,]
  i <- i + 1
  script_url <- row$scriptUrl
  full_url <- paste0(base_url, script_url)
  try({read_html(full_url) %>% 
    html_nodes("code") %>% 
    keep(! is.na(xml_attr(., "class"))) %>%
    html_text() -> code
  
    file_path <- paste0("scripts/", row$id, ".", row$languageName)
    write(code, file_path)})
}