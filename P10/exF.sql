DROP FUNCTION class_10.get_above_average_wage;
GO
CREATE FUNCTION class_10.get_above_average_wage(@in_dno int)  
RETURNS TABLE
AS   
return 
	select 
		* 
	from 
		class_10.employee 
	where 
		dno = @in_dno and 
		salary > (select AVG(salary) from class_10.employee where dno = @in_dno);
GO
select * from class_10.get_above_average_wage(3);