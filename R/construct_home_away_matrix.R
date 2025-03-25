construct_home_away_matrix <- function(d, homeCol = "home", awayCol = "away") {
  n_games <- nrow(d)
  n_teams <- length(unique(unlist(d[, homeCol], d[, awayCol])))
  
  m <- matrix(0, 
              nrow = n_games, 
              ncol = n_teams)
  
  for (g in 1:n_games) {
    m[g, as.numeric(d[g, homeCol])] <-  1
    m[g, as.numeric(d[g, awayCol])] <- -1
  }
  
  return(m)
}
