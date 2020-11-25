sp_rename 'nnathan.Demo.tri_age', 'Age', 'COLUMN'
sp_rename 'nnathan.Demo.gendercode', 'Gender', 'COLUMN'
sp_rename 'nnathan.Demo.address1_stateorprovince', 'State', 'COLUMN'
sp_rename 'nnathan.Demo.tri_imaginecareenrollmentemailsentdate', 'EmailSentdate', 'COLUMN'
sp_rename 'nnathan.Demo.tri_enrollmentcompletedate', 'Completedate', 'COLUMN'
sp_rename 'nnathan.Demo.contactid', 'ID', 'COLUMN'

alter table nnathan.Demo
add TimetoEnroll int

update nnathan.Demo
set TimetoEnroll = DATEDIFF(DAY, TRY_CONVERT(DATETIME, EmailSentdate) ,TRY_CONVERT(DATETIME, Completedate))
select * from nnathan.Demo

alter table nnathan.Demo
add EnrollmentStatus varchar(255)

select * from nnathan.Demo

update nnathan.Demo
set EnrollmentStatus = 
(CASE WHEN tri_imaginecareenrollmentstatus=167410011 THEN 'Complete' 
WHEN tri_imaginecareenrollmentstatus=167410001 THEN 'Email Sent' 
WHEN tri_imaginecareenrollmentstatus=167410004 THEN 'Non responder' 
WHEN tri_imaginecareenrollmentstatus=167410005 THEN 'Facilitated Enrollment' 
WHEN tri_imaginecareenrollmentstatus=167410002 THEN 'Incomplete Enrollments' 
WHEN tri_imaginecareenrollmentstatus=167410003 THEN 'Opted Out' 
WHEN tri_imaginecareenrollmentstatus=167410000 THEN 'Unprocessed' 
WHEN tri_imaginecareenrollmentstatus=167410006 THEN 'Second email sent ' 
end)
select * from nnathan.Demo

alter table nnathan.Demo
add GenderName varchar(255)

update nnathan.Demo
set Gender=0
where Gender='NULL'

update nnathan.Demo
set GenderName = 
(CASE WHEN Gender=2 THEN 'female' 
WHEN Gender=1 THEN 'male' 
WHEN Gender=167410000 THEN 'other' 
WHEN Gender=0 THEN 'Unknown' 
end)
select * from nnathan.Demo

alter table nnathan.Demo
add AgeGroup nvarchar(255)

update nnathan.Demo
set AgeGroup = 
(CASE WHEN Age>0 and Age<=25 THEN '0-25' 
WHEN Age>25 and Age<=50 THEN '25-50'
WHEN Age>50 and Age<75 THEN '50-75'
WHEN Age>75 and Age<=100 THEN '75-100'
end)
select * from nnathan.Demo

select  top(10) * from nnathan.Demo 
order by newid()





