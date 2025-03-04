--Table containing attributes such as club names, stadiums where the clubs play and the coaches of each club
CREATE TABLE Clubs (
    Club_ID INT PRIMARY KEY,
    club_name VARCHAR(50) NOT NULL,
    stadium VARCHAR(50) NOT NULL,
    coach VARCHAR(50) NOT NULL
);

--Players table containing information for each player from the different clubs
CREATE TABLE Players (
    Player_ID INT PRIMARY KEY,
    player_name VARCHAR(50) NOT NULL,
    market_value INT,
    position VARCHAR(50)
);

--Games table. Contain data on the different games played and when.
CREATE TABLE Games (
    Game_ID INT PRIMARY KEY,
    date DATE,
    stadium VARCHAR(50) NOT NULL,
    CONSTRAINT fk_Clubs FOREIGN KEY (stadium) REFERENCES Clubs(stadium)
);

--GameResults table contains data on the different games played by the clubs and the goals scored by each player
CREATE TABLE GameResults (
    Game_ID INT,
    Player_ID INT,
    goals_scored INT,
    CONSTRAINT fk_Games FOREIGN KEY (Game_ID) REFERENCES Games(Game_ID),
    CONSTRAINT fk_Players FOREIGN KEY (Player_ID) REFERENCES Players(Player_ID),
    PRIMARY KEY (Game_ID, Player_ID)
);

INSERT INTO Clubs (Club_ID, club_name, stadium, coach) VALUES
  (101, 'Supa Strikas', 'Peter Mokaba Stadium', 'Samuel Cambra'),
  (102, 'Cradle Moons', 'FNB Stadium', 'Dawie Du Plessis'),
  (103, 'Hungry Lions', 'Moses Mabida Stadium', 'Isaac Murinyu'),
  (104, 'El Matadores', 'Sagrada Stadium', 'Peter Scott'),
  (105, 'Twisting Tigers', 'Pearl Bay Stadium', 'Quinton Nkhoma'),
  (106, 'Dancing Rastas', 'Strikaland', 'Adam Bethelson'),
  (107, 'Green Bay Giants', 'Goliath Stadium', 'Kuhle Nkonki'),
  (108, 'Grinning Smalls', 'Olive Heights Stadium', 'David Thompson'),
  (109, 'Swallows', 'Hogwarts Stadium', 'Brian Godwin'),
  (110, 'Ravenclaws', 'Draco Potter Stadium', 'Daniel Garcia');

INSERT INTO Players (Player_ID, player_name, market_value, position) VALUES
  (201, 'Lloyd Wright', 80000, 'Striker'),
  (202, 'David Jardim', 750000, 'Mid Fielder'),
  (203, 'Daniele Minidio', 900000, 'Goal keeper'),
  (204, 'Anesu Mandengu', 500000, 'Defender'),
  (205, 'Troy Bent', 440000, 'Defender'),
  (206, 'Angelo Rube', 290000, 'Attack'),
  (207, 'Gustavo Nienov', 500000, 'Goal keeper'),
  (208, 'Jared Naidoo', 700000, 'Goal keeper'),
  (209, 'Jireh Rusagara', 780000, 'Center back'),
  (210, 'Kushinga Mangena', 990000, 'Forward');

INSERT INTO Games (Game_ID, date, stadium) VALUES
  (301, '2024-02-01', 'Peter Mokaba Stadium'),
  (302, '2024-02-10', 'Moses Mabida Stadium'),
  (303, '2024-02-17', 'FNB Stadium'),
  (304, '2024-02-29', 'Strikaland'),
  (305, '2024-03-08', 'Goliath Stadium'),
  (306, '2024-03-17', 'Hogwarts Stadium'),
  (307, '2024-03-26', 'Olive Heights Stadium'),
  (308, '2024-03-31', 'Sagrada Stadium'),
  (309, '2024-04-03', 'Draco Potter Stadium'),
  (310, '2024-04-07', 'Pearl Bay Stadium');

INSERT INTO GameResults (Game_ID, Player_ID, goals_scored) VALUES
  (301, 201, 6),
  (302, 202, 10),
  (303, 203, 2),
  (304, 204, 15),
  (305, 205, 4),
  (306, 206, 7),
  (307, 207, 0),
  (308, 208, 1),
  (309, 209, 20),
  (310, 210, 3);

SELECT 
    p.player_name,
    p.market_value,
    c.club_name
FROM 
    Players p
JOIN 
    Clubs c ON p.position = c.Club_ID
ORDER BY 
    p.market_value DESC
LIMIT 10;

