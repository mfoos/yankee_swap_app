library(shiny)

indices <- list.files(path = "www/", pattern = "^dsci0")
indices <- sample(unique(gsub("_.+$", "", indices)))
