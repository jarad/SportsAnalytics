library("tidyverse")

races <- list.files(pattern = "*.csv")

read_race <- function(foo) {
  read_csv(foo) |>
    mutate(race = gsub(".csv", "", foo),
           TIME = ms(TIME))
}

results <- list()
for (i in 1:length(races)) {
  results[[i]] <- read_race(races[i])
}

bind_rows(results) |>
  mutate() |>
  write_csv("../2024WomensCC.csv")