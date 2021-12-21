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
match_id    NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1,
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
select  round(to_date(to_char(match_date,'yyyy-mm-dd'), 'yyyy-mm-dd')- sysdate) as matchDate  from match_info;

select stadium_name,location, round(to_date(to_char(match_date,'yyyy-mm-dd'), 'yyyy-mm-dd')- sysdate) as "date",teamA,teamB,teamAlogo,teamBlogo from match_info;
drop table match_info;

CREATE SEQUENCE match_id
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 1000;
drop sequence match_id;
select * from match_info;
create table sports_info(
sportsId  NUMBER GENERATED ALWAYS AS IDENTITY START WITH 100 ,
sportsName varchar2(50) not null,
eventName varchar2(40) not null,
primary key(sportsId)
);

drop table sports_info;
commit;
insert into sports_info(sportsName,eventName) values('Cricket','ICC World Cup'); 
CREATE SEQUENCE sportsId
MINVALUE 10
START WITH 10
INCREMENT BY 10
CACHE 1000;
select * from sports_info;

select FindSportsId(Sportsname,eventname) as SporstId from sports_info;

select FindSportsId('Cricket','IPL') as SporstId from sports_info ;


Exec function 
---------------------------------
CREATE OR REPLACE Function FindSportsId
   ( sports_Name IN sports_info.sportsName%type,
  event_Name IN sports_info.eventName%type )
   RETURN number
IS
   sports_Id number;
   cursor spId is
   SELECT sportsId
     FROM sports_info
     WHERE sportsName = sports_Name and eventName=event_Name;
BEGIN
   open spId;
   fetch spId into sports_Id;
   close spId;
RETURN sports_Id;
END;
/
---------------------------


CREATE OR REPLACE FUNCTION get_sportsId(
    sports_name in sports_info.sportsname%type;
    event_name in sports_info.eventname%type;
) 
RETURN NUMBER
IS
    sports_id NUMBER := 0;
BEGIN
    
    SELECT sportsid
    INTO sports_id
    FROM sports_info 
    WHERE sportsname = sports_name and eventname=event_name;
    RETURN sports_id ;
END;
/


Exec function get_sportsId('Cricket','IPL');
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

commit;
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