# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install required packages
RUN pip install --no-cache-dir flask flask-restful

# Expose the port the API will run on
EXPOSE 5000

# Command to run the API when the container is started
CMD ["python", "app.py"]