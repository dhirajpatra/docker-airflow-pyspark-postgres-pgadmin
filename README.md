**Data Engineering End-to-End Application Demo**

This repository provides a template for building a data engineering end-to-end application demo using Docker, PySpark, Airflow, PostgreSQL, and pgAdmin. This README will guide you through setting up and running the application demo.

### Context

Aspiring data engineers often require hands-on experience with tools and technologies commonly used in the industry. This application demo provides a structured environment for learning and practicing data engineering concepts, including ETL pipelines, data processing with PySpark, workflow orchestration with Airflow, and database management with PostgreSQL and pgAdmin.

### Getting Started

Follow these steps to set up and run the data engineering application demo:

1. **Clone the Repository**: Clone this repository to your local machine.

2. **Install Docker**: Ensure that Docker is installed on your system. If not, download and install Docker from [Docker's official website](https://www.docker.com/get-started).

3. **Navigate to the Repository**: Open a terminal and navigate to the root directory of the cloned repository.

4. **Build Docker Containers**: Run the following command to build the Docker containers:

    ```bash
    docker-compose build
    ```

5. **Start Docker Containers**: Once the build process is complete, start the Docker containers using the following command:

    ```bash
    docker-compose up
    ```

You may also require these following command to run after all docker containers run successfully.

`docker-compose exec airflow /bin/bash`
`airflow users create --role Admin --username admin --password admin --email admin@example.com --firstname Admin --lastname User`
`exit`

`docker-compose restart airflow`

6. **Access Airflow Web Interface**: Open a web browser and navigate to `http://localhost:8080` to access the Airflow web interface. Use the default credentials (`admin`/`admin`) to log in.

7. **Access pgAdmin**: Open a web browser and navigate to `http://localhost:8081` to access pgAdmin. Log in with the default credentials (`email: admin@admin.com` / `password: admin`).

8. **Explore and Run DAGs**: Explore the DAGs (Directed Acyclic Graphs) available in Airflow and run them to see the ETL pipelines in action.

9. **Interact with PySpark**: Use Jupyter notebooks available in the `notebooks` directory to interact with PySpark and perform data processing tasks.

### Repository Structure

- **airflow**: Contains Airflow configuration files and DAGs for workflow orchestration.
- **notebooks**: Contains Jupyter notebooks for PySpark data processing tasks.
- **postgres**: Contains Dockerfile and initialization scripts for PostgreSQL database setup.
- **data**: Directory to store data files used in the demo.

### Additional Resources

- [Docker Documentation](https://docs.docker.com/)
- [Airflow Documentation](https://airflow.apache.org/docs/apache-airflow/stable/index.html)
- [PySpark Documentation](https://spark.apache.org/docs/latest/api/python/index.html)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

### Contributing

Contributions to enhance this data engineering application demo are welcome! Feel free to submit pull requests with improvements or suggestions.

### License

This project is licensed under the [MIT License](LICENSE).

### Acknowledgments

Special thanks to the open-source community for providing the tools and frameworks used in this demo.

---

This README provides a starting point for aspiring data engineers to get familiar with the end-to-end data engineering application demo. Feel free to customize and expand upon it as needed. Happy data engineering!


### Advance Steps to Process Data 

Download any retail sales data. And convert it to csv.
Create new database sales in pgsql by

`docker exec -it -u postgres postgres psql -U postgres -p 5432`

Import the csv data by pgadmin to sales databaes.



