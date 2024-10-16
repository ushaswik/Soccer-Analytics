-- SQL script to create tables for the Soccer Database, adjusted for compatibility

-- Competitions table
CREATE TABLE IF NOT EXISTS Competitions (
    competition_id TEXT PRIMARY KEY,
    competition_code TEXT,
    name TEXT NOT NULL,
    sub_type TEXT,
    type TEXT,
    country_id INTEGER,
    country_name TEXT,
    domestic_league_code TEXT
);

-- Games table
CREATE TABLE IF NOT EXISTS Games (
    game_id TEXT PRIMARY KEY,
    competition_id TEXT REFERENCES Competitions(competition_id),
    season TEXT,
    round TEXT,
    date DATE,
    home_club_id TEXT,
    away_club_id TEXT,
    home_club_goals INTEGER,
    away_club_goals INTEGER,
    home_club_position TEXT,
    away_club_position TEXT,
    home_club_manager_name TEXT,
    away_club_manager_name TEXT,
    stadium TEXT,
    attendance DOUBLE PRECISION,
    referee TEXT,
    home_club_formation TEXT,
    away_club_formation TEXT,
    home_club_name TEXT,
    away_club_name TEXT,
    aggregate TEXT,
    competition_type TEXT
);

-- Clubs table
CREATE TABLE IF NOT EXISTS Clubs (
    club_id TEXT PRIMARY KEY,
    club_code TEXT,
    name TEXT NOT NULL,
    domestic_competition_id TEXT REFERENCES Competitions(competition_id),
    squad_size INTEGER,
    average_age DOUBLE PRECISION,
    foreigners_number INTEGER,
    foreigners_percentage DOUBLE PRECISION,
    national_team_players INTEGER,
    stadium_name TEXT,
    stadium_seats INTEGER,
    net_transfer_record TEXT,
    last_season INTEGER
);

-- Players table
CREATE TABLE IF NOT EXISTS Players (
    player_id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    name TEXT NOT NULL,
    last_season INTEGER,
    current_club_id TEXT REFERENCES Clubs(club_id),
    player_code TEXT,
    country_of_birth TEXT,
    city_of_birth TEXT,
    country_of_citizenship TEXT,
    date_of_birth DATE,
    sub_position TEXT,
    position TEXT,
    foot TEXT,
    height_in_cm DOUBLE PRECISION,
    contract_expiration_date DATE,
    agent_name TEXT,
    current_club_domestic_competition_id TEXT,
    current_club_name TEXT,
    market_value_in_eur DOUBLE PRECISION,
    highest_market_value_in_eur DOUBLE PRECISION
);

-- Player_Valuations table
CREATE TABLE IF NOT EXISTS Player_Valuations (
    player_id TEXT REFERENCES Players(player_id),
    date DATE,
    market_value_in_eur DOUBLE PRECISION,
    current_club_id TEXT,
    player_club_domestic_competition_id TEXT
);

-- Game_Lineups table
CREATE TABLE IF NOT EXISTS Game_Lineups (
    game_lineup_id TEXT PRIMARY KEY,
    game_id TEXT REFERENCES Games(game_id),
    club_id TEXT,
    type TEXT,
    number DOUBLE PRECISION ,
    player_id TEXT REFERENCES Players(player_id),
    player_name TEXT,
    team_captain DOUBLE PRECISION, 
    position TEXT
);

-- Game_Events table
CREATE TABLE IF NOT EXISTS Game_Events (
    game_event_id TEXT PRIMARY KEY,
    date DATE,
    game_id TEXT REFERENCES Games(game_id),
    minute INTEGER,
    type TEXT,
    club_id TEXT,
    player_id TEXT REFERENCES Players(player_id),
    description TEXT,
    player_in_id TEXT  
);

-- Club_Games table
CREATE TABLE IF NOT EXISTS Club_Games (
    game_id TEXT REFERENCES Games(game_id),
    club_id TEXT REFERENCES Clubs(club_id),
    own_goals INTEGER,
    own_position TEXT,  
    own_manager_name TEXT,
    opponent_id TEXT,
    opponent_goals INTEGER,
    opponent_position TEXT,
    opponent_manager_name TEXT,
    hosting TEXT,  
    is_win BOOLEAN  
);

-- Appearances table
CREATE TABLE IF NOT EXISTS Appearances (
    appearance_id TEXT PRIMARY KEY,
    game_id TEXT REFERENCES Games(game_id),
    player_id TEXT REFERENCES Players(player_id),
    player_club_id TEXT,
    player_current_club_id TEXT,
    date DATE,
    player_name TEXT,
    competition_id TEXT REFERENCES Competitions(competition_id),
    yellow_cards INTEGER,
    red_cards INTEGER,
    goals INTEGER,
    assists INTEGER,
    minutes_played INTEGER
);
