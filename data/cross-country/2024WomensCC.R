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
           minutes = as.numeric(t_min) + as.numeric(t_sec) / 60)
}

results <- list()
for (i in 1:length(races)) {
  # print(cat("Reading ", races[i]))
  results[[i]] <- read_race(races[i])
}

bind_rows(results) |>
  write_rds("../2024WomensCC.rds")