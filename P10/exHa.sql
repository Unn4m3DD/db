DROP TRIGGER class_10.ex_h;
GO
CREATE TRIGGER ex_h ON class_10.department
AFTER DELETE as begin
  IF (
    NOT EXISTS (
      SELECT *
      FROM INFORMATION_SCHEMA.TABLES
      WHERE TABLE_SCHEMA = 'class_10'
        AND TABLE_NAME = 'department_deleted'
    )
  ) create table class_10.department_deleted(
    Dname VARCHAR(100),
    Dnumber int,
    Mgr_ssn int,
    Mgr_start_date date
  );
  insert into department_deleted select *  from deleted;
end
GO

insert into class_10.department values  
('Investigacao',31,1231443 ,'2010-08-02');

GO
delete from class_10.department where 'Investigacao' = Dname;
GO
select * from class_10.department_deleted;