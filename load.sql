
-- SQL script to load data into tables from CSV files
SET DATESTYLE TO "European, DMY";
-- Loading data into Competitions
COPY competitions
FROM '/Users/manishchetlapally/Documents/Spring 2024/DMQL/DMQLProject/Soccer/competitions.csv' DELIMITER ',' CSV HEADER;

-- Loading data into Clubs
COPY clubs
FROM '/Users/manishchetlapally/Documents/Spring 2024/DMQL/DMQLProject/Soccer/clubs.csv' DELIMITER ',' CSV HEADER;
-- Loading data into Players
COPY players
FROM '/Users/manishchetlapally/Documents/Spring 2024/DMQL/DMQLProject/Soccer/players.csv' DELIMITER ',' CSV HEADER;

-- Loading data into Games
COPY games
FROM '/Users/manishchetlapally/Documents/Spring 2024/DMQL/DMQLProject/Soccer/games.csv' DELIMITER ',' CSV HEADER;

-- Loading data into Player Valuations
COPY player_valuations
FROM '/Users/manishchetlapally/Documents/Spring 2024/DMQL/DMQLProject/Soccer/player_valuations.csv' DELIMITER ',' CSV HEADER;

-- Loading data into Game Lineups
COPY game_lineups
FROM '/Users/manishchetlapally/Documents/Spring 2024/DMQL/DMQLProject/Soccer/game_lineups.csv' DELIMITER ',' CSV HEADER;

-- Loading data into Game Events
COPY game_events
FROM '/Users/manishchetlapally/Documents/Spring 2024/DMQL/DMQLProject/Soccer/game_events.csv' DELIMITER ',' CSV HEADER;

-- Loading data into Club Games
COPY club_games
FROM '/Users/manishchetlapally/Documents/Spring 2024/DMQL/DMQLProject/Soccer/club_games.csv' DELIMITER ',' CSV HEADER;

-- Loading data into Appearances
COPY appearances
FROM '/Users/manishchetlapally/Documents/Spring 2024/DMQL/DMQLProject/Soccer/appearances.csv' DELIMITER ',' CSV HEADER;





