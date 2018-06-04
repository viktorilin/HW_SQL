CREATE TABLE Hotels
(
  hotel_id int IDENTITY NOT NULL
  PRIMARY KEY,
  hotel_name varchar(20) NOT NULL,
  foundation_year int NOT NULL,
  adress varchar(50) NOT NULL,
  is_active bit NOT NULL
)



CREATE TABLE Users
(
  user_id int IDENTITY NOT NULL
  PRIMARY KEY,
  user_name varchar(20) NOT NULL,
  email varchar(20) NOT NULL
)

CREATE TABLE Rooms
(
  room_id int IDENTITY NOT NULL
  PRIMARY KEY,
  hotel_id int NOT NULL
  FOREIGN KEY REFERENCES Hotels(hotel_id),
  number int NOT NULL,
  price int NOT NULL,
  comfort_level int NOT NULL,
  capability int NOT NULL,
)


CREATE TABLE Reservations
(
  reservation_id int IDENTITY NOT NULL
  PRIMARY KEY,
  reservation_date DATE NOT NULL,
  reservation_performed_user_id int NOT NULL
  FOREIGN KEY REFERENCES Users(user_id),
  reserved_room_id int NOT NULL
  FOREIGN KEY REFERENCES Rooms(room_id),
  start_reservation_date DATE NOT NULL,
  end_reservation_date DATE NOT NULL
)
/*
DROP TABLE Users
DROP TABLE Rooms
DROP TABLE HOtels
DROP TABLE Reservations
*/

INSERT INTO Hotels VALUES ('Bukovina',1998,'Holovna street',1);
INSERT INTO Hotels VALUES ('Edelweiss',1998,'Karpaty street',1);
INSERT INTO Hotels VALUES ('Tyrist',2000,'Heroes of Maidan street',1);

SELECT * FROM Hotels;




UPDATE Hotels 
SET foundation_year = 1937
WHERE hotel_id = (SELECT TOP 1 hotel_id FROM Hotels);

DELETE FROM Hotels WHERE hotel_id = 3;

INSERT INTO Users VALUES ('Andrew','andrew@gmail.com');
INSERT INTO Users VALUES ('Anton','anton@gmail.com');
INSERT INTO Users VALUES ('Viktor','viktor@gmail.com');
INSERT INTO Users VALUES ('Vika','vika@gmail.com');
INSERT INTO Users VALUES ('Julia','julia@gmail.com');
INSERT INTO Users VALUES ('Max','max@gmail.com');
INSERT INTO Users VALUES ('Bohdan','bohdan@gmail.com');
INSERT INTO Users VALUES ('Alex','alex@gmail.com');
INSERT INTO Users VALUES ('Maria','maria@gmail.com');
INSERT INTO Users VALUES ('Olena','olena@gmail.com');



SELECT * FROM Users 
WHERE user_name LIKE 'A%';

INSERT INTO Rooms VALUES (1,101,100,1,2);
INSERT INTO Rooms VALUES (1,121,200,1,3);
INSERT INTO Rooms VALUES (1,231,300,1,4);
INSERT INTO Rooms VALUES (1,341,400,2,5);
INSERT INTO Rooms VALUES (1,131,500,2,2);
INSERT INTO Rooms VALUES (1,145,600,3,4);
INSERT INTO Rooms VALUES (1,170,700,3,6);
INSERT INTO Rooms VALUES (2,280,300,1,2);
INSERT INTO Rooms VALUES (2,301,400,2,4);
INSERT INTO Rooms VALUES (2,125,500,2,3);

SELECT * FROM Rooms ORDER BY price;

SELECT number,price,comfort_level,capability,hotel_name,foundation_year,adress, is_active
FROM Rooms
JOIN Hotels
ON Hotels.hotel_id = Rooms.hotel_id
WHERE hotel_name = 'Edelweiss'
ORDER BY price;

SELECT * FROM Hotels
JOIN Rooms
ON Hotels.hotel_id = Rooms.hotel_id
WHERE comfort_level = 3;


SELECT hotel_name,number FROM Hotels
JOIN Rooms
ON Hotels.hotel_id = Rooms.hotel_id
WHERE comfort_level = 1;


SELECT hotel_name,COUNT(room_id) AS rooms_count FROM Hotels
JOIN Rooms
ON Hotels.hotel_id = Rooms.hotel_id 
GROUP BY hotel_name;

INSERT INTO Reservations VALUES ('2018-05-01',1,1,'2018-05-27','2018-05-28');
INSERT INTO Reservations VALUES ('2018-05-02',2,2,'2018-06-28','2018-07-28');
INSERT INTO Reservations VALUES ('2018-05-03',3,3,'2018-05-30','2018-06-10');
INSERT INTO Reservations VALUES ('2018-05-04',4,4,'2018-06-01','2018-06-11');
INSERT INTO Reservations VALUES ('2018-05-05',5,5,'2018-06-02','2018-06-12');
INSERT INTO Reservations VALUES ('2018-05-06',6,6,'2018-06-03','2018-06-28');
INSERT INTO Reservations VALUES ('2018-05-07',7,7,'2018-07-05','2018-07-28');
INSERT INTO Reservations VALUES ('2018-05-08',8,8,'2018-07-10','2018-07-30');
INSERT INTO Reservations VALUES ('2018-05-09',9,9,'2018-07-24','2018-07-28');
INSERT INTO Reservations VALUES ('2018-07-10',10,10,'2018-07-25','2018-08-01');

SELECT Users.user_name, Rooms.number,start_reservation_date,end_reservation_date
 FROM Reservations
 JOIN Users
 ON Users.user_id = Reservations.reservation_performed_user_id
 JOIN Rooms
 ON Rooms.room_id = Reservations.reserved_room_id; 




 
