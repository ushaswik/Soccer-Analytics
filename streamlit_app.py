import streamlit as st
import pandas as pd
from sqlalchemy import create_engine

# Define the database connection URI
db_uri = "postgresql+psycopg2://chmanish2807:chmanish2807@localhost:5432/soccer"
engine = create_engine(db_uri)

def run_query(query):
    """Executes a SQL query and returns the results as a DataFrame."""
    with engine.connect() as connection:
        return pd.read_sql(query, connection)

# Streamlit app structure
st.title("Soccer Database")

# Page navigation
page = st.sidebar.radio(
    "Go to",
    ["Players", "Games", "Clubs", "Competitions", "Custom Query"]
)

# Players page
if page == "Players":
    st.header("Players")

    players_query_options = [
        "Players by Market Value",
        "Players by Position",
        "Players by Country of Birth",
        "Players by Height",
        "Players by Age"
    ]

    selected_player_query = st.selectbox("Select a player query:", players_query_options)

    if selected_player_query == "Players by Market Value":
        player_query = "SELECT * FROM players ORDER BY market_value_in_eur DESC LIMIT 10;"
    elif selected_player_query == "Players by Position":
        position = st.text_input("Enter position (e.g., 'Defender', 'Midfielder'):")
        player_query = f"""
        SELECT * FROM players WHERE position = '{position}' LIMIT 10;
        """
    elif selected_player_query == "Players by Country of Birth":
        country = st.text_input("Enter country of birth (e.g., 'Brazil', 'Spain'):")
        player_query = f"""
        SELECT * FROM players WHERE country_of_birth = '{country}' LIMIT 10;
        """
    elif selected_player_query == "Players by Height":
        min_height = st.number_input("Min Height (cm):", min_value=150, max_value=250, step=1)
        max_height = st.number_input("Max Height (cm):", min_value=150, max_value=250, step=1)
        player_query = f"""
        SELECT * FROM players WHERE height_in_cm BETWEEN {min_height} AND {max_height} LIMIT 10;
        """
    elif selected_player_query == "Players by Age":
        min_age = st.number_input("Min Age:", min_value=16, max_value=50, step=1)
        max_age = st.number_input("Max Age:", min_value=16, max_value=50, step=1)
        player_query = f"""
        SELECT *, date_part('year', age(date_of_birth)) AS age FROM players 
        WHERE date_part('year', age(date_of_birth)) BETWEEN {min_age} AND {max_age} 
        LIMIT 10;
        """

    player_df = run_query(player_query)
    st.write(player_df)

# Games page
elif page == "Games":
    st.header("Games")

    games_query_options = [
        "Games with Competitions",
        "Games by Attendance",
        "Games by Season",
        "Games by Date Range"
    ]

    selected_game_query = st.selectbox("Select a game query:", games_query_options)

    if selected_game_query == "Games with Competitions":
        game_query = """
        SELECT g.*, comp.name AS competition_name
        FROM games g
        JOIN competitions comp ON g.competition_id = comp.competition_id;
        """
    elif selected_game_query == "Games by Attendance":
        game_query = "SELECT * FROM games ORDER BY attendance DESC LIMIT 10;"
    elif selected_game_query == "Games by Season":
        season = st.text_input("Enter season (e.g., '2023/2024'):")
        game_query = f"""
        SELECT * FROM games WHERE season = '{season}' LIMIT 10;
        """
    elif selected_game_query == "Games by Date Range":
        start_date = st.date_input("Start Date:")
        end_date = st.date_input("End Date:")
        game_query = f"""
        SELECT * FROM games WHERE date BETWEEN '{start_date}' AND '{end_date}' LIMIT 10;
        """

    game_df = run_query(game_query)
    st.write(game_df)

# Clubs page
elif page == "Clubs":
    st.header("Clubs")

    clubs_query_options = [
        "Clubs by Domestic Competition",
        "Clubs by Average Age",
        "Clubs by Squad Size",
        "Clubs by Stadium Capacity"
    ]

    selected_club_query = st.selectbox("Select a club query:", clubs_query_options)

    if selected_club_query == "Clubs by Domestic Competition":
        competition = st.text_input("Enter domestic competition (e.g., 'BE1', 'GR1', 'SE1','RU1'):")
        club_query = f"""
        SELECT * FROM clubs WHERE domestic_competition_id = '{competition}' LIMIT 10;
        """
    elif selected_club_query == "Clubs by Average Age":
        club_query = "SELECT * FROM clubs ORDER BY average_age DESC LIMIT 10;"
    elif selected_club_query == "Clubs by Squad Size":
        min_squad_size = st.number_input("Min Squad Size:", min_value=10, max_value=50, step=1)
        max_squad_size = st.number_input("Max Squad Size:", min_value=10, max_value=50, step=1)
        club_query = f"""
        SELECT * FROM clubs WHERE squad_size BETWEEN {min_squad_size} AND {max_squad_size} LIMIT 10;
        """
    elif selected_club_query == "Clubs by Stadium Capacity":
        club_query = "SELECT * FROM clubs ORDER BY stadium_seats DESC LIMIT 10;"

    club_df = run_query(club_query)
    st.write(club_df)

# Competitions page
elif page == "Competitions":
    st.header("Competitions")

    competitions_query_options = [
        "Competitions by Country",
        "Competitions by Name",
        "Competitions by Type"
    ]

    selected_competition_query = st.selectbox("Select a competition query:", competitions_query_options)

    if selected_competition_query == "Competitions by Country":
        country = st.text_input("Enter country (e.g., 'Italy', 'France'):")
        competition_query = f"""
        SELECT * FROM competitions WHERE country_name = '{country}' LIMIT 10;
        """
    elif selected_competition_query == "Competitions by Name":
        competition_query = "SELECT * FROM competitions ORDER BY name LIMIT 10;"
    elif selected_competition_query == "Competitions by Type":
        comp_type = st.text_input("Enter competition type (e.g., 'domestic_cup', 'domestic_league', 'international_cup', 'other'):")
        competition_query = f"""
        SELECT * FROM competitions WHERE type = '{comp_type}' LIMIT 10;
        """

    competition_df = run_query(competition_query)
    st.write(competition_df)

# Custom Query page
elif page == "Custom Query":
    st.header("Custom Query")

    # Input box for user-defined SQL query
    user_query = st.text_area("Enter your SQL query here:", "")

    # Button to execute the query
    if st.button("Run Query"):
        if user_query.strip():  # Check if the user has entered a query
            try:
                # Run and display the user-defined query
                result_df = run_query(user_query)
                st.write(result_df)
            except Exception as e:
                st.error(f"An error occurred: {e}")
        else:
            st.error("Please enter a valid SQL query.")
