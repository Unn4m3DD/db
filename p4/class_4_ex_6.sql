create schema class_4_ex_6;
GO
;
create table class_4_ex_6.Person (
    cc INT primary key not null,
    person_name VARCHAR(256) not null,
    person_address VARCHAR(256) not null,
    birthdate DATE not null
);
GO
;
create table class_4_ex_6.Professor (
    cc INT primary key foreign key references class_4_ex_6.Person(cc) not null,
    email VARCHAR(256) not null,
    phone_number CHAR(14) not null,
    functionary_id INT not null
);
GO
;
create table class_4_ex_6.SponsorEducation (
    cc INT primary key foreign key references class_4_ex_6.Person(cc) not null,
    email VARCHAR(256) not null,
    phone_number CHAR(14) not null
);
GO
;
create table class_4_ex_6.Class (
    id INT primary key not null,
    class_name VARCHAR(256) not null,
    year INT not null,
    class_type VARCHAR(256) check (class_type in ('yoga', 'judo')),
    capacity INT not null,
    professor_cc INT foreign key references class_4_ex_6.Professor(cc) not null
);
GO
;
create table class_4_ex_6.Student (
    id INT primary key foreign key references class_4_ex_6.Person(cc) not null,
    class_id INT foreign key references class_4_ex_6.Class(id) not null,
    sponsor_id INT foreign key references class_4_ex_6.SponsorEducation(cc) not null
);
GO
;
create table class_4_ex_6.Authorized (
    person_cc INT primary key foreign key references class_4_ex_6.Person(cc) not null,
);
GO
;
create table class_4_ex_6.CanPickup (
    authorized_id INT foreign key references class_4_ex_6.Authorized(person_cc) not null,
    student_id INT foreign key references class_4_ex_6.Student(id) not null,
    primary key(authorized_id, student_id)
);
GO
;
create table class_4_ex_6.Activity (
    id INT primary key not null,
    activity_name VARCHAR(256) not null,
    price INT not null
);
GO
;
create table class_4_ex_6.Offers (
    class_id INT foreign key references class_4_ex_6.Class(id) not null,
    activity_id INT foreign key references class_4_ex_6.Activity(id) not null,
    primary key(class_id, activity_id)
);
GO
;
create table class_4_ex_6.OptIn (
    student_id INT foreign key references class_4_ex_6.Student(id) not null,
    activity_id INT foreign key references class_4_ex_6.Activity(id) not null,
    primary key(student_id, activity_id)

);
GO
;
create table class_4_ex_6.CanPickup (
    authorized_id INT foreign key references class_4_ex_6.Authorized(person_cc) not null,
    student_id INT foreign key references class_4_ex_6.Student(id) not null,
    primary key(authorized_id, student_id)
);
GO
;