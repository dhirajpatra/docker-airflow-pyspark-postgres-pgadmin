#!/bin/bash

# Initialize Airflow database
airflow db init

# Create admin user if it doesn't exist
if [[ ! -f /usr/local/airflow/.admin_created ]]; then
    airflow users create \
        --role Admin \
        --username admin \
        --password admin \
        --email admin@example.com \
        --firstname Admin \
        --lastname User
    touch /usr/local/airflow/.admin_created
fi

# Start Airflow webserver
exec airflow webserver
