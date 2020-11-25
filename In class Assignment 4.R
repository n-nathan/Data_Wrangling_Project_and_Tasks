#install.packages("dplyr", "ggplot2", "RMySQL", "data.table", "RODBC")
library('RODBC')
myconn=RODBC::odbcConnect('QBS181','nnathan','nnathan@qbs181')
#install.packages('sqldf')
library(sqldf)
#install.packages("dplyr")
install.packages("dbplyr")
library(dbplyr)
R_Dx=sqlQuery(myconn, "select * from Dx")
R_Dx$DX_NAME=sapply(R_Dx$DX_NAME,tolower)
install.packages("stringr")
library(stringr)
R_Dx$DX_NAME=sapply(R_Dx$DX_NAME,function(x)gsub(" ", "",x))
R_Dx$DX_NAME=sapply(R_Dx$DX_NAME,function(x)gsub(",", "",x))
Inpatient_Outpatient=sqlQuery(myconn, "select A. *,B.* from Outpatient A
inner join Inpatient B
on A.NEW_PATIENT_DHMC_MRN=B.NEW_PATIENT_DHMC_MRN")
Inpatient_Outpatient$NEW_PATIENT_DHMC_MRN=sapply(Inpatient_Outpatient$NEW_PATIENT_DHMC_MRN,function(x)gsub("-", "",x))
Inpatient_Outpatient2=sqlQuery(myconn, "select A. *,B.* from Outpatient A
inner join Inpatient B
on A.NEW_PAT_ID=B.NEW_PAT_ID")


#Inpatient_Outpatient3=sqlQuery(myconn, "select * from Outpatient 
#union select * from Inpatient")

#IC_Conditions=sqlQuery(myconn, "selct * from Conditions")
#IC_Demo_Conditions=sqlQuery(myconn. "select d. *,C. * from Demographics d inner join Conditions c on d.contactid=c.tri_patientid")
#Inpatient_Outpatient=sqlQuery(myconn, "select A. *,B.* from Outpatient A
                              #inner join Flowsheets B
                              #on A.NEW_PAT_ENC_CSN_ID=B.PAT_ENC_CSN_ID
                              #where PATIENT_DOB_CATEGORY like '%over%' and disp_name='Height'")

#Demo_Conditions=sqldf("select d*,c.* from IC_Demo d inner join IC_Conditions c on d.contactid=c.tri_patientid")
#install.packages('stringr')