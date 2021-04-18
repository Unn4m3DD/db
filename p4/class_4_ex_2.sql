create schema class_4_ex_2
GO
;
create table class_4_ex_2.AirplaneType(
    [type_name] VARCHAR(256) primary key not null,
    company VARCHAR(id) not null,
    max_seats INT not null
)
GO
;
create table class_4_ex_2.Airport(
    id INT identity(1, 1) primary key not null,
    city VARCHAR(256) not null,
    aiport_state VARCHAR(256) not null,
    aiport_name VARCHAR(256) not null
)
GO
;
create table class_4_ex_2.Airplane(
    id INT identity(1, 1) primary key not null,
    [type] VARCHAR(256) foreign key references class_4_ex_2.AirplaneType([type_name]) not null,
    total_seats INT not null
)
GO
;

create table class_4_ex_2.Flight(
    id INT identity(1, 1) primary key not null,
    airline VARCHAR(256) not null,
    weekdays VARCHAR(256) not null
)
GO
;
create table class_4_ex_2.FlightLeg(
    leg_id INT identity(1, 1) not null,
    flight_id INT foreign key references class_4_ex_2.Flight(id) not null,
    departure_airport_id INT foreign key references class_4_ex_2.Airport(id) not null,
    arrival_airport_id INT foreign key references class_4_ex_2.Airport(id) not null,
    departure_time INT not null,
    arrival_time INT not null,
    primary key(leg_id, flight_id)
)
GO
;
create table class_4_ex_2.LegInstance(
    flight_id INT,
    leg_id INT,
    leg_date DATE not null,
    available_seats INT not null,
    airplane_id INT foreign key references class_4_ex_2.Airplane(id) not null,
    departure_airport_id INT foreign key references class_4_ex_2.Airport(id) not null,
    arrival_airport_id INT foreign key references class_4_ex_2.Airport(id) not null,
    departure_time INT not null,
    arrival_time INT not null,
    foreign key (flight_id, leg_id) references class_4_ex_2.FlightLeg(flight_id, leg_id),
    primary key(flight_id, leg_id, leg_date)
)
GO
;
create table class_4_ex_2.Seat(
    seat_id INT identity(1, 1) primary key,
    flight_id INT,
    leg_id INT,
    leg_date DATE,
    costumer_name VARCHAR(256),
    costumer_phone CHAR(14),
    foreign key(flight_id, leg_id, leg_date) references class_4_ex_2.LegInstance(flight_id, leg_id, leg_date),
    primary key(flight_id, leg_id, leg_date, seat_id)
)
GO
;
create table class_4_ex_2.Fare(
    id INT identity(1, 1) not null,
    amount INT not null,
    restrictions VARCHAR(256) not null,
    flight_id INT  foreign key references class_4_ex_2.Flight(id) not null,
    primary key(id, flight_id)
)
GO
;
create table class_4_ex_2.CanLand(
    airport_id INT foreign key references class_4_ex_2.Airport(id) not null,
    airplane_id INT foreign key references class_4_ex_2.Airplane(id) not null,
    primary key(airport_id, airplane_id)
)
GO
;