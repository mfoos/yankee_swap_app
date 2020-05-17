library(shiny)
source("img-module.R")

shinyUI(fluidPage(
  
  h1("Welcome!"),
  
  tabsetPanel(type = "pills",
    tabPanel("Play",
             fluidRow(
                 tags$div(
                 style = "margin: 10px;",
                 tags$br(),
                 lapply(
                   X = indices,
                   FUN = function(x) {
                     img_UI(id = paste0("module", x))
                   }
                 ))
             )
    ),
    tabPanel("Give"),
    tabPanel("Queue")
  )
  
))