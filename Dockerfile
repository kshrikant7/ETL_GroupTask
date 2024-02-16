# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# 
ARG OPENWEATHER_API_KEY 
ARG IRCTC_API_KEY 
ARG IRCTC_API_HOST 
ARG MYSQL_HOST 
ARG MYSQL_USER 
ARG MYSQL_PASSWORD 
ARG MYSQL_DATABASE

ENV OPENWEATHER_API_KEY=$OPENWEATHER_API_KEY
ENV IRCTC_API_KEY=$IRCTC_API_KEY
ENV IRCTC_API_HOST=$IRCTC_API_HOST
ENV MYSQL_HOST=$MYSQL_HOST
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_DATABASE=$MYSQL_DATABASE

# Make port 80 available to the world outside this container
EXPOSE 80

# Run test.py when the container launches
ENTRYPOINT ["python", "main.py"]