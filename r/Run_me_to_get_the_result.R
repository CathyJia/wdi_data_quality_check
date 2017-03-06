## Run sequence 
#  1: Run 000_load_data
#  2: Run 001_tidy_data
source('./R/list1_check_gdp_consistency.R')
source('./R/list1_check_gdp_sum.R')
wdi_2017_gdp_consistency <- list1_check_gdp_consistency(wdi_2017,0.2)
wdi_2015_gdp_consistency <- list1_check_gdp_consistency(wdi_2017,0.2)
wdi_2013_gdp_consistency <- list1_check_gdp_consistency(wdi_2017,0.2)

wdi_2017_gdp_sum <- list1_check_gdp_sum(wdi_2017, 0.05)
wdi_2015_gdp_sum <- list1_check_gdp_sum(wdi_2015, 0.05)
wdi_2013_gdp_sum <- list1_check_gdp_sum(wdi_2013, 0.05)
