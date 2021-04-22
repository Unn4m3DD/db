-- a)
-- π employee.Ssn, employee.Fname, employee.Minit, employee.Lname (project ⟗ project.Pnumber = works_on.Pno (works_on) ⟕ works_on.Essn = employee.Ssn (employee))
select
  employee.Ssn,
  employee.Fname,
  employee.Minit,
  employee.Lname
from
  project full
  join works_on ON project.Pnumber = works_on.Pno
  left join employee ON works_on.Essn = employee.Ssn;

-- b)
-- π e.Fname ((ρ s (employee)) ⟖ s.Ssn ≠ e.Ssn and s.Ssn = e.Super_ssn and s.Fname = 'Carlos' and s.Minit = 'D' and s.Lname = 'Gomes' (ρ e (employee)))
/*
 results
 e.Fname
 Paula
 Carlos
 Juliana
 Maria
 Joao
 Ana
 
 select e.Fname from employee 
 where Ssn = (select s.Ssn from employee as s where s.Fname = 'Carlos' and s.Minit = 'D' and s.Lname = 'Gomes')
 */
select
  e.Fname
from
  employee as s
  right join employee as e on (
    s.Ssn != e.Ssn
    and s.Ssn = e.Super_ssn
    and (
      s.Fname = 'Carlos'
      and s.Minit = 'D'
      and s.Lname = 'Gomes'
    )
  );

-- c) 
--π Hours, Fname (project ⨝ Pnumber = Pno works_on ⨝ Ssn = Essn employee)
/*
 works_on.Hours	employee.Fname
 20	Paula
 20	Carlos
 25	Juliana
 20	Maria
 20	Joao
 10	Paula
 30	Joao
 25	Maria
 */
select
  Hours,
  Fname
from
  project
  inner join works_on on Pnumber = Pno
  inner join employee on Ssn = Essn;

-- d)
/* 
 π Fname (σ Dno = 3 and Pname = 'Aveiro Digital' and Hours > 20 (employee ⨝ Ssn = Essn works_on ⨝ Pnumber = Pno project))
 
 employee.Fname
 Juliana
 */
select
  Fname
from
  employee
  inner join works_on on Ssn = Essn
  inner join project on Pnumber = Pno
where
  Dno = 3
  and Pname = 'Aveiro Digital'
  and Hours > 20;

-- e) 
/*
 π Fname, Lname σ works_on.Essn = null (employee ⟕ Essn = Ssn works_on)
 
 employee.Fname	employee.Lname
 Ana	Silva
 */
select
  Fname,
  Lname
from
  employee
  left join works_on on Essn = Ssn
where
  works_on.Essn is NULL;

-- f)
/*
 π Dno, avg_salary (γ Dno; AVG(Salary)→avg_salary σ Sex = 'F' employee ⨝ Dnumber = Dno (department))
 
 employee.Dno	avg_salary
 3	1400
 2	1325
 */
select
  Dno,
  avg(Salary) as avg_salary
from
  employee
  inner join department on Dnumber = Dno
where
  Sex = 'F'
group by
  Dno -- g)
  /*
   π Fname, Ssn, dep_count (σ dep_count > 2 ρ raw_data (π Fname, Ssn, dep_count γ Fname, Ssn; COUNT(Ssn)→dep_count ((employee) ⨝ Essn = Ssn (dependent))))
   raw_data.Fname	raw_data.Ssn	raw_data.dep_count
   Carlos	21312332	3
   */
select
  Fname,
  Ssn,
  dep_count
from
  (
    select
      Fname,
      Ssn,
      count(Ssn) as dep_count
    from
      employee
      inner join dependent on Essn = Ssn
    group by
      Fname,
      Ssn
  ) as raw_data
where
  dep_count > 2 -- h)
  /*
   π Ssn, Fname, Lname σ Essn = null (((employee) ⨝ Ssn = Mgr_ssn (department)) ⟕ Ssn = Essn (dependent))
   employee.Ssn	employee.Fname	employee.Lname
   12652121	Ana	Silva
   */
select
  Ssn,
  Fname,
  Lname
from
  employee
  inner join department on Ssn = Mgr_ssn
  left join dependent on Ssn = Essn
where
  Essn is null;

-- i)
/*
π Fname, Address (
  σ Plocation = 'Aveiro' (employee ⨝ Dno = Dnumber
    dept_location ⨝ Essn = Ssn
    works_on ⨝ Pno = Pnumber
    project ▷ (
	    π Dnumber (σ Dlocation = 'Aveiro' (dept_location))
    )
  )
)
employee.Fname	employee.Address
Paula	Rua da FRENTE
Juliana	Rua BZZZZ

*/

select
  [Address]
from
  employee
  inner join dept_location on Dnumber = Dno
  inner join works_on on Ssn = Essn
  inner join project on Pno = Pnumber
where
  Plocation = 'Aveiro'
  and Dnumber not in (
    select
      Dnumber
    from
      dept_location
    where
      Dlocation = 'Aveiro'
  ) -- this query lists all deps in aveiro, it does not work on the simulator