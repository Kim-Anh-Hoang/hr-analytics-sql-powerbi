-- Total Emloyees
select count(*) as 'Total Employees'
from HRAnalysis;

-- Attrition 
Select count (*) as 'Attrition'
from HRAnalysis
WHERE Attrition = 1 ;

-- Active Employees
Select count (*) as 'Active Employees'
from HRAnalysis
WHERE Attrition = 0 ;


-- Attrition rate
select 
round (( 100.0 * sum(case when Attrition = 1 then 1.0 else 0 end)/count(*)),2)  as 'Attrition Rate'
from dbo.HRAnalysis;

-- Attrition by Departments
Select Department, 
round (( 100.0 * sum(case when Attrition = 1 then 1.0 else 0 end)/count(*)),2)  as 'Attrition Rate'

from dbo.HRAnalysis
group by DepartmenT;

-- Attrition by Age Group 
select 
(case when Age BETWEEN 18 AND 25 THEN '18 - 25' 
WHEN Age between 26 and 30 then '25-30'
when Age between 31 and 40 then '30-40'
WHEN Age between 41 and 50 then '40-50'
else '60+' end) as 'Age Groups',
round (( 100.0 * sum(case when Attrition = 1 then 1.0 else 0 end)/count(*)),2)  as 'Attrition Rates'
from dbo.HRAnalysis
group by 
(case when Age BETWEEN 18 AND 25 THEN '18 - 25' 
WHEN Age between 26 and 30 then '25-30'
when Age between 31 and 40 then '30-40'
WHEN Age between 41 and 50 then '40-50'
else '60+' end)
order by 'Age Groups'
;

-- Attrition by Job Roles
select JobRole, 
round((100.0*sum(case when Attrition = 1 then 1.0 else 0 end)/count(*)),2) as 'Attrition Rates'
from dbo.HRAnalysis
group by JobRole
order by 'Attrition Rates' ;

-- Attrition  by Education
select 
(Case 
when Education = 1 then 'Below College' 
when Education = 2 then 'College' 
when Education = 3 then 'Bachelor' 
when Education = 4 then 'Master' 
when Education = 5 then 'Doctor'
end) as 'Education Groups',
round((100.0*sum(case when Attrition = 1 then 1.0 else 0 end)/count(*)),2) as 'Attrition Rates'
from dbo.HRAnalysis
group by (Case 
when Education = 1 then 'Below College' 
when Education = 2 then 'College' 
when Education = 3 then 'Bachelor' 
when Education = 4 then 'Master' 
when Education = 5 then 'Doctor'
end)
order by 'Attrition Rates'
;
 
-- Attrition by Income Levels
Select IncomeLevel as 'Income Levels',
round((100.0*sum(case when Attrition = 1 then 1.0 else 0 end)/count(*)),2) as 'Attrition Rates'
from dbo.HRAnalysis
group by IncomeLevel
order by 'Attrition Rates'

-- Attrition by Gender 
select gender as 'Gender',
round((100.0*sum(case when Attrition = 1 then 1.0 else 0 end)/count(*)),2) as 'Attrition Rates'
from dbo.HRAnalysis
group by Gender;
