# Use an official Python runtime as a base image
FROM python:3.3-slim

# Set the maintainer name and email id
MAINTAINER Ganesh Sharma <ganeshsharmait@gmail.com>

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Run app.py when the container launches
CMD ["python3", "app.py"]
