# 1. Start from a Python base image
FROM python:3.9-slim

# 2. Set a working directory
WORKDIR /app

# 3. Install Nginx and supervisor
RUN apt-get update && \
    apt-get install -y nginx supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 4. Copy Python requirements
COPY requirements.txt .

# 5. Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 6. Copy the application code and static files
COPY app.py .
COPY project_static_nginx/ ./project_static_nginx/
COPY nginx.conf /etc/nginx/nginx.conf

# 7. Copy a supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Create log directory for supervisor
RUN mkdir -p /var/log/supervisor

# 8. Expose port 80 (for Nginx)
EXPOSE 80

# 9. Set the command to run supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
