#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import fullPage
#' @import echarts4r
#' @noRd
app_ui <- function(request) {

  options <- list(easing = "linear", scrollingSpeed = 400, keyboardScrolling = TRUE)

  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    fullPage::pagePiling(
      #sections.color = c('#ebebeb', '#d7d7d7', '#ebebeb', '#d7d7d7', '#ebebeb', '#3f4844'),
      #sections.color = c('#ebebeb', '#f2f2f2', '#f2f2f2', '#ebebeb', '#ebebeb', '#3d3d3c'),
      sections.color = c('#ebebeb', '#f1f1f1', '#f1f1f1', '#dddddd', '#dddddd', '#3d3d3c'),
      opts = options,
      menu = c(
        "Start" = "home",
        "Introduction" ="intro",
        "Comparison by City" = "comparison",
        "Local Analysis" = "overview",
        "Map" = "map",
        "About" = "about"
      ),
      fullPage::pageSectionImage(
        center = TRUE,
        img = "www/Movement_BerlinByBike.png",
        menu = "home",        #h1("Moving Through Berlin By Bike", class = "title top shadow-dark"),
        h1("Moving Through Berlin By Bike", class = "title top shadow-dark"),
        h2(typed::typedOutput("subtitle"), class = "subtitle shadow-light"),
        h3(typed::typedOutput("caption"), class = "caption footer")
      ),
      fullPage::pageSection(
        center = TRUE,
        menu = "intro",
        mod_intro_ui("intro")
      ),
      fullPage::pageSection(
        center = TRUE,
        menu = "comparison",
        mod_comp_ui("comparison")
      ),
      fullPage::pageSection(
        center = TRUE,
        menu = "overview",
        mod_overview_ui("overview")
      ),
      fullPage::pageSection(
        center = TRUE,
        menu = "map",
        mod_map_ui("map")
      ),
      fullPage::pageSection(
        center = TRUE,
        menu = "about",
        mod_about_ui("about")
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "www/css/custom.css"),
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'berlinxbikes'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
