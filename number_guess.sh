#!/bin/bash
# Number Guessing Game by electricvoices via freeCodeCamp rdb-alpha

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Ask for input
echo "Enter your username:"
read -r USERNAME

# Search based on 1st input
USER_SEARCH=$($PSQL "SELECT username FROM usernames WHERE username = '$USERNAME'")
# If no match was found that way, insert to the DB
if [[ -z $USER_SEARCH ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  USER_INSERT=$($PSQL "INSERT INTO usernames (username) VALUES ('$USERNAME')")
else
  # Pulls username info upon match
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE username = '$USERNAME'")
  # Sanity check in case nothing
  if [[ -z $BEST_GAME ]]; then BEST_GAME=0; fi
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Random number generator for 1-1000
SECRET_NUMBER=$(( (RANDOM % 1000) + 1 ))

echo "Guess the secret number between 1 and 1000:"
GUESSES=0

# Main loop logic
while true; do
  read -r GUESS
  ((GUESSES++)) # <- Auto-increments easily
  # Validate that GUESS is an integer
  if [[ ! "$GUESS" =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi
  # Break out of loop upon correct answer
  if [[ "$GUESS" -eq "$SECRET_NUMBER" ]]; then
    break
  fi
  # If guess is lower than secret_number
  if [[ "$GUESS" -lt "$SECRET_NUMBER" ]]; then
    echo "It's higher than that, guess again:"
  else
    # If guess is higher than secret_number
    echo "It's lower than that, guess again:"
  fi
done

echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

INSERT_GAME=$($PSQL "INSERT INTO games (username, guesses) VALUES ('$USERNAME', '$GUESSES')")