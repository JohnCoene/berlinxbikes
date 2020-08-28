#' map UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import tmap

#world_vars <- setdiff(names(World), c("iso_a3", "name", "sovereignt", "geometry"))

mod_map_ui <- function(id){
  ns <- NS(id)
  fullPage::pageContainer(
    tmapOutput(ns("map")),
    h3(class = "source footer",
       "Source: Unfallatlas, Statistische Ämter des Bundes und der Länder (github.com/tagesspiegel/Unfallatlas-Berlin-2018)")
  )
}
    
#' map Server Function
#'
#' @noRd 
mod_map_server <- function(input, output, session){
  ns <- session$ns
  
  output$map <- renderTmap({
    #tm_shape(World) +
    #  tm_polygons(world_vars[1], zindex = 401)
    tm_shape(districts) +
      tm_polygons(id = "Gemeinde_n", col = "grey92", popup.vars = c("District:" = "Gemeinde_n", "Area:" = "area"))# +
      # tm_shape(traffic_cells) +
      #  tm_polygons(id = "Name", col = "grey92", border.col = "#11a579", popup.vars = c("Traffic cell name:" = "NAME", "Traffic Cell ID:" = "VZ_VBZ_TYP", "LOR Area Code:" = "LOR_PRG")) +
      # tm_shape(streets) +
      #  tm_lines(col = "grey40", lwd = 2.5, palette = "plasma", title.col = "Category:", id = "name", popup.vars = c("Class:" = "fclass")) +
      # tm_shape(bike_lanes) +
      #  tm_lines(col = "agg", lwd = 2.5, palette = "plasma", title.col = "Category:", id = "street", popup.vars = c("Category:" = "agg", "Combination:" = "sub"), contrast = 2) +
      # tm_shape(bike_accidents) +
      #  tm_dots(size = .01, col = "grey80")
    
  })
  
  # output$trend <- echarts4r::renderEcharts4r({
  #   
  #   bike_accidents %>%
  #     sf::st_drop_geometry() %>% 
  #     group_by(XGCSWGS84, YGCSWGS84) %>% 
  #     count() %>% 
  #     e_charts(XGCSWGS84) %>% 
  #     e_geo(
  #       roam = TRUE,
  #       boundingCoords = list(
  #         c(12, 14),
  #         c(52, 54)
  #       ),
  #       center = c(13.3, 52.5),
  #       zoom = 300
  #     ) %>%
  #     e_heatmap(
  #       YGCSWGS84, 
  #       n, 
  #       coord_system = "geo", 
  #       blurSize = 30, 
  #       pointSize = 10,
  #       minOpacity = .4,
  #       maxOpacity = 1
  #     )  %>% 
  #     e_visual_map(n)
  # })
 
}
    
## To be copied in the UI
# mod_map_ui("map_ui_1")
    
## To be copied in the server
# callModule(mod_map_server, "map_ui_1")
