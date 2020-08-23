#' mod_overview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_intro_ui <- function(id){
  ns <- NS(id)
  fullPage::pageContainer(
    h1(class = "header shadow-light",
       "How do traffic accidents in Berlin compare to other big cities in Germany?"),    
    br(),
    p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tristique senectus et netus et malesuada fames ac. Urna porttitor rhoncus dolor purus. Mi in nulla posuere sollicitudin. Tempor nec feugiat nisl pretium fusce id. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus. Purus in massa tempor nec feugiat. Tellus integer feugiat scelerisque varius morbi enim nunc. Lobortis elementum nibh tellus molestie nunc non blandit massa. Sit amet mauris commodo quis imperdiet. Pellentesque habitant morbi tristique senectus. Pellentesque dignissim enim sit amet venenatis urna cursus eget. Nibh nisl condimentum id venenatis a condimentum vitae. Maecenas ultricies mi eget mauris pharetra et. Nec nam aliquam sem et tortor consequat. Elit ut aliquam purus sit amet luctus venenatis lectus magna. Ipsum nunc aliquet bibendum enim facilisis gravida neque convallis. Eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus.", 
      br(), br(), 
      "Ut pharetra sit amet aliquam. Amet consectetur adipiscing elit ut. Urna condimentum mattis pellentesque id nibh tortor id aliquet. Leo urna molestie at elementum eu facilisis sed odio morbi. Amet purus gravida quis blandit turpis cursus in. Nunc id cursus metus aliquam eleifend mi. Sed vulputate mi sit amet mauris commodo quis imperdiet massa. Nisi quis eleifend quam adipiscing vitae proin sagittis nisl. Quisque sagittis purus sit amet volutpat consequat mauris nunc congue. In metus vulputate eu scelerisque felis. Sit amet purus gravida quis blandit. Interdum velit laoreet id donec ultrices tincidunt arcu non. Nulla facilisi cras fermentum odio eu feugiat. Sed turpis tincidunt id aliquet risus feugiat. Odio euismod lacinia at quis. Lectus arcu bibendum at varius vel pharetra. Nibh nisl condimentum id venenatis a condimentum vitae sapien. Quam nulla porttitor massa id neque aliquam vestibulum morbi blandit. Dignissim diam quis enim lobortis scelerisque. Pretium aenean pharetra magna ac placerat vestibulum lectus."),
    br(), br(), 
    pageButtonDown("Next Section", style = "color:#4a896c;")
  )
}
    
#' mod_overview Server Function
#'
#' @noRd 
mod_intro_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_intro_ui("mod_intro_ui_1")
    
## To be copied in the server
# callModule(mod_intro_server, "mod_intro_ui_1")
 
