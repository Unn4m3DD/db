DROP TRIGGER class_10.ex_d;
GO
CREATE TRIGGER ex_d ON class_10.employee
AFTER
INSERT, UPDATE 
as begin

    DECLARE @ssn int;
    DECLARE @salary int
    DECLARE @Dno int
    DECLARE [cursor] CURSOR FOR
      SELECT Ssn, Salary, Dno FROM inserted
	select * from inserted
    OPEN [cursor]
    FETCH NEXT FROM [cursor] INTO @ssn, @salary, @Dno
    WHILE @@FETCH_STATUS = 0
    BEGIN
      declare @dep_mgr INT; 
      select @dep_mgr  = Mgr_ssn from class_10.department where @Dno = Dnumber;
      declare @mgr_salary  INT;
      select  @mgr_salary = salary from class_10.employee where @dep_mgr = Ssn;

      IF(@salary > @mgr_salary)
        update class_10.employee set salary = @mgr_salary - 1 where ssn = @ssn;

      FETCH NEXT FROM [cursor] INTO @ssn, @salary, @Dno
    END
    CLOSE [cursor]
    DEALLOCATE [cursor]
end
GO