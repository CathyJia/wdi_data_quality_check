source('./R/001_tidy_data.R')

check_changing_rate <- function(df, changing_threshold){
  changing_rate_df <- df %>%
  arrange(Country_Code, Series_Code, year) %>%
  group_by(Series_Code, Country_Code) %>%
  mutate(
    data_lag = lag(data, n = 1L),
    year_lag = lag(year, n =1L)
  ) %>%
  ungroup() %>%
  unite(col = 'years_compared', year, year_lag, sep = '_', remove = FALSE) %>%
  gather(key = 'temp_key', value = 'temp_value', c(data, data_lag)) %>%
  group_by(Series_Code, Country_Code, years_compared) %>%
  arrange(temp_key) %>%
  mutate(
    base_period = ifelse(as.numeric(temp_value[1]) == 0, 0.00001, as.numeric(temp_value[1])) , # Replace zeros by very small value to avoid dividing by zero in changing_rate
    comparing_period = as.numeric(temp_value[2]), 
    changing_rate = ifelse(base_period >0, (comparing_period - base_period)/base_period, -(comparing_period - base_period)/base_period)
  ) %>% 
  arrange(Country_Code, Series_Code, changing_rate)
  # the definition of changing_rate is (comparing_period - base_period)/base_period, while if base_period < 0, we should use
  #-(comparing_period - base_period)/base_period)
  changing_rate_df <- changing_rate_df[,c(1,2,3,8,9,10)]
  outlier <- filter(changing_rate_df, abs(changing_rate) > changing_threshold)
  final_result <- outlier[!duplicated(outlier),]
  return(final_result)
}






