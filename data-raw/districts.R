## code to prepare `districts` dataset goes here

districts <- sf::st_read("data-raw/Bezirke__Berlin/Bezirke__Berlin.shp") %>% 
  dplyr::mutate(area = glue::glue("{format(Shape__Are / 10^6, digits = 3)} km\u00B2"))

usethis::use_data(districts, overwrite = TRUE)
