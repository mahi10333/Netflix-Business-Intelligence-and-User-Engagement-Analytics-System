--Inserting content

INSERT INTO contentsinformation VALUES
(1,'Stranger Things','Series','Sci-Fi',2016,50),
(2,'Money Heist','Series','Crime',2017,45),
(3,'Breaking Bad','Series','Crime',2008,47),
(4,'The Witcher','Series','Fantasy',2019,55),
(5,'Dark','Series','Sci-Fi',2017,53),
(6,'Interstellar','Movie','Sci-Fi',2014,169),
(7,'Inception','Movie','Sci-Fi',2010,148),
(8,'The Irishman','Movie','Crime',2019,209),
(9,'Extraction','Movie','Action',2020,117),
(10,'The Crown','Series','Drama',2016,58),
(11,'Narcos','Series','Crime',2015,49),
(12,'Lucifer','Series','Fantasy',2016,42),
(13,'Wednesday','Series','Fantasy',2022,48),
(14,'Bird Box','Movie','Thriller',2018,124),
(15,'The Adam Project','Movie','Sci-Fi',2022,106);


--Inserting ratings

INSERT INTO ratinginformation VALUES
(1,1,8.7,9.1),
(2,2,8.2,8.9),
(3,3,9.5,9.7),
(4,4,8.0,8.3),
(5,5,8.8,9.0),
(6,6,8.6,9.2),
(7,7,8.8,9.3),
(8,8,7.9,8.1),
(9,9,6.9,7.5),
(10,10,8.6,8.9),
(11,11,8.8,9.0),
(12,12,8.1,8.5),
(13,13,8.0,8.7),
(14,14,6.6,7.1),
(15,15,6.7,7.4);


--Inserting users

INSERT INTO usersinformation VALUES
(101,'Aarav','India','Premium', 799),
(102,'Riya','India','Basic', 199),
(103,'Kabir','USA','Premium', 799),
(104,'Emma','UK','Standard', 499),
(105,'Noah','Canada','Premium', 799),
(106,'Sophia','Germany','Basic', 199),
(107,'Liam','Australia','Standard', 499),
(108,'Olivia','India','Premium', 799),
(109,'Ethan','USA','Basic', 199),
(110,'Mia','France','Standard', 499);


--Inserting watch history

INSERT INTO watchhistoriesinformation VALUES
(1,101,1,'2026-01-05',120),
(2,101,6,'2026-01-07',169),
(3,102,2,'2026-01-10',90),
(4,103,3,'2026-01-11',141),
(5,104,4,'2026-01-12',110),
(6,105,7,'2026-01-13',148),
(7,106,5,'2026-01-14',106),
(8,107,8,'2026-01-15',209),
(9,108,10,'2026-01-16',116),
(10,109,11,'2026-01-17',98),
(11,110,12,'2026-01-18',84),
(12,101,13,'2026-01-19',96),
(13,102,14,'2026-01-20',124),
(14,103,15,'2026-01-21',106),
(15,104,1,'2026-01-22',150),
(16,105,3,'2026-01-23',141),
(17,106,6,'2026-01-24',169),
(18,107,7,'2026-01-25',148),
(19,108,5,'2026-01-26',159),
(20,109,2,'2026-01-27',135);


--Inserting subscriptions

INSERT INTO subscriptioninformation VALUES
(1,101,'Premium',799,'2026-01-05'),
(2,102,'Basic',199,'2026-01-06'),
(3,103,'Premium',799,'2026-01-07'),
(4,104,'Standard',499,'2026-01-08'),
(5,105,'Premium',799,'2026-01-09'),
(6,106,'Basic',199,'2026-01-10'),
(7,107,'Standard',499,'2026-01-11'),
(8,108,'Premium',799,'2026-01-12'),
(9,109,'Basic',199,'2026-01-13'),
(10,110,'Standard',499,'2026-01-14'),
(11,101,'Premium',799,'2026-02-05'),
(12,103,'Premium',799,'2026-02-07'),
(13,105,'Premium',799,'2026-02-09'),
(14,108,'Premium',799,'2026-02-12'),
(15,104,'Standard',499,'2026-02-08'),
(16,107,'Standard',499,'2026-02-11'),
(17,110,'Standard',499,'2026-02-14'),
(18,102,'Basic',199,'2026-02-06'),
(19,106,'Basic',199,'2026-02-10'),
(20,109,'Basic',199,'2026-02-13');


--Inserting directors

INSERT INTO directorinformation VALUES
(1,1,'The Duffer Brothers','USA'),
(2,2,'Alex Pina','Spain'),
(3,3,'Vince Gilligan','USA'),
(4,4,'Lauren Schmidt Hissrich','USA'),
(5,5,'Baran bo Odar','Germany'),
(6,6,'Christopher Nolan','UK'),
(7,7,'Christopher Nolan','UK'),
(8,8,'Martin Scorsese','USA'),
(9,9,'Sam Hargrave','USA'),
(10,10,'Peter Morgan','UK'),
(11,11,'Carlo Bernard','USA'),
(12,12,'Tom Kapinos','USA'),
(13,13,'Tim Burton','USA'),
(14,14,'Susanne Bier','Denmark'),
(15,15,'Shawn Levy','Canada');
