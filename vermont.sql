CREATE DATABASE Vermont;
USE Vermont;


CREATE TABLE activities (
    activity_id INT PRIMARY KEY,
    activity_name VARCHAR(40),
    activity_desc VARCHAR(40)
);

CREATE TABLE bunkhouses (
    bunkhouse_id INT PRIMARY KEY,
    capacity INT,
);

CREATE TABLE counselors (
    counselor_id INT PRIMARY KEY,
    counselor_name VARCHAR(40),
    bunkhouse_id INT,
    FOREIGN KEY (bunkhouse_id) REFERENCES bunkhouses(bunkhouse_id),
    activity_id INT, -- Adding activity_id for activity supervision
    FOREIGN KEY (activity_id) REFERENCES activities(activity_id)
);

CREATE TABLE campers (
    camper_id INT PRIMARY KEY,
    camper_name VARCHAR(20),
    reg_date DATE,
    payment VARCHAR(30),
    bunkhouse_id INT,
    FOREIGN KEY (bunkhouse_id) REFERENCES bunkhouses(bunkhouse_id),
    activity_id INT, -- Adding activity_id for activities done
    FOREIGN KEY (activity_id) REFERENCES activities(activity_id)
);

INSERT INTO activities (activity_id, activity_name, activity_desc) VALUES
(1, 'swimming', 'training how to swim'),
(2, 'movies', 'watching');