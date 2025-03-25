#' Calculate team strengths
#' 
#' Use the output of a model to calculate team strengths. 
#' 
#' @param coef a numeric vector containing model estimated team strengths
#' @param mean a numeric scalar indicating the desired mean of team strengths
#' @return a numeric vector containing team strengths
calculate_team_strengths <- function(m, mean = 0) {
  stopifnot(class(m) == "lm")
  # Currently assuming a lm fit
  strengths <- coef(m)
  
  if (names(strengths)[1] == '(Intercept)') strengths <- strengths[-1]
  
  if (strengths)
}