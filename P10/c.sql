DROP TRIGGER class_10.repeated_mgr;
GO
CREATE TRIGGER class_10.repeated_mgr on class_10.department
INSTEAD OF INSERT, UPDATE
AS
    DECLARE @mgr_ssn as int
    SELECT @mgr_ssn = Mgr_ssn from inserted;
    IF EXISTS( SELECT * FROM class_10.department where Mgr_ssn = @mgr_ssn)
        BEGIN
            RAISERROR ('Já existe um departamento com esse manager', 16,1);
            ROLLBACK TRAN; 
        END
	ELSE
		INSERT INTO department SELECT * FROM inserted;
GO
