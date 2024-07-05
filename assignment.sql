-- Connect to your SQL Server instance using a sysadmin account
-- Grant CREATE DATABASE permission to a specific login
USE master;
GO
GRANT CREATE ANY DATABASE TO [YourLoginName];
GO

-- Check if the user has CREATE DATABASE permission
SELECT princ.name, perm.permission_name, perm.state_desc
FROM sys.server_permissions perm
JOIN sys.server_principals princ
ON perm.grantee_principal_id = princ.principal_id
WHERE perm.permission_name = 'CREATE ANY DATABASE'
AND princ.name = 'YourLoginName';

-- Create a new database
CREATE DATABASE football;
USE football;

-- Teams Table
CREATE TABLE Teams (
    TeamID INT PRIMARY KEY IDENTITY(1,1),
    TeamName VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    Stadium VARCHAR(50)
);

-- Players Table
CREATE TABLE Players (
    PlayerID INT PRIMARY KEY IDENTITY(1,1),
    PlayerName VARCHAR(50) NOT NULL,
    TeamID INT,
    Position VARCHAR(20),
    Age INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

-- Matches Table
CREATE TABLE Matches (
    MatchID INT PRIMARY KEY IDENTITY(1,1),
    HomeTeamID INT,
    AwayTeamID INT,
    MatchDate DATE,
    FOREIGN KEY (HomeTeamID) REFERENCES Teams(TeamID),
    FOREIGN KEY (AwayTeamID) REFERENCES Teams(TeamID)
);

-- Goals Table
CREATE TABLE Goals (
    GoalID INT PRIMARY
    KEY IDENTITY(1,1),
    MatchID INT,
    PlayerID INT,
    GoalTime TIME,
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);

-- Coaches Table
CREATE TABLE Coaches (
    CoachID INT PRIMARY KEY IDENTITY(1,1),
    CoachName VARCHAR(50) NOT NULL,
    TeamID INT,
    ExperienceYears INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

-- Inserting Records into Teams
INSERT INTO Teams (TeamName, City, Stadium) VALUES 
('Manchester United', 'Manchester', 'Old Trafford'),
('Liverpool', 'Liverpool', 'Anfield'),
('Chelsea', 'London', 'Stamford Bridge'),
('Arsenal', 'London', 'Emirates Stadium'),
('Manchester City', 'Manchester', 'Etihad Stadium'),
('Tottenham', 'London', 'Tottenham Stadium');

-- Inserting Records into Players
INSERT INTO Players (PlayerName, TeamID, Position, Age) VALUES 
('David de Gea', 1, 'Goalkeeper', 30),
('Harry Maguire', 1, 'Defender', 28),
('Paul Pogba', 1, 'Midfielder', 27),
('Bruno Fernandes', 1, 'Midfielder', 26),
('Marcus Rashford', 1, 'Forward', 23),
('Alisson Becker', 2, 'Goalkeeper', 28),
('Virgil van Dijk', 2, 'Defender', 29),
('Thiago Alcantara', 2, 'Midfielder', 29),
('Mohamed Salah', 2, 'Forward', 28),
('Sadio Mane', 2, 'Forward', 28);

-- Inserting Records into Matches
INSERT INTO Matches (HomeTeamID, AwayTeamID, MatchDate) VALUES 
(1, 2, '2024-05-01'),
(3, 4, '2024-05-02'),
(2, 5, '2024-05-03'),
(5, 1, '2024-05-04'),
(4, 3, '2024-05-05');

-- Inserting Records into Goals
INSERT INTO Goals (MatchID, PlayerID, GoalTime) VALUES 
(1, 5, '15:23:00'),
(1, 9, '45:12:00'),
(2, 20, '30:45:00'),
(2, 14, '60:10:00'),
(3, 9, '25:30:00'),
(3, 10, '55:15:00'),
(4, 17, '40:20:00'),
(4, 1, '75:00:00'),
(5, 14, '20:45:00'),
(5, 15, '50:20:00');

-- Inserting Records into Coaches
INSERT INTO Coaches (CoachName, TeamID, ExperienceYears) VALUES 
('Ole Gunnar Solskjaer', 1, 10),
('Jurgen Klopp', 2, 20),
('Thomas Tuchel', 3, 15),
('Mikel Arteta', 4, 5),
('Pep Guardiola', 5, 25);

-- Retrieve all teams and their coaches
SELECT Teams.TeamName, Coaches.CoachName
FROM Teams
JOIN Coaches ON Teams.TeamID = Coaches.TeamID;

-- Retrieve all players and their teams

SELECT Players.PlayerName, Teams.TeamName
FROM Players
JOIN Teams ON Players.TeamID = Teams.TeamID;

-- Retrieve all matches and their participating teams
SELECT m.MatchID, t1.TeamName AS HomeTeam, t2.TeamName AS AwayTeam, m.MatchDate
FROM Matches m
JOIN Teams t1 ON m.HomeTeamID = t1.TeamID
JOIN Teams t2 ON m.AwayTeamID = t2.TeamID;

-- Retrieve all goals scored in a specific match
SELECT g.GoalID, g.GoalTime, p.PlayerName, t.TeamName
FROM Goals g
JOIN Players p ON g.PlayerID = p.PlayerID
JOIN Teams t ON p.TeamID = t.TeamID
WHERE g.MatchID = 1;

-- Retrieve the list of players with their age and position
SELECT PlayerName, Age, Position
FROM Players;

-- Corrected query to retrieve all players and their teams
--INNER JOIN
SELECT * 
from Teams 
INNER JOIN Players ON Teams.TeamID = Players.TeamID;

--NATURAL JOIN
SELECT * 
FROM Teams 
NATURAL JOIN Players;

--LEFT OUTER JOIN
SELECT *
FROM Teams 
LEFT OUTER JOIN Players ON Teams.TeamID = Players.TeamID;

--RIGHT OUTER JOIN
SELECT *
FROM Teams 
RIGHT OUTER JOIN Players ON Teams.TeamID = Players.TeamID;

--FULL OUTER JOIN
SELECT *
FROM Teams 
FULL OUTER JOIN Players ON Teams.TeamID = Players.TeamID;

--LEFT JOIN EXCLUDING INNER JOIN
SELECT *
FROM Teams 
LEFT JOIN Players ON Teams.TeamID = Players.TeamID
WHERE Players.TeamID IS NULL;

--Right Join Excluding Inner Join
SELECT *
FROM Teams 
RIGHT JOIN Players ON Teams.TeamID = Players.TeamID
WHERE Teams.TeamID IS NULL;

--Full Outer Excluding Inner Join
SELECT *
FROM Teams 
FULL OUTER JOIN Players ON Teams.TeamID = Players.TeamID
WHERE Teams.TeamID IS NULL;

--Cross Join
SELECT *
FROM Teams 
CROSS JOIN Players 
SELECT Teams.TeamID = Players.TeamID;