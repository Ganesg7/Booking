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
desc users;

create table match_info(
match_id    NUMBER GENERATED ALWAYS AS IDENTITY START WITH 100,
sportsId int not null,
stadium_name varchar2(30) not null,
location varchar2(50) not null,
match_date date not null,
teamA varchar2(15) not null,
teamB varchar2(15) not null,
teamAlogo varchar(1000)  ,
teamBlogo varchar2(1000)  ,
totalseats int not null,
availableSeats int not null,
firstClass_Seats_price int not null,
secondClass_seats_price int null,
primary key(match_id),
FOREIGN KEY(sportsId) REFERENCES sports_info(sportsId)
);
select * from match_info;
insert into match_info;
select to_char(match_date,'yyyy/mm/dd')  "date" from match_info where to_char(match_date,'mm')=12;
drop table match_info;

CREATE SEQUENCE match_id
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 1000;
select * from match_info;
create table sports_info(
sportsId int primary key,
sportsName varchar2(50) not null,
eventName varchar2(40) not null
);

drop table sports_info;

insert into sports_info(sportsid,sportsName,eventName) values(101,'Cricket','ICC World Cup'); 
CREATE SEQUENCE sportsId
MINVALUE 10
START WITH 10
INCREMENT BY 10
CACHE 1000;
select * from sports_info;

--seat detalis
create table seat_details(
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
drop table seat_details;
 
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