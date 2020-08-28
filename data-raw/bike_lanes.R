## code to prepare `bike_lanes` dataset goes here

bike_lanes <- readRDS("data-raw/radverkehrsanlagen.rds") %>% 
  dplyr::select(street, district, B_PFLICHT, category, type, agg, sub) %>% 
  dplyr::filter(agg != "Unknown") %>% 
  dplyr::mutate(agg = factor(agg, levels = c("Cycle path", "Cycle path on sidewalk", "Cycle lane", "Advisory cycle lane")))

usethis::use_data(bike_lanes, overwrite = TRUE)
