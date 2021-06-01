DROP FUNCTION class_10.dep_projs_and_money;
GO
CREATE FUNCTION class_10.dep_projs_and_money ( @in_Dnum int)
RETURNS @proj_budget_table table(pnum int, budget int, cum_sum int)
AS
    BEGIN
        DECLARE @Pnumber int, @Pbudget int, @cum_sum int;
        DECLARE C CURSOR FAST_FORWARD
        FOR SELECT Pno, sum(Salary) FROM class_10.employee
        join class_10.works_on on Ssn = Essn
        where Dno = @in_dnum
        group by Pno;
        OPEN c;
        FETCH C INTO @Pnumber, @Pbudget;
        SELECT @cum_sum = 0;
        WHILE @@FETCH_STATUS = 0
        BEGIN
            set @cum_sum += @Pbudget;
            insert into @proj_budget_table values(@Pnumber, @Pbudget, @cum_sum)
            FETCH C INTO @Pnumber, @Pnumber;
        END; 
        CLOSE C;
        DEALLOCATE C;
        return;
    END
GO
select * from class_10.dep_projs_and_money(3);