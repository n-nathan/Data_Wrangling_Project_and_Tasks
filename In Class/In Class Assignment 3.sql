select count(DX_ID), DX_NAME from Dx
group by DX_NAME
having count(DX_ID)>100


select a.MEAS_VALUE, a.DISP_NAME, a.PAT_ENC_CSN_ID, c.PATIENT_DOB_CATEGORY into nnathan.patientheight64 from Flowsheets a
left join Inpatient b
on
a.PAT_ENC_CSN_ID=b.NEW_PAT_ENC_CSN_ID
left join Outpatient c
on 
c.NEW_PAT_ENC_CSN_ID=a.PAT_ENC_CSN_ID
where DISP_NAME='Height' and PATIENT_DOB_CATEGORY='Over 64' 

select AVG(MEAS_VALUE) from nnathan.patientheight64


select a.DISP_NAME, a.PAT_ENC_CSN_ID, a.MEAS_VALUE, b.DX_NAME, c.tri_name into nnathan.hypertension from Flowsheets a
left join Dx b
on 
a.PAT_ENC_CSN_ID=b.NEW_PAT_ENC_CSN_ID
left join Conditions c
on
c.tri_name=b.DX_NAME
where DX_NAME = 'Hypertension' and (DISP_NAME='Weight' or DISP_NAME='Height')

select DISP_NAME, avg(MEAS_VALUE) from nnathan.hypertension
group by DISP_NAME

--assuming that the weight is in ounces the BMI is about 36.29

select avg(MEAS_VALUE), DISP_NAME from Flowsheets
where DISP_NAME like '%BMI%'
group by DISP_NAME

--the total average BMI is about 6 pooints lower than the BMI those with hypertension

select a.MEAS_VALUE, a.DISP_NAME, a.PAT_ENC_CSN_ID, c.PATIENT_DOB_CATEGORY from Flowsheets a
left join Inpatient b
on
a.PAT_ENC_CSN_ID=b.NEW_PAT_ENC_CSN_ID
left join Outpatient c
on 
c.NEW_PAT_ENC_CSN_ID=a.PAT_ENC_CSN_ID
