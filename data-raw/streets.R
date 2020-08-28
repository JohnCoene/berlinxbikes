## code to prepare `streets` dataset goes here

streets <- sf::st_read("data-raw/berlin-latest-free.shp/gis_osm_roads_free_1.shp") %>% 
  dplyr::mutate(class = if_else(fclass == "cycleway", "bike", "car"))

usethis::use_data(streets, overwrite = TRUE)
