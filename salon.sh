#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\nMon-Mon's Salon\n"

# Print list of available services
LIST_SERVICES() {
  echo "Services available:"
  echo "1) Haircut  2) Color  3) Style"
}

# Introduction menu
echo "Welcome to my salon! How may I help you?"
LIST_SERVICES
read SERVICE_ID_SELECTED

# Validate user input
if [[ ! $SERVICE_ID_SELECTED =~ ^[123]$ ]]; then
  echo "Could not find that service, please try again."
  LIST_SERVICES
else
  # Get name of service requested
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
fi

# Get phone & time input
echo -e "\nWhat is your phone number?"
read CUSTOMER_PHONE
    
#Lookup customer info
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# If doesn't exist
if [[ -z $CUSTOMER_NAME ]]; then
  echo -e "\nEnter your name:"
  read CUSTOMER_NAME
  # Insert new customer to the db
  $PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
fi

# Appointment Booking time
echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME? (ex. HH:MM)"
read SERVICE_TIME
    
# Validate time input (HH:MM only)
if [[ ! $SERVICE_TIME =~ ^[0-2][0-9]:[0-5][0-9]$ ]]; then
  echo "Unable to validate time-entry. Please try again (HH:MM):"
fi

# Lookup customer_id for appointment
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# Insert appointment to the db
$PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"

# Confirmation message
echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."