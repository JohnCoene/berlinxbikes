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
    pageContainer(
      h2("Accidents through time in major German cities"),
      br(),
      fluidRow(
        column(
          6,
          uiOutput(ns("city_select_generated"))
        ),
        column(
          6,
          shinyWidgets::radioGroupButtons(
            inputId = ns("value"),
            label = "Regional Statistic",
            choices = c("per 10,000 inhabitants", "per 10,000 cars", "total"),
            checkIcon = list(
              yes = icon("ok",
                         lib = "glyphicon")
            )
          )
        )
      ),
      echarts4r::echarts4rOutput(ns("trend"), height="50vh"),
      h3(class = "source footer",
         "Source: “Statistische Ämter des Bundes und der Länder” via", code("datenguidepy"))
    )
  )
}
    
#' map Server Function
#'
#' @noRd 
mod_comp_server <- function(input, output, session){
  ns <- session$ns
 
  output$city_select_generated <- renderUI({
    cns <- datenguide %>% 
      #dplyr::arrange(-BEV016) %>%  ## sort by population
      dplyr::arrange(-AI0201) %>%  ## sort by density
      #dplyr::arrange(-AI1301) %>%  ## sort by cars per 1,000 inhabitants
      dplyr::mutate(name = forcats::fct_inorder(name)) %>% 
      dplyr::distinct(name) %>% 
      dplyr::pull(name)
    
    selectizeInput(
      ns("city_select"),
      "Search a city (sorted by population density)",
      choices = cns,
      selected = c("Berlin", "München"),
      multiple = TRUE
    )
  })
  
  output$trend <- echarts4r::renderEcharts4r({
    req(input$city_select)
    
    echarts4r::e_common(
      font_family = "Overpass",
      theme = NULL
    )
    
    # var to color mapping
    my_colors <- tibble::tibble(
      name = c("München", "Berlin", "Stuttgart", "Frankfurt am Main", 
               "Essen", "Düsseldorf", "Köln", "Hamburg", 
               "Dortmund", "Leipzig", "Bremen", "Dresden"),
      color = c("#7F3C8D", "#11A579", "#3969AC", "#F2B701",
                "#E73F74", "#80BA5A", "#E68310", "#008695",
                "#CF1C90", "#F97B72", "#4B4B8F", "#A5AA99")
    )
    
    # requires a city selected
    validate(
      need(length(input$city_select) > 0, message = "Select at least one city")
    )
    
    # filter selected and match with color
    dat <- datenguide %>% 
      #dplyr::arrange(-BEV016) %>%  ## sort by population
      dplyr::arrange(-AI0201) %>%  ## sort by density
      #dplyr::arrange(-AI1301) %>%  ## sort by cars per 1,000 inhabitants
      dplyr::mutate(name = forcats::fct_inorder(name)) %>% 
      dplyr::rename(
        "per 10,000 inhabitants" = "AI1302",
        "per 10,000 cars" = "AI1303",
        "total" = "VER002",
        "Injuries per 10,000 inhabitants" = "AI1305",
        "Deaths per 10,000 inhabitants" = "AI1304"
      ) %>%
      dplyr::mutate(year = as.character(year)) %>% 
      dplyr::arrange(year) %>% 
      dplyr::filter(name %in% input$city_select) %>%
      dplyr::left_join(my_colors, by = "name")
    
    ## plot
    dat %>% 
      dplyr::group_by(name) %>% 
      echarts4r::e_charts(year) %>% 
      echarts4r::e_line_(input$value) %>% 
      echarts4r::e_tooltip(trigger = "axis") %>% 
      echarts4r::e_legend(type = "scroll") %>% 
      e_color(unique(dat$color))
  })
}
    
## To be copied in the UI
# mod_comp_ui("comp_ui_1")
    
## To be copied in the server
# callModule(mod_comp_server, "comp_ui_1")
