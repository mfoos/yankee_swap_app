library(shiny)
library(tidyr)
library(dplyr)
library(ggplot2)
source("img-module.R")

shinyServer(function(input, output, session) {
  
  indices <- list.files(path = "www/", pattern = "^dsci0")
  indices <- unique(gsub("_.+$", "", indices))
  
  results_mods <- reactiveValues()

  lapply(
    X = indices,
    FUN = function(x) {
      results_mods[[paste0("module", x)]] <- callModule(
        module = img_server,
        id = paste0("module", x),
        prefix = x
      )
    }
  )
  
  observe({
    res_mod <- lapply(
      X = reactiveValuesToList(results_mods), 
      FUN = reactiveValuesToList
    )
  })
  
})