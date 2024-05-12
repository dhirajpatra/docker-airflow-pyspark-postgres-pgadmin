`docker-compose exec airflow /bin/bash`
`airflow users create --role Admin --username admin --password admin --email admin@example.com --firstname Admin --lastname User`
`exit`

`docker-compose restart airflow`