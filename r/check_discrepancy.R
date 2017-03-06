## The aim of the function is to check whether GDP equals sum of the value added components(AGR, IND, SRV)
library(magrittr)
check_discrepancy <- function(df, sum_discrepancy_threshold) {
  
  cols = c(3:ncol(df))
  
  df[,cols] %<>% lapply(function(x) as.numeric(x))
  
  df1 <- df[-nrow(df),-c(1,2)]
  df2 <- df[nrow(df), -c(1,2)]
  
  df3 <- df1 %>%
    summarise_each(funs(sum))
  
  df4 <- rbind(df2,df3)

  
  diff_rate <- (tail(df4,-1) - head(df4,-1))/head(df4,-1)
  
  df5 <- rbind(df4, diff_rate)
  df5 <- as.data.frame(t(df5)) 
  
  Series_Code <- df[nrow(df),2]
  colnames(df5)[1:3] <- c(Series_Code, "SUM","diff_rate")
  Country_Code <- rep(df$Country_Code[1],nrow(df5))
  df6 <- as.data.frame(cbind(Country_Code, df5))
  year <- rownames(df6)
  df6 <- cbind(year,df6)
  df7 <- dplyr::filter(df6, abs(df6$diff_rate) >  sum_discrepancy_threshold )
  return (df7)
  } 


