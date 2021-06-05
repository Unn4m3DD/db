DROP FUNCTION class_10.employee_name_and_proj_locations;
GO
CREATE FUNCTION class_10.employee_name_and_proj_locations( @ssn int)
returns TABLE
AS
return(
	select Pname, Plocation from class_10.works_on 
	join class_10.project on Pno = Pnumber
	where Essn = @ssn
)
