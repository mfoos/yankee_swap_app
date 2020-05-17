img_UI <- function(id) {
  ns <- NS(id)
  tagList(
    imageOutput(
      outputId = ns("img"), 
      click = clickOpts(id = ns("img_click"), clip = FALSE),
      #width = 120, 
      height = 300, 
      inline = TRUE
    )
  )
}

img_server <- function(input, output, session, prefix) {
  
  click_status <- reactiveValues(show = FALSE)
  
  observeEvent(input$img_click, {
    #click_status$show <- !click_status$show
    click_status$show <- TRUE
  })
  
  output$img <- renderImage({
    
    gift <- grep(paste0(prefix, "_gift"), dir("www", full.names = TRUE), value = TRUE)
    wrap <- grep(paste0(prefix, "_wrap"), dir("www", full.names = TRUE), value = TRUE)
    
    if (!click_status$show) {
      list(
        src = wrap, 
        width = 400, 
        height = 300, 
        style = "img{object-fit: contain;}",
        contentType = "image/jpg"
      )
    } else {
      list(
        src = gift, 
        width = 400, 
        height = 300, 
        style = "img{object-fit: contain;}",
        contentType = "image/png"
      )
    }
  }, deleteFile = FALSE)
  
  return(click_status)
}


