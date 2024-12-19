1. Dockerfile:

```Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.7-slim as build

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Use multi-stage builds to create a lean production image
FROM python:3.7-slim as production

WORKDIR /app

# Copy the necessary files from the build stage
COPY --from=build /app /app

# Make port 80 available to the world outside this container
EXPOSE 80

# Run the application when the container launches
CMD ["python", "app.py"]
```

2. Containerization script:

```bash
#!/bin/bash

# Build the Docker image
docker build -t my-web-app .

# Run the Docker container
docker run -p 80:80 my-web-app
```

Please replace `requirements.txt` and `app.py` with your actual Python dependencies file and application file. Also, replace `my-web-app` with your preferred Docker image name.

This Dockerfile and script are a basic example and might need to be adjusted based on the specific needs of your application. For example, if your application requires environment variables, you would need to add those to your Dockerfile and script.