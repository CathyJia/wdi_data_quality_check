
source('./R/check_changing_rate.R')
# Checklist for national accounts1: Ensure accounting consistency of GDP in current and constant prices
list1_check_gdp_consistency <- function(df,changing_threshold){
  GDP_Series_Code <- as.data.frame(c('NY.GDP.MKTP.CN',
                                     'NY.GDP.MKTP.CD',
                                     'NY.GDP.MKTP.KD',
                                     'NY.GDP.MKTP.KN',
                                     'NY.GDP.MKTP.PP.CD',
                                     'NY.GDP.MKTP.PP.KD',
                                     'NY.GDP.FCST.CN',
                                     'NY.GDP.FCST.CD',
                                     'NY.GDP.FCST.KD',
                                     'NY.GDP.FCST.KN'))
  colnames(GDP_Series_Code) <- 'Series_Code'
  GDP <- filter(df, df$Series_Code %in% GDP_Series_Code$Series_Code)
  
  
  GDP <- GDP %>%
    gather(key = 'year', value = 'data', `YR1950`:`YR2050`)
  
  # Ensure accounting consistency of GDP in current and constant prices
  gdp_consistency_result <- check_changing_rate(GDP, changing_threshold)
  return(gdp_consistency_result)
}


