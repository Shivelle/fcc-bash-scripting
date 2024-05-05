#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

WELCOME() {
  echo -e "\n~~~~~ Number Guessing Game ~~~~~\n" 
  echo "Enter your username:"
  read USERNAME

  USER_ID=$($PSQL "SELECT id FROM users WHERE username = '$USERNAME'")

  if [[ $USER_ID ]]; then
    GAMES_PLAYED=$($PSQL "SELECT count(user_id) FROM games WHERE user_id = '$USER_ID'")
    BEST_GUESS=$($PSQL "SELECT min(guesses) FROM games WHERE user_id = '$USER_ID'")

    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
  else
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    INSERTED_TO_USERS=$($PSQL "insert into users(username) values('$USERNAME')")
    USER_ID=$($PSQL "SELECT id FROM users WHERE username = '$USERNAME'")
  fi

  GAME
}

GAME() {
  SECRET=$((1 + $RANDOM % 1000))
  TRIES=0
  GUESSED=0
  echo -e "\nGuess the secret number between 1 and 1000:"

  while [[ $GUESSED = 0 ]]; do
    read GUESS
    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
      echo -e "\nThat is not an integer, guess again:"
    elif [[ $SECRET = $GUESS ]]; then
      TRIES=$(($TRIES + 1))
      echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET. Nice job!"
      INSERTED_TO_GAMES=$($PSQL "insert into games(user_id, guesses) values($USER_ID, $TRIES)")
      GUESSED=1
    elif [[ $SECRET -gt $GUESS ]]; then
      TRIES=$(($TRIES + 1))
      echo -e "\nIt's higher than that, guess again:"
    else
      TRIES=$(($TRIES + 1))
      echo -e "\nIt's lower than that, guess again:"
    fi
  done
}

WELCOME
