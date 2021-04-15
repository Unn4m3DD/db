create schema class_4_ex_2;

create table class_4_ex_2.Airport(
    ID primary key identity(1,1) not null,
    city string not null,
    state string not null,
    name string not null
);
create table class_4_ex_2.Airplane(
    ID primary key identity(1,1) not null,
    type foreign key references class_4_ex_2.AirplaneType(tyoe_name) string not null,
    total_seats INT not null
);

create table class_4_ex_2.AirplaneType(
    type_name primary key string not null,
    company string not null,
    max_seats INT not null
);

create table class_4_ex_2.FlightLeg(
    ID primary key identity(1,1) not null,
    flight_ID primary key foreign key references class_4_ex_2.Flight(ID) INT not null,
    departure_airport_ID foreign key references class_4_ex_2.Airport(ID) not null,
    arrival_airport_ID foreign key references class_4_ex_2.Airport(ID) INT not null,
    departure_time INT not null,
    arrival_time INT not null
);

create table class_4_ex_2.LegInstance(
    flight_ID primary key foreign key references class4_ex_2.FlightLeg(flight_ID) INT not null,
    leg_ID primary key foreign key references class4_ex_2.FlightLeg(ID) INT not null,
    leg_date primary key DATE not null,
    available_seats INT not null,
    airplane_ID foreign key INT not null,
    departure_airport_ID foreign key references class4_ex_2.Airport(ID) INT not null,
    arrival_airport_ID foreign key references class4_ex_2.Airport(ID) INT not null,
    departure_time INT not null,
    arrival_time INT not null
);

create table class_4_ex_2.Seat(
    seat_ID primary key identity(1,1),
    flight_ID primary key foreign key references class4_ex_2.LegInstance(flight_ID) INT not null,
    leg_ID primary key foreign key references class4_ex_2.LegInstance(ID) INT not null,
    leg_date primary key foreign key references class4_ex_2.LegInstance(leg_date) DATE not null,
);

create table class_4_ex_2.Fare(
    ID primary key identity(1,1) not null,
    flight_ID primary key foreign key references class4_ex_2.Flight(ID) INT not null,
    amount INT not null,
    restrictions string not null,
);

create table class_4_ex_2.Flight(
    ID primary key identity(1,1) not null,
    airline string not null not null,
    weekdays string not null not null
);

create table class_4_ex_2.CanLand(
    airport_ID primary key foreign key references class4_ex_2.Airport(ID) INT not null,
    airplane_ID primary key foreign key references class4_ex_2.Airport(ID) INT not null
);