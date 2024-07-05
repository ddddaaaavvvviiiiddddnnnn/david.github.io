-- Create the database if it doesn't exist
CREATE DATABASE soccer;
USE soccer;

-- Teams table
CREATE TABLE teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    coach_name VARCHAR(100)
);

-- Players table
CREATE TABLE players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

-- Matches table
CREATE TABLE matches (
    match_id INT PRIMARY KEY,
    home_team_id INT,
    away_team_id INT,
    match_date DATE,
    home_team_goals INT,
    away_team_goals INT,
    FOREIGN KEY (home_team_id) REFERENCES teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES teams(team_id)
);

-- Standings table
CREATE TABLE standings (
    standing_id INT PRIMARY KEY,
    team_id INT,
    season INT,
    points INT,
    wins INT,
    draws INT,
    losses INT,
    goals_for INT,
    goals_against INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

-- Insert sample data into teams table
INSERT INTO teams (team_name, city, coach_name) VALUES
('Team A', 'City A', 'Coach A'),
('Team B', 'City B', 'Coach B'),
('Team C', 'City C', 'Coach C'),
('Team D', 'City D', 'Coach D'),
('Team E', 'City E', 'Coach E');

-- Insert sample data into players table
INSERT INTO players (player_name, team_id) VALUES
('Player 1', 1),
('Player 2', 1),
('Player 3', 2),
('Player 4', 2),
('Player 5', 3);

-- Insert sample data into matches table
INSERT INTO matches (home_team_id, away_team_id, match_date, home_team_goals, away_team_goals) VALUES
(1, 2, '2023-01-01', 2, 1),
(2, 3, '2023-01-05', 0, 0),
(3, 1, '2023-01-10', 1, 2),
(4, 3, '2023-01-15', 3, 1),
(5, 2, '2023-01-20', 1, 1);

-- Insert sample data into standings table
INSERT INTO standings (team_id, season, points, wins, draws, losses, goals_for, goals_against) VALUES
(1, 2023, 6, 2, 0, 1, 5, 4),
(2, 2023, 4, 1, 1, 1, 2, 2),
(3, 2023, 1, 0, 1, 2, 1, 3);
