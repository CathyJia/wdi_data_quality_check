
rm(list=ls())
library(zoo)
library(readxl)
library(dplyr)
library(tidyr)
#library(graphics)

options(digits = 3)

# Part 1: Read Data -------------------------------------------------------

excel_sheets('./input/wdi_2013.xlsx')
excel_sheets('./input/wdi_2015.xlsx')
#excel_sheets('./input/WDI_CETS.xls')
# Please change 'Sheet" into 'Sheet1" before run the code.Wored R.
wdi_2017 <- read_excel("./input/wdi_2017.xlsx")
wdi_2015 <- read_excel("./input/wdi_2015.xlsx")
wdi_2013 <- read_excel("./input/wdi_2013.xlsx")
#WDI_CETS <- read_excel("./input/WDI_CETS.xls", "WDI series")

