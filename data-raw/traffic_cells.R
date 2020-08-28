## code to prepare `traffic_cells` dataset goes here

traffic_cells <- sf::st_read("data-raw/Verkehrszellen__Berlin/Verkehrszellen__Berlin.shp")

usethis::use_data(traffic_cells, overwrite = TRUE)
