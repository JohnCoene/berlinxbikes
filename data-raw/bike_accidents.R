## code to prepare `bike_accidents` dataset goes here

bike_accidents <- readRDS("data-raw/unfallatlas_berlin_bikes_sf.rds")

usethis::use_data(bike_accidents, overwrite = TRUE)
