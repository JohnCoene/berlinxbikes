#' mod_overview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_overview_ui <- function(id){
  ns <- NS(id)
  fullPage::pageContainer(
    h1(class = "header shadow-light",
       "Which bike lane types are more risky in Berlin?"), 
    br(),
    p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum curabitur vitae nunc sed velit dignissim. Senectus et netus et malesuada fames ac turpis egestas maecenas. Adipiscing tristique risus nec feugiat in fermentum posuere. Risus commodo viverra maecenas accumsan lacus. Sed pulvinar proin gravida hendrerit lectus a. Vitae tempus quam pellentesque nec nam aliquam sem et tortor. Sed enim ut sem viverra aliquet eget. Cum sociis natoque penatibus et magnis dis parturient. Tempor commodo ullamcorper a lacus vestibulum sed arcu. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Volutpat lacus laoreet non curabitur gravida arcu ac. Enim sit amet venenatis urna cursus eget. Fermentum iaculis eu non diam phasellus vestibulum lorem sed. Varius sit amet mattis vulputate enim nulla aliquet porttitor lacus. Eget egestas purus viverra accumsan in nisl nisi scelerisque.",
      br(), br(), 
      "Felis donec et odio pellentesque diam volutpat commodo sed egestas. Egestas tellus rutrum tellus pellentesque eu tincidunt tortor. Tellus elementum sagittis vitae et leo duis. Ut consequat semper viverra nam libero justo laoreet. Commodo odio aenean sed adipiscing diam donec adipiscing. Feugiat in fermentum posuere urna nec tincidunt praesent semper. Maecenas ultricies mi eget mauris pharetra et ultrices. Id faucibus nisl tincidunt eget nullam non nisi est sit. Feugiat in fermentum posuere urna nec. Viverra ipsum nunc aliquet bibendum enim facilisis gravida neque convallis. Nec sagittis aliquam malesuada bibendum arcu vitae elementum curabitur. Suspendisse in est ante in nibh mauris cursus mattis molestie. At quis risus sed vulputate odio. Dolor purus non enim praesent elementum facilisis leo vel fringilla.",
      br(), br(), 
      "Amet mattis vulputate enim nulla aliquet porttitor lacus. Maecenas volutpat blandit aliquam etiam erat. Eu mi bibendum neque egestas congue quisque egestas. Semper quis lectus nulla at volutpat diam ut. Sed odio morbi quis commodo odio. Rhoncus est pellentesque elit ullamcorper. Non nisi est sit amet facilisis magna etiam. In fermentum posuere urna nec tincidunt praesent semper. Nisl pretium fusce id velit. Fames ac turpis egestas sed tempus urna et. A cras semper auctor neque vitae tempus quam pellentesque nec. Facilisis volutpat est velit egestas dui id ornare arcu. Fames ac turpis egestas maecenas pharetra convallis posuere morbi leo."),
    br(), br(), 
    pageButtonDown("Next Section", style = "color:#4a896c;")
  )
}
    
#' mod_overview Server Function
#'
#' @noRd 
mod_overview_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_overview_ui("mod_overview_ui_1")
    
## To be copied in the server
# callModule(mod_overview_server, "mod_overview_ui_1")
 
