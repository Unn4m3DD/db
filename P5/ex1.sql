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
  )