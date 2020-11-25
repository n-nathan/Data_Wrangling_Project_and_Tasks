select * from Demographics
select * from Conditions

select a.parentcustomeridname, b.tri_name from Demographics a
inner join
Conditions b
on
a.contactid=b.tri_patientid
where tri_name='Hypertension' and parentcustomeridname= 'Dartmouth-Hitchcock'


select avg(a.tri_age), b.tri_name from Demographics a
inner join
Conditions b
on
a.contactid=b.tri_patientid
group by tri_name


select a.gender, b.tri_name from Demographics a
inner join
Conditions b
on
a.contactid=b.tri_patientid
where gender=1 and tri_name='Congestive Heart Failure'

select a.gender, b.tri_name from Demographics a
inner join
Conditions b
on
a.contactid=b.tri_patientid
where gender=2 and tri_name='Congestive Heart Failure'

select a.gender, b.tri_name from Demographics a
inner join
Conditions b
on
a.contactid=b.tri_patientid
where gender=1 and tri_name='COPD'

select a.gender, b.tri_name from Demographics a
inner join
Conditions b
on
a.contactid=b.tri_patientid
where gender=2 and tri_name='COPD'

select a.gender, b.tri_name from Demographics a
inner join
Conditions b
on
a.contactid=b.tri_patientid
where gender=1 and tri_name='Hypertension'

select a.gender, b.tri_name from Demographics a
inner join
Conditions b
on
a.contactid=b.tri_patientid
where gender=2 and tri_name='Hypertension'




