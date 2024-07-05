CREATE DATABASE bus;
USE bus;

CREATE TABLE guides(
guide_id INT PRIMARY KEY,
guide_name VARCHAR (20),
guide_phone VARCHAR (20),
guide_email VARCHAR (20)
);

CREATE TABLE tours(
tour_id INT PRIMARY KEY,
tour_name VARCHAR (30),
tour_desc VARCHAR (30),
guide_id INT,
FOREIGN KEY (guide_id) REFERENCES guides(guide_id)
);

CREATE TABLE customers (
cous_id INT PRIMARY KEY,
cous_name VARCHAR (20),
cous_email VARCHAR (20),
cous_phone VARCHAR (20)
);

CREATE TABLE reservations (
res_id INT PRIMARY KEY,
tour_id INT,
cous_id INT,
res_date DATE,
num_of_pple INT,
res_status VARCHAR (30),
FOREIGN KEY (cous_id) REFERENCES customers(cous_id),
FOREIGN KEY (tour_id) REFERENCES tours(tour_id)
);