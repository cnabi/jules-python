# Python Frontend Login Page with Nginx and Flask

This project demonstrates a simple frontend login page served by Nginx and powered by a Flask backend, all containerized using Docker.

## Prerequisites

Before you begin, ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## How to Build and Run

1.  **Clone the repository (if you haven't already):**
    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2.  **Build the Docker image and start the services:**
    Use Docker Compose to build the image defined in the `Dockerfile` and run the application.
    ```bash
    docker-compose build
    ```
    This command builds the Docker image for the `web` service.

3.  **Start the application:**
    ```bash
    docker-compose up
    ```
    This command starts the Nginx and Flask (via Gunicorn) services as defined in `docker-compose.yml` and `supervisord.conf`. You should see logs from both Nginx and the Flask application.

## How to Access the Application

Once the application is running, open your web browser and navigate to:
[http://localhost:80](http://localhost:80)

You should see the login page. Submitting the form will send a POST request to the Flask backend, and you'll see output in the console where `docker-compose up` is running.

## Project Structure Overview

```
.
├── Dockerfile              # Defines the Docker image for the application
├── docker-compose.yml      # Defines services, networks, and volumes for Docker Compose
├── nginx.conf              # Nginx configuration, serves static files and proxies to Flask
├── supervisord.conf        # Supervisor configuration to manage Nginx and Gunicorn
├── app.py                  # Flask application with the /login route
├── requirements.txt        # Python dependencies (Flask, Gunicorn)
├── project_static_nginx/   # Directory for static assets served by Nginx
│   ├── index.html          # The login page HTML
│   └── style.css           # CSS for the login page
└── README.md               # This file
```

Key components:
-   **`Dockerfile`**: Builds the environment with Python, Nginx, Supervisor, and application code.
-   **`docker-compose.yml`**: Orchestrates the build and run process, mapping port 80 and application files.
-   **`nginx.conf`**: Configured to serve static files from `/app/project_static_nginx` and proxy `/login` requests to the Flask application running on port 5000.
-   **`supervisord.conf`**: Manages the Nginx and Gunicorn processes within the container.
-   **`app.py`**: A minimal Flask application that handles POST requests to `/login`.
-   **`project_static_nginx/`**: Contains the static HTML (`index.html`) and CSS (`style.css`) for the login page.
```
