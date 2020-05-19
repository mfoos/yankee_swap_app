img_UI <- function(id) {
  ns <- NS(id)
  tagList(
    tags$div(style="display: inline-block;",
      imageOutput(
        outputId = ns("img"), 
        click = clickOpts(id = ns("img_click"), clip = FALSE),
        width = 300, 
        height = 225
      ),
      textInput(ns("owner"), "", placeholder = "Claim this gift")
    )
  )
}

img_server <- function(input, output, session, prefix) {
  
  click_status <- reactiveValues(show = FALSE)
  
  observeEvent(input$img_click, {
    click_status$show <- !click_status$show
    #click_status$show <- TRUE
  })
  
  output$img <- renderImage({
    
    gift <- grep(paste0(prefix, "_gift"), dir("www", full.names = TRUE), value = TRUE)
    wrap <- grep(paste0(prefix, "_wrap"), dir("www", full.names = TRUE), value = TRUE)
    
    if (!click_status$show) {
      list(
        src = wrap, 
        width = 300, 
        height = 225, 
        style = "object-fit: contain; margin: 10px;",
        contentType = "image/jpg"
      )
    } else {
      list(
        src = gift, 
        width = 300, 
        height = 225, 
        style = "object-fit: contain; margin: 10px;",
        contentType = "image/png"
      )
    }
  }, deleteFile = FALSE)
  
  return(click_status)
}


