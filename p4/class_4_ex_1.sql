create schema class_4_ex_1

create table class_4_ex_1.Client(
  nif CHAR(9) primary key,
  name VARCHAR(30) not null,
  address VARCHAR(50) not null,
  license_number CHAR(9) not null,
);

create table class_4_ex_1.Counter(
  id INT primary key,
  name VARCHAR(30) not null,
  address VARCHAR(50) not null
);

create table class_4_ex_1.VehicleType(
  code INT primary key,
  designation VARCHAR(30) not null,
  ac BIT not null
);

create table class_4_ex_1.Vehicle(
  plate CHAR(6) primary key,
  year INT not null,
  brand VARCHAR(30) not null,
  type_code INT not null foreign key references class_4_ex_1.VehicleType(code)
);

create table class_4_ex_1.Rental(
  id INT primary key,
  duration INT not null,
  date DATE not null,
  client_nif CHAR(9) not null foreign key references class_4_ex_1.Client(nif),
  counter_id INT not null foreign key references class_4_ex_1.Counter(id),
  vehicle_plate CHAR(6) not null foreign key references class_4_ex_1.Vehicle(plate),
);

create table class_4_ex_1.Similarity(
  code_a INT not null foreign key references class_4_ex_1.VehicleType(code),
  code_b INT not null foreign key references class_4_ex_1.VehicleType(code),
  primary key (code_a, code_b),
);

create table class_4_ex_1.LightVehicle(
  code INT primary key foreign key references class_4_ex_1.VehicleType(code),
  seat_count INT not null,
  door_count INT not null, 
  fuel_type char not null CHECK (fuel_type IN('l'/*eaded*/, 'u'/*nleaded*/))
);
create table class_4_ex_1.HeavyVehicle(
  code INT not null primary key foreign key references class_4_ex_1.VehicleType(code),
  weight INT not null,
  passanger_count INT not null
);