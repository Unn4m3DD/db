create schema class_4_ex_4;
GO
;
create table class_4_ex_4.Drug (
    ID INT identity(1, 1) primary key,
    formula varchar(256) not null,
    comercial_name varchar(256) not null
);
GO
;
create table class_4_ex_4.DrugCompany (
    ID INT identity(1, 1) primary key not null,
    company_name varchar(256) not null,
    company_address varchar(256) not null,
    phone INT not null
);
GO
;
create table class_4_ex_4.ProducedBy (
    drug_ID INT foreign key references class_4_ex_4.Drug(ID) not null,
    company_ID INT foreign key references class_4_ex_4.DrugCompany(ID) not null,
    primary key(drug_ID, company_ID)
);
GO
;
create table class_4_ex_4.Patient (
    ID INT identity(1, 1) primary key not null,
    patient_name varchar(256) not null,
    birthdate DATE not null,
    patient_address varchar(256) not null
);
GO
;
create table class_4_ex_4.Pharmacy(
    nif INT primary key not null,
    pharmacy_name varchar(256) not null,
    phone INT not null,
    pharmacy_address varchar(256) not null
);
GO
;

create table class_4_ex_4.Doctor (

    ID INT identity(1, 1) primary key not null,
    formation varchar(256) not null,
    doctor_name varchar(256) not null,
);
GO
;

create table class_4_ex_4.Perscription (
    ID INT identity(1, 1) primary key not null,
    original_timestamp INT not null,
    processed_timestamp INT not null,
    patient_ID INT foreign key references class_4_ex_4.Patient(ID) not null,
    pharmacy_nif INT foreign key references class_4_ex_4.Pharmacy(nif)  not null,
    doctor_ID INT foreign key references class_4_ex_4.Doctor (ID)  not null
);
GO
;

create table class_4_ex_4.[Contains] (
    drug_ID INT foreign key references class_4_ex_4.Drug(ID) not null,
    perscription_ID INT foreign key references class_4_ex_4.Perscription(ID) not null,
    primary key(drug_ID, perscription_ID)
);
GO
;
create table class_4_ex_4.SoldBy (
    drug_ID INT foreign key references class_4_ex_4.Drug(ID) not null,
    pharmacy_nif INT foreign key references class_4_ex_4.Pharmacy(nif) not null,
    primary key(drug_ID, pharmacy_nif)
);

GO
;
create table class_4_ex_4.SellsTo (
    pharmacy_nif INT foreign key references class_4_ex_4.Pharmacy(nif) not null,
	patient_ID INT foreign key references class_4_ex_4.Patient(ID) not null,
    primary key(patient_ID, pharmacy_nif)
)
