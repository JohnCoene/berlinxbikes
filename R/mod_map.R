#' map UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_map_ui <- function(id){
  ns <- NS(id)
  fullPage::pageContainer(
    p("Interactive map showing the", 
      em("bike lane type"), "and", em("bike accidents"), 
      "for the year 2018/19 in Berlin."),
    h3(class = "source footer",
       "Source: Unfallatlas, Statistische Ämter des Bundes und der Länder (github.com/tagesspiegel/Unfallatlas-Berlin-2018)")
  )
}
    
#' map Server Function
#'
#' @noRd 
mod_map_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_map_ui("map_ui_1")
    
## To be copied in the server
# callModule(mod_map_server, "map_ui_1")
