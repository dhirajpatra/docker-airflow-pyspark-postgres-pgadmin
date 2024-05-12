#!/bin/bash

# db init
airflow db init &

# Start the Airflow webserver in the background
airflow webserver -p 8080 &

# Start the Airflow scheduler
exec airflow scheduler

