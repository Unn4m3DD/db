DROP TRIGGER class_10.repeated_mgr;
GO
CREATE TRIGGER class_10.repeated_mgr on class_10.department
INSTEAD OF INSERT, UPDATE
AS
	BEGIN TRANSACTION;
    DECLARE @Dname VARCHAR(100), @Dnumber int, @Mgr_ssn int, @Mgr_start_date date;
	DECLARE [cursor] CURSOR FOR
      SELECT * FROM inserted
    OPEN [cursor]
    FETCH NEXT FROM [cursor] INTO @Dname, @Dnumber, @Mgr_ssn, @Mgr_start_date;
    WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT @Mgr_ssn;
		IF NOT EXISTS(SELECT * FROM class_10.department where department.Mgr_ssn = @Mgr_ssn)
			BEGIN
				PRINT 'insert';
				INSERT INTO department values(@Dname, @Dnumber, @Mgr_ssn, @Mgr_start_date);
			END
		ELSE
			BEGIN
				RAISERROR ('Já existe um departamento com esse manager', 16,1);
				--ROLLBACK TRANSACTION
			END
		FETCH NEXT FROM [cursor] INTO @Dname, @Dnumber, @Mgr_ssn, @Mgr_start_date;
	END
	CLOSE [cursor]
    DEALLOCATE [cursor]
GO