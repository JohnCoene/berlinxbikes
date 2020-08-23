#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import fullPage
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  output$subtitle <- typed::renderTyped({
    typed::typed(c(" ^500Analysing Bike Lane Quality and<br>Bike Accidents in Berlin "), typeSpeed = 20)
  })
  
  output$caption <- typed::renderTyped({
    #typed::typed(c("Freedom of Fake news^1000", "Freedom of Press Index^500<br>A Visualisation"), typeSpeed = 25, smartBackspace = TRUE)
    typed::typed(c("^3500A contribution to the CorrelAid X Challenge 2020"), typeSpeed = 20)
  })
  
  callModule(mod_intro_server, "intro")
  callModule(mod_comp_server, "comparison")
  callModule(mod_overview_server, "overview")
  callModule(mod_map_server, "map")
  callModule(mod_about_server, "about")
}
