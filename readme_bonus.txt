# Soccer Database Web Application

## Overview
This project is a web application for exploring a soccer database. It provides a simple interface to query and view information about players, games, clubs, and competitions. The application uses a PostgreSQL database to store and manage the data and is built with Streamlit, a Python web framework.

## Features
1. *Players Page:* Query information about soccer players, including filtering by market value, position, country of birth, height, and age.

2. *Games Page:* Explore game information, including details about competitions, attendance, season, and date range.

3. *Clubs Page:* Find information about clubs, including filtering by domestic competition, average age, squad size, and stadium capacity.

4. *Competitions Page:* View competition data, including filtering by country, name, and type.

5. *Custom Query Page:* Run custom SQL queries directly against the database to explore other aspects of the soccer data.

## Technologies
- *Python:* The programming language used to build the application.
- *Streamlit:* A Python web framework for creating data applications.
- *Pandas:* For data manipulation and transformation.
- *SQLAlchemy:* An ORM library for interacting with the PostgreSQL database.
- *PostgreSQL:* The database system used to store and manage soccer data.

## Installation
1. *Python and Virtual Environment:*
   - Install Python (version 3.8 or higher).
   - Create a virtual environment:

   bash
   python -m venv venv
   

   - Activate the virtual environment:

   bash
   # Windows
   venv\Scripts\activate

   # macOS/Linux
   source venv/bin/activate
   

2. *Install Dependencies:*

   bash
   pip install -r requirements.txt
   

   Ensure the following packages are included in requirements.txt:
   - streamlit
   - pandas
   - sqlalchemy
   - psycopg2

3. *Database Configuration:*
   - Set up a PostgreSQL database and import the soccer data.
   - Modify the database URI in the code to match your database credentials and setup.

   python
   db_uri = "postgresql+psycopg2://username:password@localhost:5432/soccer"
   

4. *Running the App:*

   bash
   streamlit run app.py
   

   This will launch the web application in your default web browser.

## Usage
1. *Navigating the Application:*
   - Use the sidebar to navigate between pages.
   - Choose from predefined queries or enter custom inputs to filter results.

2. *Custom Queries:*
   - On the "Custom Query" page, input an SQL query to run directly against the database.

3. *Error Handling:*
   - The application includes basic error handling. If an error occurs while running a query, an error message will be displayed.

## Contributing
If you'd like to contribute to this project, please open a pull request on GitHub, or contact the author directly.

## Author
Manish Chetlapally

---

Feel free to adjust or expand on any section to suit your specific needs!