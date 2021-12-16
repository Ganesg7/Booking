create table users(
	userid NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1,
    name  varchar2(25) not null,
    username varchar2(15) not null unique,
    role  varchar2(10) default 'user',
    password varchar2(15) not null,
    email varchar2(30) not null unique,
    phoneNumber number(10) not null UNIQUE,
    primary key(userid)
);

select * from users;

create table match_info(
match_id  int primary key,
sportsId int not null,
stadium_name varchar2(30) not null,
location varchar2(50) not null,
match_date date not null,
teamA varchar2(15) not null,
teamB varchar2(15) not null,
teamAlogo BLOB  ,
teamBlogo BLOB  ,
totalseats int not null,
availableSeats int not null,
firstClass_Seats_price int not null,
secondClass_seats_price int null,
FOREIGN KEY(sportsId) REFERENCES sports_info(sportsId)
);

CREATE SEQUENCE match_id
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 1000;

create table sports_info(
sportsId int primary key,
sportsName varchar2(50) not null,
eventName varchar2(40) not null
);

create table seat_booking(
ticketId int primary key,
userid int not null,
ticket_numbers varchar(100) not null,
match_id   int not null,
sportsId int not null,
seatclass varchar(15) not null,
Totalpirce int not null,
seatcount int not null,
FOREIGN KEY(userid) REFERENCES users(userid),
FOREIGN KEY(match_id) REFERENCES match_info(match_id),
FOREIGN KEY(sportsId) REFERENCES sports_info(sportsId)
);

create table wallete(
walleteId int primary key ,
userId int not null,
amount number(10),
FOREIGN KEY(userid) REFERENCES users(userid)
);


create table Betting(
betId int primary key,
betAmount not null,
matchId int not null,
userId int not null,
sportsId int not null,
FOREIGN KEY(userid) REFERENCES users(userid),
FOREIGN KEY(match_id) REFERENCES match_info(match_id),
FOREIGN KEY(sportsId) REFERENCES sports_info(sportsId)
);