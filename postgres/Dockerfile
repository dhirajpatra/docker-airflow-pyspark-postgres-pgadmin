FROM postgres:14-alpine

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD mysecretpassword
ENV POSTGRES_DB airflow

COPY postgres-init/init.sql /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/init.sql

EXPOSE 5432

CMD ["postgres"]