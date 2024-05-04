#!/bin/bash

PSQL="psql -x --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
  then
    echo Please provide an element as an argument.
  else 
    if [[ ! $1 =~ ^[0-9]+$ ]]
    then
      ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol ILIKE '$1' OR name ILIKE '$1'")
    else
      ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number)INNER JOIN types USING(type_id) WHERE atomic_number=$1")
    fi

    if [[ -z $ELEMENT ]]
    then
      echo I could not find that element in the database.
    else
      echo $ELEMENT | while read COL BAR ATOMIC_NUMBER COL BAR NAME COL BAR SYMBOL COL BAR TYPE COL BAR ATOMIC_MASS COL BAR MELTING_POINT COL BAR BOILING_POINT
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    fi
fi