# Use the official Python image as the base image
FROM python:3.8-slim

# Set environment variables
ENV AIRFLOW_HOME=/usr/local/airflow

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libssl-dev \
        libffi-dev \
        libpq-dev \
        python3-dev \
        python3-pip \
        default-libmysqlclient-dev \
        curl \
        git \
        gnupg2 \
        libyaml-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Airflow with extras
RUN pip install apache-airflow[async,celery,crypto,docker,postgres,kubernetes,password,redis,ssh]==2.1.2

# Initialize Airflow database
RUN airflow db init

# Copy initialization script
COPY init.sh /usr/local/airflow/init.sh
COPY start_airflow.sh /usr/local/airflow/start_airflow.sh

# Set execute permissions for the script
RUN chmod +x /usr/local/airflow/start_airflow.sh 
RUN chmod +x /usr/local/airflow/init.sh

# Expose the webserver and scheduler ports
EXPOSE 8080

# Start Airflow using startup script
CMD ["/bin/bash", "-c", "/usr/local/airflow/start_airflow.sh; /usr/local/airflow/init.sh"]


