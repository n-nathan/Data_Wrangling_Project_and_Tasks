select COLUMN_NAME, DATA_TYPE
FROM information_schema.columns
WHERE TABLE_NAME = 'Demographics'

select COLUMN_NAME, DATA_TYPE
from information_schema.columns
where TABLE_NAME = 'PhoneCall'

select COLUMN_NAME, DATA_TYPE
from information_schema.columns
where TABLE_NAME = 'PhoneCall_Encounter'

select* into nnathan.Demo from dbo.Demographics

select * from nnathan.Demo

select CONVERT (int, gendercode) from nnathan.Demo
--gives error code "Conversion failed when converting the nvarchar value 'NULL' to data type int."

select TRY_CONVERT(int, gendercode) from nnathan.Demo

update nnathan.Demo
set gendercode=0
where gendercode='NULL' 

select * from nnathan.Demo

select CONVERT (int, gendercode) from nnathan.Demo
--now we can see that the error is fixed permanently






