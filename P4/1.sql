create schema class_4_ex_1

create table class_4_ex_1.Client(
  NIF CHAR(9) primary key,
  name VARCHAR(30),
  address VARCHAR(50),
  license_number CHAR(9),
);

create table class_4_ex_1.Counter(
  ID INT primary key,
  name VARCHAR(30),
  address VARCHAR(50)
);

create table class_4_ex_1.VehicleType(
  code INT primary key,
  designation VARCHAR(30),
  ac BIT
);

create table class_4_ex_1.Vehicle(
  plate CHAR(6) primary key,
  year INT,
  brand VARCHAR(30),
  type_code INT foreign key references class_4_ex_1.VehicleType(code)
);

create table class_4_ex_1.Rental(
  ID INT primary key,
  duration INT,
  date DATE,
  client_nif CHAR(9) foreign key references class_4_ex_1.Client(NIF),
  counter_id INT foreign key references class_4_ex_1.Counter(ID),
  vehicle_plate CHAR(6) foreign key references class_4_ex_1.Vehicle(plate),
);

create table class_4_ex_1.Similarity(
  code_a INT foreign key references class_4_ex_1.VehicleType(code),
  code_b INT foreign key references class_4_ex_1.VehicleType(code),
  primary key (code_a, code_b),
);

create table class_4_ex_1.LightVehicle(
  code INT primary key foreign key references class_4_ex_1.VehicleType(code),
  seat_count INT,
  door_count INT, 
  fuel_type char CHECK (fuel_type IN('l'/*eaded*/, 'u'/*nleaded*/))
);
create table class_4_ex_1.HeavyVehicle(
  code INT primary key foreign key references class_4_ex_1.VehicleType(code),
  weight INT,
  passanger_count INT
);