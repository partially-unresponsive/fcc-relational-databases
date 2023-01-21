#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Get all the info from games.csv database
# Enter all the data into variables separated by commas
echo "$($PSQL "TRUNCATE TABLE games, teams")"
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip the first row with the table columns
  if [[ $YEAR != 'year' ]]
  then
    # Main logic for each data row
    # Each row has all the columns included and all are unique, therefore they can be inputted as is without checking for repetition
    # String values need to be encompassed by single quotes '$VARIABLE'
    # WINNER and OPPONENT need to have their own WINNER_ID and OPPONENT_ID added into the teams first
    
    echo "$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"
    echo "$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
    
    # Get the respective WINNER_ID and OPPONENT_ID

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # Input games data into database

    echo "$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
    
  fi
done
