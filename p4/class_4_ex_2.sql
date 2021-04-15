create schema class_4_ex_2;

create table class_4_ex_2.Airport(
    ID primary key INT,
    city string not null,
    state string not null,
    name string not null
);
create table class_4_ex_2.Airplane(
    ID primary key INT,
    type foreign key references class_4_ex_2.AirplaneType string not null,
    total_seats INT not null
);

create table class_4_ex_2.AirplaneType(
    type_name primary key string,
    company string not null,
    max_seats INT not null
);

create table class_4_ex_2.FlightLeg(
    ID primary key INT,
    flight_ID primary key foreign references class_4_ex_2.Flight key INT,
    departure_airport_ID INT foreign key references class_4_ex_2.Airport not null,
    arrival_airport_ID INT foreign key references class_4_ex_2.Airport not null,
    departure_time INT not null,
    arrival_time INT not null
);

create table class_4_ex_2.LegInstance(
    flight_ID primary key foreign references class4_ex_2.FlightLeg key INT,
    leg_ID primary key foreign key references class4_ex_2.FlightLeg INT,
    leg_date primary key DATE,
    available_seats INT not null,
    airplane_ID foreign key INT not null,
    departure_airport_ID INT foreign key references class4_ex_2.Airport not null,
    arrival_airport_ID INT foreign key references class4_ex_2.Airport not null,
    departure_time INT not null,
    arrival_time INT not null
);

create table class_4_ex_2.Seat(
    seat_ID primary key INT,
    flight_ID primary key foreign key references class4_ex_2.LegInstance INT,
    leg_ID primary key foreign key references class4_ex_2.LegInstance INT,
    leg_date primary key foreign key references class4_ex_2.LegInstance DATE,
);

create table class_4_ex_2.Fare(
    ID primary key INT,
    flight_ID primary key foreign key references class4_ex_2.Flight INT,
    amount INT not null,
    restrictions string not null,
);

create table class_4_ex_2.Flight(
    ID primary key INT,
    airline string not null,
    weekdays string not null
);

create table class_4_ex_2.CanLand(
    airport_ID primary key foreign key references class4_ex_2.Airport INT,
    airplane_ID primary key foreign key references class4_ex_2.Airport INT
);