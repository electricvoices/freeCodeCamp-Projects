#!/bin/bash

# --- Working version 1.0 by electricvoices --- +

# --- PSQL Connection for queries --- +
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

SEARCH_INPUT=$1

# --- If nothing is passed as an argument ---- +
if [[ -z $SEARCH_INPUT ]]; then
  echo "Please provide an element as an argument."
  exit
fi

# --- Numbers match atomic_number, everything else symbol/name --- +
if [[ $SEARCH_INPUT =~ ^[0-9]+$ ]]; then
  CONDITION="p.atomic_number = $SEARCH_INPUT"
else
  CONDITION="e.symbol = '$SEARCH_INPUT' OR e.name = '$SEARCH_INPUT'"
fi


# --- Query the database --- +
RESULTS=$($PSQL "SELECT p.atomic_number, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, e.symbol, e.name, t.type FROM properties p JOIN elements e ON p.atomic_number = e.atomic_number JOIN types t ON p.type_id = t.type_id WHERE $CONDITION")

# --- No matches --- +
if [[ -z $RESULTS ]]; then
  echo "I could not find that element in the database."
else
  echo "$RESULTS" | while IFS="|" read -r ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT SYMBOL NAME TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
fi
