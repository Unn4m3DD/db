create schema class_4_ex_2
GO
;
create table class_4_ex_2.AirplaneType(
    [type_name] VARCHAR(256) primary key not null,
    company VARCHAR(256) not null,
    max_seats INT not null
)
GO
;
create table class_4_ex_2.Airport(
    ID INT identity(1, 1) primary key not null,
    city VARCHAR(256) not null,
    state VARCHAR(256) not null,
    name VARCHAR(256) not null
)
GO
;
create table class_4_ex_2.Airplane(
    ID INT identity(1, 1) primary key not null,
    [type] VARCHAR(256) foreign key references class_4_ex_2.AirplaneType([type_name]) not null,
    total_seats INT not null
)
GO
;

create table class_4_ex_2.Flight(
    ID INT identity(1, 1) primary key not null,
    airline VARCHAR(256) not null,
    weekdays VARCHAR(256) not null
)
GO
;
create table class_4_ex_2.FlightLeg(
    ID INT identity(1, 1) not null,
    flight_ID INT foreign key references class_4_ex_2.Flight(ID) not null,
    departure_airport_ID INT foreign key references class_4_ex_2.Airport(ID) not null,
    arrival_airport_ID INT foreign key references class_4_ex_2.Airport(ID) not null,
    departure_time INT not null,
    arrival_time INT not null,
    primary key(ID, flight_ID)
)
GO
;
create table class_4_ex_2.LegInstance(
    flight_ID INT,
    leg_ID INT,
    leg_date DATE not null,
    available_seats INT not null,
    airplane_ID INT foreign key references class_4_ex_2.Airplane(ID) not null,
    departure_airport_ID INT foreign key references class_4_ex_2.Airport(ID) not null,
    arrival_airport_ID INT foreign key references class_4_ex_2.Airport(ID) not null,
    departure_time INT not null,
    arrival_time INT not null,
    foreign key (flight_ID, leg_ID) references class_4_ex_2.FlightLeg(flight_ID, leg_ID),
    primary key(flight_ID, leg_ID, leg_date)
)
GO
;
create table class_4_ex_2.Seat(
    seat_ID INT identity(1, 1) primary key,
    flight_ID INT,
    leg_ID INT,
    leg_date DATE,
    costumer_name VARCHAR(256),
    costumer_phone CHAR(14),
    foreign key(flight_ID, leg_ID, leg_date) references class_4_ex_2.LegInstance(flight_ID, leg_ID, leg_date),
    primary key(flight_ID, leg_ID, leg_date, seat_ID)
)
GO
;
create table class_4_ex_2.Fare(
    ID INT identity(1, 1) not null,
    amount INT not null,
    restrictions VARCHAR(256) not null,
    flight_ID INT  foreign key references class_4_ex_2.Flight(ID) not null,
    primary key(ID, flight_ID)
)
GO
;
create table class_4_ex_2.CanLand(
    airport_ID INT foreign key references class_4_ex_2.Airport(ID) not null,
    airplane_ID INT foreign key references class_4_ex_2.Airplane(ID) not null,
    primary key(airport_ID, airplane_ID)
)
GO
;