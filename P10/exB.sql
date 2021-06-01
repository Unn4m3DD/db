drop PROCEDURE class_10.ex_b;
GO
CREATE PROCEDURE class_10.ex_b
	@last_ssn int Output,
	@last_manager_time int Output
AS
BEGIN
select  @last_ssn = ssn,
  @last_manager_time = datediff(year, Mgr_start_date, GETDATE())
from class_10.employee
  inner join class_10.department on ssn = Mgr_ssn;
  
select Fname + ' ' + Lname
from class_10.employee
  inner join class_10.department on ssn = Mgr_ssn;
  return
END
GO

declare @last_ssn as int;
declare @last_manager_time as int;

exec class_10.ex_b @last_ssn output, @last_manager_time output;

select @last_ssn as ssn, @last_manager_time as [time];
