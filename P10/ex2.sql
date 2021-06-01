CREATE PROCEDURE class_10.ex_b
	@last_ssn int Output,
	@last_manager_time int Output
AS
BEGIN
declare @local_last_ssn as int;
declare @local_last_manager_time as int;
select 
	Fname + ' ' + Lname,
	@local_last_ssn = ssn,
	@local_last_manager_time = datediff(second, Mgr_start_date, GETDATE())
from
	class_10.employee 
	inner join class_10.department on ssn = Mgr_ssn;	
  set @last_ssn = @local_last_ssn;
  set @last_manager_time = @local_last_manager_time;
END