DROP PROCEDURE remove_employee;
GO
CREATE PROCEDURE remove_employee
    @in_ssn int
AS
BEGIN
    DELETE FROM class_10.DEPENDENT WHERE Essn = @in_ssn;
    DELETE FROM class_10.WORKS_ON WHERE Essn = @in_ssn;
    UPDATE class_10.departament set Mgr_ssn = NULL where Mgr_ssn = @in_ssn
    UPDATE class_10.employee set Super_ssn = NULL where Super_ssn = @in_ssn
    DELETE FROM class_10.EMPLOYEE WHERE Ssn = @in_ssn;
END

-- Se existir uma entrada em department 
--   cujo mgr_ssn seja @in_ssn -> ficará com uma chave cujo ssn já não pertence a nenhum dos employees
-- O mesmo é verdade ser @in_ssn for Super_ssn de outro employee