create schema class_4_ex_5;

GO
;

create table class_4_ex_5.Conference(id INT primary key)
GO
;

create table class_4_ex_5.Paper(id INT primary key, title VARCHAR(30))
GO
;

create table class_4_ex_5.Person(id INT primary key, name VARCHAR(30))
GO
;

create table class_4_ex_5.Attender(id INT primary key foreign key references class_4_ex_5.Person(id))
GO
;

create table class_4_ex_5.HostsPresentation(
  conference_id INT foreign key references class_4_ex_5.Conference(id),
  paper_id INT foreign key references class_4_ex_5.Paper(id),
  primary key (conference_id, paper_id)
)
GO
;

create table class_4_ex_5.AttendedBy(
  conference_id INT foreign key references class_4_ex_5.Conference(id),
  attender_id INT foreign key references class_4_ex_5.Attender(id),
  primary key (conference_id, attender_id)
)
GO
;

create table class_4_ex_5.Author(
  id INT primary key foreign key references class_4_ex_5.Person(id),
  email VARCHAR(50) --regex email
)
GO
;

create table class_4_ex_5.WrittenBy(
  paper_id INT foreign key references class_4_ex_5.Paper(id),
  author_id INT foreign key references class_4_ex_5.Author(id),
  primary key (paper_id, author_id)
)
GO
;

create table class_4_ex_5.NotStudent(
  id INT primary key foreign key references class_4_ex_5.Attender(id),
  transaction_reference char(15)
)
GO
;

create table class_4_ex_5.Institution(
  id INT primary key foreign key references class_4_ex_5.Attender(id),
  name VARCHAR(30) not null,
  address VARCHAR(50) not null
)
GO
;

create table class_4_ex_5.Student(
  id INT primary key foreign key references class_4_ex_5.Attender(id),
  institution_id INT foreign key references class_4_ex_5.Institution(id),
  certificate_id INT,
  domain VARCHAR(10),
)
GO
;

create table class_4_ex_5.BelongsTo(
  author_id INT foreign key references class_4_ex_5.Author(id),
  institution_id INT foreign key references class_4_ex_5.Institution(id),
  primary key (author_id, institution_id)
)
GO
;