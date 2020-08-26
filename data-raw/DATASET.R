## code to prepare `DATASET` dataset goes here

df_datenguide <- 
  readRDS("data-raw/datenguidepy_accidents.Rds") %>% 
  #dplyr::filter(stat %in% c("AI1302", "AI1303", "AI1305", "AI1304", "VER001", "VER002")) %>% 
  tidyr::pivot_wider(
    id_cols = c(name, id, year), 
    names_from = stat, 
    values_from = value
  )

df_years <-
  df_datenguide %>% 
  tidyr::expand(tidyr::nesting(name), tidyr::full_seq(year, 1))

df_datenguide <-
  df_datenguide %>% 
  dplyr::full_join(df_years, by = c("year" = "tidyr::full_seq(year, 1)", "name" = "name")) %>% 
  dplyr::arrange(-AI0201) %>% 
  dplyr::mutate(name = forcats::fct_inorder(name))

usethis::use_data(df_datenguide, overwrite = TRUE)
