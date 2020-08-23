#' map UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_comp_ui <- function(id){
  ns <- NS(id)
  fullPage::pageContainer(
    p("Overview plots comparing the accidents per 10.000 cars and 100.000 inhabitants for the six largest German cities with regard to population."),
    h3(class = "source footer",
       "Source: “Statistische Ämter des Bundes und der Länder” via", code("datenguidepy"))
  )
}
    
#' map Server Function
#'
#' @noRd 
mod_comp_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_comp_ui("comp_ui_1")
    
## To be copied in the server
# callModule(mod_comp_server, "comp_ui_1")
