#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Get/print data from games.csv
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip header line
  if [[ $YEAR != "year" ]]
  then
    # Insert winners then opponents into teams db
    $PSQL "INSERT INTO teams (name) VALUES ('$WINNER') ON CONFLICT DO NOTHING"
    $PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT') ON CONFLICT DO NOTHING"
  fi
  # Skip headers again for games data
  if [[ $YEAR != "year" ]]
  then
    # Get winner_id & opponent_id from teams db
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    # Validate winner/opponent ids
    if [[ ! -z $WINNER_ID ]]
    then
      # Insert data to table
      $PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS') ON CONFLICT DO NOTHING"
    fi
  fi
done