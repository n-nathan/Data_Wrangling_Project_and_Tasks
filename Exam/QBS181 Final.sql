select * from nnathan.IC_BP_v2
sp_rename 'nnathan.IC_BP_v2.BPAlerts', 'BPStatus', 'COLUMN'
update nnathan.IC_BP_v2
set BPStatus='Controlled'
where BPStatus='Hypo1' or BPStatus='Normal'
update nnathan.IC_BP_v2
set BPStatus='Uncontrolled'
where BPStatus='Hypo2' or BPStatus='HTN1' or BPStatus='HTN2' or BPStatus='HTN3'
alter table nnathan.IC_BP_v2
add DichotomousOutcomes numeric
update nnathan.IC_BP_v2
set DichotomousOutcomes = 
(CASE WHEN BPStatus='Controlled' THEN 1 
WHEN BPStatus='Uncontrolled' THEN 0
end)
select * from nnathan.IC_BP_v2

---this was just changing to controlled or uncontrolled and then making a dichotomous column

select * into nnathan.bpmerged from Demographics a
inner join
nnathan.IC_BP_v2 b
on
a.contactid=b.ID

insert into nnathan.bpinterval
select ID, avg(SystolicValue),avg(Diastolicvalue) from nnathan.bpmerged
group by ID

---created a new table with the averages for each patient


select * from nnathan.bpmerged
select * from nnathan.bpinterval
sp_rename 'nnathan.bpinterval.ID', 'Identifyer', 'COLUMN'
sp_rename 'nnathan.bpinterval.SystolicValue', 'AvgSys', 'COLUMN'
sp_rename 'nnathan.bpinterval.Diastolicvalue', 'AvgDia', 'COLUMN'


select * into nnathan.bpfinal from nnathan.bpmerged a
inner join
nnathan.bpinterval b
on
a.contactid=b.Identifyer

---joined them altogether

select * from nnathan.bpfinal

alter table nnathan.bpfinal
add successintervention varchar(255)
update nnathan.bpfinal
set successintervention = 
(CASE WHEN AvgSys >=90 and AvgDia<=80 and AvgSys<=120 and AvgDia>=60 THEN 'Controlled' 
end)

--made a column based off of who would be considered Hypo-1 or Normal 

select * from nnathan.bpfinal


select sum(case when BPStatus='Uncontrolled' and successintervention= 'Controlled' then 1 else 0 end)as totalinterventions into nnathan.interventions 
from nnathan.bpfinal
group by ID

select totalinterventions from nnathan.interventions 
where totalinterventions>0

---got 83 rows so 83 people who changed from uncontrolled to controlled

select  top(10) * from nnathan.bpfinal 
order by newid()

select * from Demographics
select * from Text
select * from Conditions

SELECT tri_contactId, MAX(TextSentDate) as TextDate into nnathan.TextQ2 from Text
group by tri_contactId

---first created a new table that had only the max text sent dates

select * into nnathan.q2final from Demographics a
left join Conditions b
on
a.contactid=b.tri_patientid
left join nnathan.TextQ2 c
on 
c.tri_contactID=a.contactid

---then I merged them with the Demographics and Conditions tables

select * from nnathan.q2final
select count(TextDate) from nnathan.q2final

select  top(10) * from nnathan.q2final
order by newid()
