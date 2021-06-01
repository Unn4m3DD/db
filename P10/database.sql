drop table class_10.employee;
drop table class_10.department;
drop table class_10.dependent;
drop table class_10.dept_location;
drop table class_10.project;
drop table class_10.works_on;
GO
drop schema class_10;
GO
create schema class_10;
GO
create table class_10.employee (
  Fname VARCHAR(15),
  Minit VARCHAR(15),
  Lname VARCHAR(15),
  Ssn int,
  Bdate date,
  [Address] VARCHAR(256),
  Sex VARCHAR(10),
  Salary int,
  Super_ssn int,
  Dno int
);
GO
create table class_10.department(
  Dname VARCHAR(100),
  Dnumber int,
  Mgr_ssn int,
  Mgr_start_date date
);
GO
create table class_10.dependent(
  Essn int,
  Dependent_name VARCHAR(100),
  Sex VARCHAR(10),
  Bdate date,
  Relationship VARCHAR(100)
);
GO
create table class_10.dept_location(Dnumber int, Dlocation VARCHAR(100));
GO
create table class_10.project(
  Pname VARCHAR(100),
  Pnumber int,
  Plocation VARCHAR(100),
  Dnum int
);
GO
create table class_10.works_on(Essn int, Pno int, [Hours] int);
GO






insert into class_10.employee values  
('Paula','A','Sousa',183623612,'2001-08-11','Rua da FRENTE','F',1450.00,NULL,3),
('Carlos','D','Gomes',21312332 ,'2000-01-01','Rua XPTO','M',1200.00,NULL,1),
('Juliana','A','Amaral',321233765,'1980-08-11','Rua BZZZZ','F',1350.00,NULL,3),
('Maria','I','Pereira',342343434,'2001-05-01','Rua JANOTA','F',1250.00,21312332,2),
('Joao','G','Costa',41124234 ,'2001-01-01','Rua YGZ','M',1300.00,21312332,2),
('Ana','L','Silva',12652121 ,'1990-03-03','Rua ZIG ZAG','F',1400.00,21312332,2);


insert into class_10.department values  
('Investigacao',1,21312332 ,'2010-08-02'),
('Comercial',2,321233765,'2013-05-16'),
('Logistica',3,41124234 ,'2013-05-16'),
('Recursos Humanos',4,12652121,'2014-04-02'),
('Desporto',5,NULL,NULL);


insert into class_10.dependent values  
(21312332 ,'Joana Costa','F','2008-04-01', 'Filho'),
(21312332 ,'Maria Costa','F','1990-10-05', 'Neto'),
(21312332 ,'Rui Costa','M','2000-08-04','Neto'),
(321233765,'Filho Lindo','M','2001-02-22','Filho'),
(342343434,'Rosa Lima','F','2006-03-11','Filho'),
(41124234 ,'Ana Sousa','F','2007-04-13','Neto'),
(41124234 ,'Gaspar Pinto','M','2006-02-08','Sobrinho');


insert into class_10.dept_location values 
(2,'Aveiro'),
(3,'Coimbra');


insert into class_10.project values  
('Aveiro Digital',1,'Aveiro',3),
('BD Open Day',2,'Espinho',2),
('Dicoogle',3,'Aveiro',3),
('GOPACS',4,'Aveiro',3);


insert into class_10.works_on values  
(183623612,1,20.0),
(183623612,3,10.0),
(21312332 ,1,20.0),
(321233765,1,25.0),
(342343434,1,20.0),
(342343434,4,25.0),
(41124234 ,2,20.0),
(41124234 ,3,30.0);
