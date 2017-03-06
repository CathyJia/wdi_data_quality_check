create_missings <- function(df, var, percent_missing) {
  # CHECK function insputs
  assertthat::assert_that(is.data.frame(df))
  assertthat::assert_that(assertthat::noNA(df[[var]]))
  assertthat::assert_that(is.character(var))
  assertthat::assert_that(assertthat::is.number(percent_missing))
  assertthat::assert_that(percent_missing > 0 & percent_missing < 1)

  # Create NAs
  na_length <- round(length(df[[var]]) * percent_missing, 0)
  df[[var]][sample(seq(df[[var]]), size = na_length)] <- NA

  return(df)
}





