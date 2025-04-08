library("tidyverse")

races <- list.files(pattern = "*.csv")

read_race <- function(foo) {
  read_csv(foo, 
           col_types = cols(
             .default = col_character()
           )) |>
    filter( !(TIME %in% c("DNF","DNS")) ) |>
    separate_wider_delim(TIME, 
             names = c("t_min", "t_sec"), 
             delim  = ":",
             cols_remove = FALSE) |>
    mutate(race = gsub(".csv", "", foo),
           minutes = as.numeric(t_min) + as.numeric(t_sec) / 60,
           distance = case_when(
             grepl("Cyclone", race) ~ 5,
             grepl("Dirksen", race) ~ 5,
             .default = 6
           ))
}

results <- list()
for (i in 1:length(races)) {
  # print(cat("Reading ", races[i]))
  results[[i]] <- read_race(races[i])
}

bind_rows(results) |>
  write_csv("../2024WomensCC.csv")