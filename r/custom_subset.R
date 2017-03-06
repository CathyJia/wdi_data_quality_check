
# ATT: the %in% can only works subset the data but the dataset is in alphabetical order, not exactly the order you need. So we need to use slice
# Please make sure the last value of the Series_Code_vector is the sum value
custom_subset <- function(df, Series_Code_vector) {
  df1 <- df %>%
    filter_(~Series_Code %in% Series_Code_vector) %>%
    slice_(~match(Series_Code_vector,Series_Code))
  return(df1) 
}

