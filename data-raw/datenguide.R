## code to prepare `datenguide` dataset goes here

datenguide <- 
  readRDS("data-raw/datenguidepy_accidents.Rds") %>% 
  #dplyr::filter(stat %in% c("AI1302", "AI1303", "AI1305", "AI1304", "VER001", "VER002")) %>% 
  tidyr::pivot_wider(
    id_cols = c(name, id, year), 
    names_from = stat, 
    values_from = value
  )

years <-
  datenguide %>% 
  tidyr::expand(tidyr::nesting(name), tidyr::full_seq(year, 1))

datenguide <-
  datenguide %>% 
  dplyr::full_join(years, by = c("year" = "tidyr::full_seq(year, 1)", "name" = "name")) %>% 
  dplyr::arrange(-AI0201) %>% 
  dplyr::mutate(name = forcats::fct_inorder(name))

usethis::use_data(datenguide, overwrite = TRUE)
