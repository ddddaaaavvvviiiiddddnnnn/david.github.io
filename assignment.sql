create database football;
use football;

create table leagues(
league_code int primary key,
league_country varchar (30),
league_name varchar (30)
);
INSERT INTO leagues (league_id, league_name, league_country) VALUES
(1, 'premier league', 'England'),
(2, 'budensliga', 'Germany'),
(3, 'serie-a', 'Italy'), 
(4, 'la liga', 'Spain'),
(5, 'kenya premier league', 'Kenya'),
(6, 'saudi league', 'Saudi Arabia'),
(7, 'turkish league', 'Turkey'),
(8, 'msl', 'USA'),
(9, 'chinese league', 'China'),
(11, '', 'France'),
(10, 'thai league', 'Thailand');

create table sub_leagues(
sud_id int primary key,
sub_name varchar (20),
league_id int foreign key
);
insert into (sud_id, sub_name, league_id) values
(01, 'wsl', 1),
(02, 'championship', 1),
(03, 'serie b', 3),
(04, 'emirates cup', 1),
(05, 'fa cup', 1),
