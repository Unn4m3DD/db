create schema class_4_ex_4;

create table class_4_ex_4.Drug(
    ID primary key identity(1,1) not null,
    formula string not null,
    comercial_name string not null
);

create table class_4_ex_4.DrugCompany(
    ID primary key identity(1,1) not null,
    company_name string not null,
    company_address string not null,
    phone INT not null
);

create table class_4_ex_4.ProducedBy(
    drug_ID primary key foreign key references class4_ex_4.Drug(ID) INT not null,
    company_ID primary key foreign key references class4_ex_4.Drug(ID) INT not null
);

create table class_4_ex_4.Perscription(
    ID primary key identity(1,1) not null,
    original_timestamp INT not null,
    processed_timestamp INT not null,
    patient_ID string foreign key references class4_ex_4.Patient(ID) not null,
    pharmacy_nif foreign key references class4_ex_4.Pharmacy(nif) INT not null
    doctor_ID foreign key references class4_ex_4.Doctor(ID) INT not null
);

create table class_4_ex_4.Doctor(
    ID primary key identity(1,1) not null,
    formation string not null,
    doctor_name string not null,
);


create table class_4_ex_4.Contains(
    drug_ID primary key foreign key references class4_ex_4.Drug(ID) INT not null,
    perscription_ID primary key foreign key references class4_ex_4.perscription(ID) string not null
);

create table class_4_ex_4.SellsTo(
    pharmacy_nif primary key foreign key references class4_ex_4.Pharmacy(nif) INT not null,
    patient_ID primary key foreign key references class4_ex_4.Patient(ID) identity(1,1) not null
);

create table class_4_ex_4.SellsTo(
    pharmacy_nif primary key foreign key references class4_ex_4.Pharmacy(nif) INT not null,
    drug_ID primary key foreign key references class4_ex_4.Drug(ID) INT not null
);

create table class_4_ex_4.Patient(
    ID primary key identity(1,1) not null,
    patient_name string not null,
    birthdate DATE not null,
    patient_address string not null
);

create table class_4_ex_4.Pharmacy(
    nif primary key INT not null,
    pharmacy_name string not null,
    phone INT not null,
    pharmacy_address string not null
);


