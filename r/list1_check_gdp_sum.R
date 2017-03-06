library(dplyr)
library(tidyr)
source('./R/check_discrepancy.R')
source('./R/custom_subset.R')

list1_check_gdp_sum <- function(df, sum_discrepancy_threshold){
  
  # Checklist for national accounts1: Ensure GDP equals sum of value added components 
  # Check whether GPD == SUM of the three industries ----------------------------------
  # Please put the sum value at the last

  GDP_NV_Component_CD_Series_Code <- c('NV.AGR.TOTL.CD',
                                       'NV.IND.TOTL.CD',
                                       'NV.SRV.TETC.CD',
                                       'NY.GDP.FCST.CD')
  GDP_NV_Component_CD <- custom_subset(df,GDP_NV_Component_CD_Series_Code)
  
  
  GDP_NV_Component_CN_Series_Code <- c('NV.AGR.TOTL.CN',
                                       'NV.IND.TOTL.CN',
                                       'NV.SRV.TETC.CN',
                                       'NY.GDP.FCST.CN')
  GDP_NV_Component_CN <- custom_subset(df,GDP_NV_Component_CN_Series_Code)
  
  
  GDP_NV_Component_KD_Series_Code <- c('NV.AGR.TOTL.KD',
                                       'NV.IND.TOTL.KD',
                                       'NV.SRV.TETC.KD',
                                       'NY.GDP.FCST.KD')
  GDP_NV_Component_KD <- custom_subset(df, GDP_NV_Component_KD_Series_Code)
  
  
  GDP_NV_Component_KN_Series_Code <-  c('NV.AGR.TOTL.KN',
                                        'NV.IND.TOTL.KN',
                                        'NV.SRV.TETC.KN',
                                        'NY.GDP.FCST.KN')
  GDP_NV_Component_KN <- custom_subset(df, GDP_NV_Component_KN_Series_Code)
  
  # Checklist for national accounts1: Ensure GDP equals sum of expenditure compoents
  # Only need to check CD and CN ---------------------------------- 
  
 
  
  # Check descrepency for NE...CD -----------------------------------------------------------
  # 
  NE.CON.TETC.CD_Series_Code <- c('NE.CON.GOVT.CD',
                                  'NE.CON.PETC.CD',
                                  'NE.CON.TETC.CD')
  NE.CON.TETC.CD <- custom_subset(df,NE.CON.TETC.CD_Series_Code)
  
  
  NE.GDI.TOTL.CD_Series_Code <- c('NE.GDI.FTOT.CD', 
                                  'NE.GDI.STKB.CD',  
                                  'NE.GDI.TOTL.CD') 
  NE.GDI.TOTL.CD <- custom_subset(df,NE.GDI.TOTL.CD_Series_Code)
  
  
  NE.CON.TOTL.CD_Series_Code <- c('NE.CON.GOVT.CD',
                                  'NE.CON.PRVT.CD',
                                  'NE.CON.TOTL.CD')
  NE.CON.TOTL.CD <- custom_subset(df,NE.CON.TOTL.CD_Series_Code)
  
  
  
  NE.DAB.TOTL.CD_Series_Code <- c('NE.GDI.TOTL.CD',
                                  'NE.CON.TETC.CD',
                                  'NE.DAB.TOTL.CD')
  NE.DAB.TOTL.CD <- custom_subset(df,NE.DAB.TOTL.CD_Series_Code)
  
  
  NE.EXP.GNFS.CD_Series_Code <- c('NE.RSB.GNFS.CD',
                                  'NE.IMP.GNFS.CD',
                                  'NE.EXP.GNFS.CD')
  NE.EXP.GNFS.CD <- custom_subset(df,NE.EXP.GNFS.CD_Series_Code)
  
  
  GDP_NV_Component_CD_Series_Code <- c('NE.CON.TETC.CD',
                                       'NE.GDI.TOTL.CD',
                                       'NE.RSB.GNFS.CD',
                                       'NY.GDP.FCST.CD')
  GDP_NV_Component_CD <- custom_subset(df,GDP_NV_Component_CD_Series_Code)
  
  
  # Check descrepency for NE...CN-----------------------------------------------------------
  NE.CON.TETC.CN_Series_Code <- c('NE.CON.GOVT.CN',
                                  'NE.CON.PETC.CN',
                                  'NE.CON.TETC.CN')
  NE.CON.TETC.CN <- custom_subset(df, NE.CON.TETC.CN_Series_Code)
  
  NE.GDI.TOTL.CN_Series_Code <- c('NE.GDI.FTOT.CN',
                                  'NE.GDI.STKB.CN',
                                  'NE.GDI.TOTL.CN')
  NE.GDI.TOTL.CN <- custom_subset(df, NE.GDI.TOTL.CN_Series_Code)
  
  
  NE.CON.TOTL.CN_Series_Code <- c('NE.CON.GOVT.CN',
                                  'NE.CON.PRVT.CN',
                                  'NE.CON.TOTL.CN')
  NE.CON.TOTL.CN <- custom_subset(df, NE.CON.TOTL.CN_Series_Code)
  
  
  
  NE.DAB.TOTL.CN_Series_Code <- c('NE.GDI.TOTL.CN',
                                  'NE.CON.TETC.CN',
                                  'NE.DAB.TOTL.CN')
  NE.DAB.TOTL.CN <- custom_subset(df, NE.DAB.TOTL.CN_Series_Code)
  
  
  NE.EXP.GNFS.CN_Series_Code <- c('NE.RSB.GNFS.CN',
                                  'NE.IMP.GNFS.CN',
                                  'NE.EXP.GNFS.CN')
  NE.EXP.GNFS.CN <- custom_subset(df, NE.EXP.GNFS.CN_Series_Code)
  
  GDP_NV_Component_CN_Series_Code <- c('NE.CON.TETC.CN',
                                       'NE.GDI.TOTL.CN',
                                       'NE.RSB.GNFS.CN',
                                       'NY.GDP.FCST.CN')
  GDP_NV_Component_CN <-  custom_subset(df, GDP_NV_Component_CN_Series_Code)
  
  
  ## Result for data quality checklist1


  # Ensure accounting consistency of GDP in current and constant prices

  
  
  # Check GDPequals sum of value added componets
  v_sum_cd_disc <- check_discrepancy(GDP_NV_Component_CD, sum_discrepancy_threshold)
  
  v_sum_cn_disc <- check_discrepancy(GDP_NV_Component_CN, sum_discrepancy_threshold)

  v_sum_kd_disc <- check_discrepancy(GDP_NV_Component_KD, sum_discrepancy_threshold)
  
  v_sum_kn_disc <- check_discrepancy(GDP_NV_Component_KN, sum_discrepancy_threshold)
  
  
  
  # Checklist for national accounts1: Ensure GDP equals sum of expenditure compoents
  NE.CON.TETC.CD_disc <- check_discrepancy(NE.CON.TETC.CD, sum_discrepancy_threshold)
  
  NE.GDI.TOTL.CD_disc <- check_discrepancy(NE.GDI.TOTL.CD, sum_discrepancy_threshold)
  
  NE.CON.TOTL.CD_disc <- check_discrepancy(NE.CON.TOTL.CD, sum_discrepancy_threshold)
 
  NE.DAB.TOTL.CD_disc <- check_discrepancy(NE.DAB.TOTL.CD, sum_discrepancy_threshold)
  
  NE.EXP.GNFS.CD_disc <- check_discrepancy(NE.EXP.GNFS.CD, sum_discrepancy_threshold)
  
  GDP_NV_Component_CD_disc <- check_discrepancy(GDP_NV_Component_CD, sum_discrepancy_threshold)
  
  
  
  NE.CON.TETC.CN_disc <- check_discrepancy(NE.CON.TETC.CN, sum_discrepancy_threshold)
  
  NE.GDI.TOTL.CN_disc <- check_discrepancy(NE.GDI.TOTL.CN, sum_discrepancy_threshold)
  
  NE.CON.TOTL.CN_disc <- check_discrepancy(NE.CON.TOTL.CN, sum_discrepancy_threshold)
  
  NE.DAB.TOTL.CN_disc <- check_discrepancy(NE.DAB.TOTL.CN, sum_discrepancy_threshold)
  
  NE.EXP.GNFS.CN_disc <- check_discrepancy(NE.EXP.GNFS.CN, sum_discrepancy_threshold)
  
  GDP_NV_Component_CN_disc <- check_discrepancy(GDP_NV_Component_CN, sum_discrepancy_threshold)
  
  
  result <- list(v_sum_cd_disc,
                  v_sum_cn_disc,
                  v_sum_kd_disc,
                  v_sum_kn_disc,
                  NE.CON.TETC.CD_disc,
                  NE.GDI.TOTL.CD_disc,
                  NE.CON.TOTL.CD_disc,
                  NE.DAB.TOTL.CD_disc,
                  NE.EXP.GNFS.CD_disc,
                  GDP_NV_Component_CD_disc,
                  NE.CON.TETC.CN_disc,
                  NE.GDI.TOTL.CN_disc,
                  NE.CON.TOTL.CN_disc,
                  NE.DAB.TOTL.CN_disc,
                  NE.EXP.GNFS.CN_disc,
                  GDP_NV_Component_CN_disc
                  )
  return(result)
}

