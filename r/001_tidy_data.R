
source('./R/000_load_data.R')
source('./R/utils.R')

# Part 2: Clean Data -------------------------------------------------------
# delete empty column
wdi_2017 <- wdi_2017[,-c(3,5)]
wdi_2015 <- wdi_2015[,-c(3,5)]
wdi_2013 <- wdi_2013[,-c(3,5)]
# rename the column names
cname_new <- as.data.frame(wdi_2017[1,])

for ( i in 1:ncol(wdi_2017))
{
  names(wdi_2017)[i] = cname_new[i]
}
wdi_2017 <- wdi_2017[-1,]
colnames(wdi_2017)

for ( i in 1:ncol(wdi_2015))
{
  names(wdi_2015)[i] = cname_new[i]
}
wdi_2015 <- wdi_2015[-1,]

for ( i in 1:ncol(wdi_2013))
{
  names(wdi_2013)[i] = cname_new[i]
}
wdi_2013 <- wdi_2013[-1,]


# for the first column, repalce each NA with the most recent non-NA prior to it

wdi_2017$Country_Code <- na.locf(wdi_2017$Country_Code)
wdi_2015$Country_Code <- na.locf(wdi_2015$Country_Code)
wdi_2013$Country_Code<- na.locf(wdi_2013$Country_Code)



