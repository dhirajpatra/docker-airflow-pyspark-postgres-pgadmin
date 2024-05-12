-- Check if the database exists before creating it
SELECT 'CREATE DATABASE airflow' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'airflow');

-- Connect to the airflow database
\connect airflow
