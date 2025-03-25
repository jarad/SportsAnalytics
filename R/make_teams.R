#' Make data.frame containing team names as factors
#' 
#' @param d data.frame containing the home and away team names
#' @param homeCol character indicating the name of the home team column
#' @param awayCol character indicating the name of the away team column
#' @return data.frame containing one column `names` with team names as a factor
#'   in alphabetical order
make_teams <- function(d, homeCol = "home", awayCol = "away") {
  data.frame(
    names = c(d[, homeCol], d[, awayCol]) |>
      unique() |>
      sort() |>
      factor()
  ) 
}
