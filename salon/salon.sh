#!/bin/bash

# Set PSQL command shortcut
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# Welcome message
echo "~~~~~ MY SALON ~~~~~"
echo "Welcome to My Salon, how can I help you?"

# Function to display services directly fetched from the database
display_services() {
  echo $($PSQL "SELECT service_id || ') ' || trim(name) FROM services ORDER BY service_id;")
}

# Validate and handle service selection
while true; do
    display_services
    echo -e "\nEnter the number of the service you want:"
    read SERVICE_ID_SELECTED
    SERVICE_NAME=$($PSQL "SELECT trim(name) FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
    
    if [[ -z $SERVICE_NAME ]]; then
      echo "I could not find that service. What would you like today?"
    else
      break
    fi
done

# Get customer details
echo "What's your phone number?"
read CUSTOMER_PHONE

# Check if the customer exists and get or insert customer details
CUSTOMER_EXISTS=$($PSQL "SELECT trim(name) FROM customers WHERE phone = '$CUSTOMER_PHONE';")
if [[ -z $CUSTOMER_EXISTS ]]; then
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  $PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');"
else
  CUSTOMER_NAME=$CUSTOMER_EXISTS
fi

# Prompt for appointment time
echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# Insert the appointment into the database
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
$PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');"

# Confirmation message
echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
